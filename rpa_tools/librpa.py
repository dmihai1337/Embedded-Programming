from config import Config
from helpers import get_root_path
from ssh import CommandExecutorThread, ExecutorCommand, ExecutorTerminatedException, RPAPlaceSSHConnection, RPAServerSSHConnection, SSHCommandException, SSHException

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from queue import Queue

import logging
import os
import re
import sys
import threading
import yaml


rpa_time_fmt = "%Y-%m-%d %H:%M.%S"


class QueuedException(Exception):
	""" raised when enqueued by rpa as no place can be returned at this point """

	pass


@dataclass
class VideoStream:
	name: str
	url: str

	def open(self, config: dict):
		quiet_opts = "" if config.get("debug_streams", False) else "2>/dev/null 1>/dev/null"
		cmd = f"{config['stream_cmd']} {self.url} {quiet_opts} &"
		logging.info(cmd)

		os.system(cmd)


class PlaceState(Enum):
	UNKNOWN = 0
	FREE = 1
	LOCKED = 2


class RPAStatus(Enum):
	UNKNOWN = 0
	ASSIGNED = 1
	WAITING = 2
	EXTENDED = 3
	INFO = 4
	REPLACE = 5
	BYE = 6
	REFUSE = 7

	@classmethod
	def from_string(cls, s: str):
		attr = cls.UNKNOWN
		try:
			attr = getattr(cls, s.upper())
		except AttributeError:
			pass

		return attr


@dataclass
class RPAResponse():
	status: RPAStatus
	reason: str = None
	host: str = None
	videostreams: [VideoStream] = None
	deadline: [datetime] = None

	@classmethod
	def from_yml_str(cls, msg: str):
		#logging.debug(msg)
		dct = yaml.load(msg, Loader=yaml.SafeLoader)

		r = cls(RPAStatus.from_string(dct["status"]))
		r.reason = dct.get("reason")
		r.host = dct.get("host")
		r.videostreams = []
		for name, url in dct.get("videostreams", {}).items():
			r.videostreams.append(VideoStream(name, url))

		try:
			r.deadline = datetime.strptime(dct.get("deadline", ""), rpa_time_fmt)
		except ValueError:
			r.deadline = None

		return r

	@property
	def name(self):
		try:
			return self.host.split('.')[0]
		except IndexError:
			return self.host
		except AttributeError:
			return None


class ConnectionStatus(Enum):
	UNKNOWN = 0
	UNASSIGNED = 1
	ASSIGNED = 2
	QUEUED = 3

	@classmethod
	def from_response(cls, r: RPAResponse):
		cs = cls.UNKNOWN
		if r.status == RPAStatus.ASSIGNED:
			cs = cls.ASSIGNED
		elif r.status == RPAStatus.INFO:
			if r.reason == "You are currently unknown.":
				cs = cls.UNASSIGNED
			elif r.reason == "You are currently in wait queue.":
				cs = cls.QUEUED
		return cs


@dataclass
class Place:
	""" Description of a single place known by rpa
	"""
	name: str
	state: PlaceState
	release_time: datetime = None

	def __str__(self):
		s = f"{self.name} is "
		if self.state == PlaceState.LOCKED:
			s += f"locked until {self.release_time}."
		elif self.state == PlaceState.FREE:
			s += "free."
		elif self.state == PlaceState.UNKNOWN:
			s += "in unknown state."
		return s

	@classmethod
	def from_locked(cls, line):
		m = re.match("(?P<name>ti\d+) .* (?P<state>locked) [^\d]+(?P<time>.*)", line)
		if m:
			try:
				time = datetime.strptime(m["time"], "%Y-%m-%d %H:%M.%S")
			except ValueError as e:
				logging.warning(f'Failed to parse date: {line}, leading to {e}')
				time = None
			return cls(m["name"], PlaceState.LOCKED, time)

	@classmethod
	def from_free(cls, line):
		m = re.match("(?P<name>ti\d+) .* (?P<state>ready and waiting)", line)
		if m:
			return cls(m["name"], PlaceState.FREE)

	@classmethod
	def from_unknown(cls, line):
		m = re.match("(?P<name>ti\d+)", line)
		if m:
			return cls(m["name"], PlaceState.UNKNOWN)


@dataclass
class Places:
	""" List of all places known by rpa
	"""

	header: str
	hosts: [Place] = field(default_factory=list)

	def __str__(self):
		return '\n'.join([self.header] + [str(host) for host in self.hosts])

	@classmethod
	def from_rpa_status_cmd(cls, response: iter):
		lines = response.splitlines()
		logging.debug(lines)

		c = Places(lines[0])
		for line in lines[1:]:
			p = Place.from_locked(line)
			if p is None:
				p = Place.from_free(line)
			if p is None:
				p = Place.from_unknown(line)
			if p is not None:
				c.hosts.append(p)
		return c

	def __iter__(self):
		for host in self.hosts:
			yield host

	def __getitem__(self, idx: int):
		return self.hosts[idx]


