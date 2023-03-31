""" Generates ssh/scp arguments for direct connection and using a jump host.
	Commands are then run via subprocess.

"""

from abc import ABC
from os import setpgrp
from os.path import exists, expanduser

import logging
import queue
import subprocess
import threading


def log_command(args: [str, iter]):
	try:
		log_msg = ''.join(args)
	except FileNotFoundError:
		log_msg = args

	logging.debug(log_msg)


class ExecutorCommand(threading.Event):
	def __init__(self, command: list):
		super().__init__()
		self.clear()
		self._command = command
		self._response = None

	@property
	def command(self):
		return self._command

	@property
	def response(self):
		return self._response


class CommandExecutorThread(threading.Thread):
	def __init__(self, ssh_instance, ssh_args, kwargs):
		super().__init__(target=self.__class__)
		self.daemon = True
		self.ssh_instance = ssh_instance
		self.ssh_args = ssh_args
		self.proc = None
		self.cmd_queue = queue.Queue()
		self.seperator = "#-#- EOC -#-#"
		self.queueAccessLock = threading.Lock()

	def queueCommand(self, cmd: ExecutorCommand):
		with self.queueAccessLock:
			if self.cmd_queue:
				self.cmd_queue.put(cmd)
			else:
				raise ExecutorTerminatedException(f'Check your internet connection!\nFailed to execute "{ec.command}"')

	def finalizeQueue(self):
		queue = self.cmd_queue
		with self.queueAccessLock:
			self._cmd_queue = None
		return queue

	def _execute_command(self):
		cmd = ' '.join(self.ec.command) + '\n'

		self.proc.stdin.write(cmd)
		self._sendSeperator()

	def _sendSeperator(self):
		self.proc.stdin.write(f'echo "{self.seperator}"\n')

	def _get_result(self):
		response = ""
		while True:
			v = self.proc.stdout.readline()
			if v == "":
				logging.debug("broken pipe, stopping exec thread")
				break  # broken pipe, stop reading
			if v.strip() == self.seperator:
				return response.strip()
			else:
				response += v

	def terminate(self):
		self.proc.terminate()


	def _popen_constructor(self):
		ssh_args = self.ssh_args if self.ssh_args else []

		args = self.ssh_instance._gen_command([], ssh_args)
		popen_args = {
			"stdin": subprocess.PIPE,
			"stdout": subprocess.PIPE,
			"stderr": subprocess.PIPE,
			"encoding": "utf-8",  # text not supported in python3.6
			"bufsize": 0,
		}
		return subprocess.Popen(args, **popen_args)

	def threadLoop(self):
		# release currently processed command too
		self.ec = None

		with self._popen_constructor() as p:
			self.proc = p

			# consume status output
			self._sendSeperator()
			self._get_result()

			while True:
				self.ec = self.cmd_queue.get()

				# execute command
				self._execute_command()

				# return result
				self.ec._response = self._get_result()
				self.ec.set()

	def run(self):
		try:
			self.threadLoop()
		# NOTE: special operation on terminated ssh connection might be of interest
		except:
			pass

		# prevent registration of new requests
		fin_queue = self.finalizeQueue()

		# release all waiting clients (currently processed + queued)
		if self.ec:
			self.ec.set()

		while True:
			try:
				ec = fin_queue.get_nowait()
				ec.set()
			except queue.Empty:
				break


class ExecutorTerminatedException(Exception):
	""" raised when executor cannot add command to being shutdown already """

	pass


class SSHException(Exception):
	""" raised when ssh itself encounters an error """

	pass


class SSHCommandException(Exception):
	""" raised when a program executed by ssh encounters an error """

	pass


class SSHConnection(ABC):
	""" Base class for command generation and execution.
	
		Subclasses must define the target property which will be used as ssh/scp target.
		For proxy connections, override _gen_command and specify an appropriate ProxyCommand

		config is a dict containing at least (username, rpaserver)

	"""

	def __init__(self, config: dict):
		self.config = config

	def _gen_command(self, command: list = None, ssh_args: list = None, stringify: bool = False):
		""" Private function used by commands to generate arguments
			for running subprocesses
		"""

		command = command if command else []
		ssh_args = ssh_args if ssh_args else []

		args = ["ssh"]
		if self.config.get("identity", None):
			identity_str = f"{expanduser(self.config['identity'])}"
			if stringify:
				identity_str = f'"{identity_str}"'
			args.extend([f"-i{identity_str}"])
		args.extend(ssh_args)
		args.extend([
			"-oServerAliveInterval=5",
			# "-oConnectTimeout=20",  seemed to be without effect, use timeout on subprocess instead
			"-oBatchMode=yes",  # disable prompting for password in certain cases
			"-oStrictHostKeyChecking=no",  # don't prompt if id changed
			f"{self.target}",
		])
		args.extend(command)

		log_command(args)
		return args

	def interactiveCommand(self, command: list, ssh_args: list = None):
		""" Returns a subprocess.Popen instance with open filehandles,
			checkout subprocess for more information
		"""

		ssh_args = ssh_args if ssh_args else []

		args = self._gen_command(command, ssh_args)
		popen_args = {
			"stdin": subprocess.PIPE,
			"stdout": subprocess.PIPE,
			"stderr": subprocess.STDOUT,
			"encoding": "utf-8",  # text not supported in python3.6
			"preexec_fn": setpgrp,  # prevent subprocess to die on SIGINT
		}
		return subprocess.Popen(args, **popen_args)

	def runCommand(self, command: list, ssh_args: list = None,
				capture_stdout: bool = False, capture_stderr: bool = False,
				shell: bool = False, quiet: bool = False, forward_sigint=False,
				runner_obj=None, disconnect_file_handles=False, timeout=None):
		""" Execute command, returns a subprocess.CommandCompleted object.

			captures_stdout: capture program output, for information on accessing
							 data, check documentation subprocess module
			shell:			 enables expansion, glob, ..
			quiet:			 redirect stdout/stderr to /dev/null

		"""

		ssh_args = ssh_args if ssh_args else []

		args = self._gen_command(command, ssh_args, stringify=shell)
		logging.debug(f"args: {args}")
		subproc_args = {
			"shell": shell,
			"encoding": "utf-8",
			"preexec_fn": None if forward_sigint else setpgrp,  # prevent subprocess to die on SIGINT
		}

		# TODO: check if this is a regression for rpa_gui!
		if capture_stdout:
			subproc_args["stdout"] =  subprocess.PIPE
		if capture_stderr:
			subproc_args["stderr"] =  subprocess.PIPE

		if quiet or disconnect_file_handles:
			subproc_args["stdout"] = subprocess.DEVNULL
			subproc_args["stderr"] = subprocess.DEVNULL
		if disconnect_file_handles:
			subproc_args["stdin"] = subprocess.DEVNULL

		if runner_obj or timeout:
			proc = subprocess.Popen(args, **subproc_args)
			if runner_obj:
				runner_obj[0] = proc
			try:
				stdout, stderr = proc.communicate(timeout=timeout)
			except subprocess.TimeoutExpired:
				proc.kill()
				stdout, stderr = proc.communicate()
				raise
			rval = subprocess.CompletedProcess(proc.args, proc.returncode, stdout, stderr)
		else:
			logging.debug(f"suprocess.run: {''.join(args)}\n{subproc_args}")
			rval = subprocess.run(args, **subproc_args)

		if rval.returncode == 255:
			s_cmd = " ".join(command)
			if rval.stderr and "permission denied" in rval.stderr.lower():
				raise SSHException(f"Key authentication failed while trying to execute '{s_cmd}', check if the correct key is in use")
			elif rval.stderr and "network is unreachable" in rval.stderr.lower():
				raise SSHException(f"Failed to connect to rpa server while trying to execute '{s_cmd}', check the internet connection")
			elif rval.stderr and "no such file or directory" in rval.stderr.lower():
				raise SSHException(f"Failed to find configured keyfile while trying to execute '{s_cmd}', check the filemode and existence")
			else:
				raise SSHException(f"Failed to execute '{s_cmd}': {rval.stderr}")
		elif rval.returncode:
			raise SSHCommandException(f"Command executed by ssh encountered an error ({''.join(rval.args)})")

		return rval
	
	def runShell(self):
		""" Open interactive shell on target host """
		args = self._gen_command(ssh_args=[
			"-X",  # enable X11-forwarding
			"-Y",  # trusted X11-forwarding
			"-C",  # use compression
		])
		logging.debug(args)
		subprocess.run(args)

	def fileTransport(self, local_path: str, remote_path: str, direction: str):
		""" scp command generator, only supports direct connection """

		# TODO: check local, remote path for in-directory placement
		local_path = expanduser(local_path) if local_path else ""
		remote_path = f"{self.target}:{remote_path if remote_path else ''}"

		args = ["scp"]
		if self.config.get("identity", None):
			args.append(f"-i{self.config['identity']}")
		args.extend([
			f"{local_path}" if direction == "put" else f"{remote_path}",
			f"{remote_path}" if direction == "put" else f"{local_path}",
		])

		log_command(args)
		subprocess.run(args)

	def putFile(self, local_path, remote_path):
		""" scp send action, remote path might be Null if copying file to ~/ is intended """
		self.fileTransport(local_path, remote_path, "put")

	def getFile(self, local_path, remote_path):
		""" scp receive action, both paths have to be specified """
		self.fileTransport(local_path, remote_path, "get")


# * require username, host to be set
class RPAServerSSHConnection(SSHConnection):
	""" Executes direct SSH conections """

	def __init__(self, config, *args, **kwargs):
		super().__init__(config, *args, **kwargs)

	@property
	def target(self):
		cfg = self.config
		return f"{cfg['username']}@{cfg['rpaserver']}"


class RPAPlaceSSHConnection(SSHConnection):
	""" Executes SSH conections via jumphost to given host_url """

	def __init__(self, config, host_url, *args, **kwargs):
		super().__init__(config, *args, **kwargs)
		self.rpaplace = host_url

	@property
	def target(self):
		cfg = self.config
		return f"{cfg['username']}@{self.rpaplace}"

	def _gen_command(self, command: list = None, ssh_args: list = None, stringify: bool = False):
		username = self.config["username"]
		rpaserver = self.config["rpaserver"]
		command = command if command else []
		ssh_args = ssh_args if ssh_args else []

		if self.config.get('identity', None):
			proxy_command = f"/usr/bin/ssh -i{self.config['identity']} -W %h:%p {username}@{rpaserver}"
		else:
			proxy_command = f"/usr/bin/ssh -W %h:%p {username}@{rpaserver}"

		if stringify:
			proxy_command = f'"{proxy_command}"'

		ssh_args.append(f"-oProxyCommand={proxy_command}")

		rval = super()._gen_command(command, ssh_args, stringify)
		if stringify:
			rval = ' '.join(rval)

		return rval