class RPAPlace(RPAPlaceSSHConnection):
	""" Locked place, allows to interact with connected hardware
		and access the videostreams
	"""

	def __init__(self, config: dict, host_url: str, videostreams: [VideoStream]):
		super().__init__(config, host_url)
		self.host_url = host_url
		self.videostreams: [VideoStream] = videostreams

	def getStreamURL(self, name):
		for stream in self.videostreams:
			if stream.name == name:
				return stream.url

		return None

	def getVideoStream(self, name):
		for vs in self.videostreams:
			if vs.name == name:
				return vs
		return None
		
	@property
	def name(self):
		try:
			return self.host_url.split('.')[0]
		except IndexError:
			return self.host_url

	def program(self, remote_filename):
		cmd = ["remote.py", "-p", os.path.join(".rpa_shell", remote_filename)]
		self.runCommand(cmd)


# TODO: error-handling
class RPAExecThread(threading.Thread):
	""" Handles RPA place locking and distributing updates
		like overtaken ownership / session extension / etc.
	"""

	def __init__(self, kwargs):
		super().__init__(target=self.__class__)
		self.outcome = kwargs["rpa_outcome"]
		self.outcome.clear()  # given as argument, might still be set from last lock
		self.queue = kwargs["queue"]
		self.runCmd = kwargs["runCmd"]
		self.rpa_cmd = ["rpa", "-V", "MESSAGE-SET=vlsi-yaml"]
		if kwargs["place"] is not None:
			self.rpa_cmd.extend(["want-host", kwargs["place"]])
		else:
			self.rpa_cmd.extend(["lock"])

		self.proc = None
		self._locked = None
		self.yml_lines = []

	def _update_lock_state(self, r):
		if r.status in [RPAStatus.ASSIGNED, RPAStatus.REPLACE, RPAStatus.EXTENDED]:
			self._locked = True
		else:
			self._locked = False

		self.outcome.r = r
		self.outcome.set()

	def _queueRPAResponse(self, line):
		""" process each line, update state und insert message into queue
			on completeness of every message
		"""

		MSG_COMPLETE = "---"

		if line == MSG_COMPLETE:
			r = RPAResponse.from_yml_str('\n'.join(self.yml_lines))
			self._update_lock_state(r)
			self.queue.put(r)
		else:
			self.yml_lines.append(line)

	def _execute_command(self):
		""" establish connection, continuously read messages as
			rpa publishes updates
		"""

		logging.debug(self.rpa_cmd)

		# allocate pty to kill rpa when connection goes down
		with self.runCmd(self.rpa_cmd, ssh_args=["-tt"]) as p:
			self.proc = p

			while True:
				line = p.stdout.readline()
				if line == "":
					logging.debug("broken pipe, stopping exec thread")
					break  # broken pipe, stop reading
				else:
					self._queueRPAResponse(line.rstrip())

			logging.info("RPA process dead")

		logging.debug("RPAExecThread done")

	def run(self):
		self.outcome.r = None
		try:
			self._execute_command()
			self.outcome.r = self.proc
			logging.debug(self.proc)
		except Exception as e:
			logging.error(f"RPAExecThread died unexpectedly: {e}")
		finally:
			# might happen that RPAExcecThread dies without receiving a RPAResponse
			# e.g. when the connection fails
			# don't starve waiting threads in this case
			self.outcome.set()

	def terminate(self):
		if self.proc is not None:
			self.proc.terminate()

	@property
	def locked(self):
		return self._locked


class RPAClient(RPAServerSSHConnection):
	""" Query ConnectionState/LockState and actually lock a place.

	"""

	config_class = Config
	default_config = {
		"username": None,
		"identity": None,
		"rpaserver": "ssh.tilab.tuwien.ac.at",
		"stream_cmd": "ffplay -fflags nobuffer -flags low_delay -framedrop -hide_banner -loglevel error -autoexit -rtsp_transport tcp",
	}

	def __enter__(self):
		return self

	def __exit__(self, exc_type, exc_value, traceback):
		self.releasePlace()

	@property
	def _rpa_is_locked(self):
		# thread is only started if rpa_main is set
		if self.rpa_main is True:
			if self.t_rpa:
				return self.t_rpa.locked
			else:
				return False
		else:
			return self.LockState.status == RPAStatus.ASSIGNED

	def _rpa_connect(self, place):
		if self.rpa_main:
			args = {
				"rpa_outcome": self.rpa_outcome,
				"queue": self.rpa_msg_queue,
				"place": place,
				"runCmd": self.interactiveCommand,
			}
			self.t_rpa = RPAExecThread(kwargs=args)
			self.t_rpa.start()
		
			logging.debug("waiting for RPAExecThread")
			self.rpa_outcome.wait()
			logging.debug(f"done: {self.rpa_outcome.r}")
			# third state: RPAExecThread dies

			r = self.rpa_outcome.r
			if r is None:
				logging.debug("Exception during execution of ssh command as subprocess, should never happen")
				raise ValueError("subprocess executing ssh failed badly, should never happen, restart the program")
			elif r.status is RPAStatus.ASSIGNED:
				logging.debug(f"Assigned to: {r}")
				self.place = RPAPlace(self.config, r.host, r.videostreams)
			elif r.status is RPAStatus.REPLACE:
				r = self.LockState  # need to query again as replace does not yield hostname
				logging.debug(f"Assigned to: {r}, place: {place}")
				self.place = RPAPlace(self.config, r.host, r.videostreams)
			elif r.status is RPAStatus.REFUSE:
				logging.debug(f"Locking refused: {r.reason}")
				raise ValueError(f"Failed to lock Place: {r.reason}")
			elif r.status is RPAStatus.WAITING:
				logging.debug("in wait queue, can't do anything here - still not an error")
				raise QueuedException("Waiting to get assigned")
			else:
				raise ValueError(f"""Failed to lock/connect to Place. Possible causes could be:
  * Unexpected response from RPA server: {r.status} - {r.reason})
  * Also check your internet connection and try again""")
		else:
			r = self.LockState
			if r.status is not RPAStatus.ASSIGNED:
				raise ValueError("""No place locked, use rpa_main instance to lock one.
If you established a main connection from another host, check your internet connection.
In case the problem persists - ask the tutors""")
			self.place = RPAPlace(self.config, r.host, r.videostreams)

	def require_place_connection(fn):
		def wrapper(self, *args, **kwargs):
			place = args[0] if args else kwargs.get("place", None)

			logging.debug(f"require place {place}, locked: {self._rpa_is_locked}, place: {self.place}")
			if self._rpa_is_locked is False:
				self._rpa_connect(place)
			elif self.place is None:
				# can only happen if another thread tries to concurrently request a place
				self._rpa_connect(place)

			if (place is not None and not self.place.name.startswith(place)):
				msg = f"Can't get place {place}, already locked to {self.place.name}!"
				logging.debug(msg)
				raise ValueError(msg)

			# what if in in wait queue

			return fn(self, *args, **kwargs)
		return wrapper

	def __init__(self, import_name, rpa_main: bool = True):
		root_path = get_root_path(import_name)
		self.config: Config = self.config_class(root_path, self.default_config)
		super().__init__(self.config)

		self.place: RPAPlace = None
		self.rpa_main = rpa_main
		self.rpa_msg_queue: Queue = Queue()
		self.rpa_outcome: threading.Event = threading.Event()
		self.t_rpa = None

		self.t_cmd_executor = None
		self.lockCommandExecutor = threading.Lock()

		self.runner = [None]  # container for accessing running subprocess

	@property
	def RPAEventQueue(self):
		""" can be used to receive status updates from rpa-lock thread
		"""

		return self.rpa_msg_queue

	def _require_command_executor(fn):
		def wrapper(self, *args, **kwargs):
			with self.lockCommandExecutor:
				if self.t_cmd_executor is None:
					t = CommandExecutorThread(self, [], {})
					t.start()
					self.t_cmd_executor = t
			return fn(self, *args, **kwargs)
		return wrapper

	def _execute_command(self, cmd):
		ec = ExecutorCommand(cmd)
		try:
			self.t_cmd_executor.queueCommand(ec)
			ec.wait()
			if (ec.response):
				return ec.response
			else:
				# executor crashed
				raise ExecutorTerminatedException(f'Check your internet connection!\nFailed to execute "{cmd}"')
		except ExecutorTerminatedException:
			# executor shut down, this exception is additionally raised on queueCommand
			# refresh object to allow for starting a new executor
			with self.lockCommandExecutor:
				self.t_cmd_executor = None

			# notify caller
			raise

	@property
	@_require_command_executor
	def Places(self):
		""" list all places known to rpa
		"""

		cmd = ["rpa", "-V", "MESSAGE-SET=vlsi-yaml", "status"]
		return Places.from_rpa_status_cmd(self._execute_command(cmd))

	def releasePlace(self):
		""" stop thread which locked the place
		"""

		if self.t_rpa is not None:
			logging.info("stopping rpa thread")
			self.t_rpa.terminate()
			self.t_rpa.join()   # will wait until terminated
			self.t_rpa = None
			logging.info("rpa thread terminated")
		else:
			logging.info("rpa thread not running")

	def stopQueries(self):
		if self.runner[0]:
			self.runner[0].terminate()

	@property
	@_require_command_executor
	def LockState(self):
		""" Activly query current state from server, returning all
			information like videostreams if actually connected.

			Raises exception if either ssh or the command executed fails.
		"""

		cmd = ["rpa", "-V", "MESSAGE-SET=vlsi-yaml", "lock-state"]
		return RPAResponse.from_yml_str('\n'.join(self._execute_command(cmd).splitlines()[:-1]))

	@property
	def ConnectionStatus(self):
		""" Simpler than Lockstate as it only uses its RPAStatus and maps to ConnectionStatus
			to save additional logic in application code as several RPAStatus codes refer to
			not connected / connected

			Raises exception if either ssh or the command executed fails
		"""

		return ConnectionStatus.from_response(self.LockState)

	@require_place_connection
	def Place(self, place=None):
		""" Either returns locked place or raises ValueError if place is already taken/unavailable

			Raises ValueError if it fails to lock a place
		"""

		return self.place
