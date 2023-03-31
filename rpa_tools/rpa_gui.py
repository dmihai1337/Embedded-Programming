#!/usr/bin/env python3

import logging
import os
import signal
import threading
import tkinter
import webbrowser

from abc import ABC
from docopt import docopt
from enum import auto, Enum
from queue import Queue
from subprocess import TimeoutExpired
from tkinter import filedialog, ttk
from tkinter import font

from librpa import ConnectionStatus, PlaceState, QueuedException, RPAClient, RPAPlace, RPAStatus
from local_webserver import Webserver
from ssh import SSHException


# NOTE: all communication to Tk thread is done via events/queues
#       those calls to enqueue an event might raise an exceptions if the Tk
#       mainloop has finished

event_shutdown = threading.Event()
event_shutdown.clear()
event_tk_stopped = threading.Event()
event_tk_stopped.clear()
exc_queue = Queue()
refresh_exc_processed = threading.Event()
refresh_exc_processed.clear()

popup_instances = []

usage_msg = """
GUI Frontend to lock a remote place in TILab and run webservers to
allow use of RPA-Webinterface

Usage:
  rpa_gui.py [--debug-log]
  rpa_gui.py -h | -v

Options:
  -h --help      Show this help screen
  -v --version   Show version information
  --debug-log    Print debugging messages to stdout
"""


class UIState(Enum):
    INITIALISATION = auto()
    SETTINGS = auto()
    MAIN_SCREEN = auto()
    ALREADY_LOCKED = auto()
    CONNECTING = auto()
    WAITING = auto()
    PREPARING = auto()
    CONNECTED = auto()
    CONNECTING_FAILED = auto()


class Event(Enum):
    CLICK_CONNECT = auto()
    CLICK_DISCONNECT = auto()
    CLICK_SETTINGS = auto()
    CLICK_SETTINGS_EXIT = auto()
    SELECT_CONNECTION_MODE = auto()
    RPA_QUERY_ASSIGNED = auto()      # result from constantly querying
    RPA_QUERY_UNASSIGNED = auto()    # result from constantly querying
    RPA_UPDATE_ASSIGNED = auto()     # result from status update (from rpa thread)
    RPA_UPDATE_UNASSIGNED = auto()   # result from status update (from rpa thread)
    RPA_LOCKED = auto()        # result from rpa-lock process
    RPA_DISCONNECTED = auto()  # result from rpa-lock process
    RPA_QUEUED = auto()        # result from rpa-lock process
    RPA_PREPARED = auto()
    RPA_OTHER_INSTANCE_CONNECTED = auto()
    CONNECT_EXCEPTION = auto()
    PREPARE_EXCEPTION = auto()
    REFRESH_EXCEPTION = auto()
    EXCEPTION = auto()
    REMOTE_WEBSERVER_DOWN = auto()

    def __str__(self):
        return self.name

    @classmethod
    def from_string(cls, s: str):
        attr = None
        try:
            attr = getattr(cls, s.upper())
        except AttributeError:
            pass

        return attr


class UIStateTransition():
    def __init__(self, src, dst, before=None, after=None, condition=None):
        self.src_state = src
        self.dst_state = dst
        self.func_before = before
        self.func_after = after
        self.func_condition = condition

class BooleanObject():
    def __init__(self):
        self.clear()

    def is_set(self):
        return self.value

    def set(self):
        self.value = True

    def clear(self):
        self.value = False


class UIStateMachine():
    def __init__(self):
        self.state_map = {
            UIState.MAIN_SCREEN: self._state_main_screen,
            UIState.ALREADY_LOCKED: self._state_already_locked,
            UIState.CONNECTING: self._state_connecting,
            UIState.WAITING: self._state_waiting,
            UIState.PREPARING: self._state_preparing,
            UIState.CONNECTED: self._state_connected,
            UIState.SETTINGS: self._state_settings,
        }

    def stop(self):
        # NOTE: race condition: (remote) webserver could have been started
        #       just after calling terminateWebserver
        #       killing rpa afterwards will then forcefully close ssh connection
        #       executing the (remote) webserver
        #       current solution: forcefully shutdown, silence process to prevent
        #       ssh message from showing up
        #self.m.terminateWebserver()

        # stop tk first to prevent popup windows
        self.v.quitTk()
        event_tk_stopped.wait()

        event_shutdown.set()
        self.m.c.releasePlace()
        logging.debug("UIStateMachine stopped")

    def run(self):
        self.transitions = []
        self.current_transition = None

        self.q = Queue()

        self.m = Model()

        # local webserver (start videostreams)
        try:
            self.ws = Webserver(self.m.c.config)
            self.ws.start()
        except OSError as e:
            if e.errno == 98:
                print("Failed to start local webserver, another instance might be running already!")
            else:
                print(f"Failed to start local webserver, {e}!")
            exit(1)

        # start ui and wait for the eventloop to be up
        # tk can only receive stop signals to shut down if its running!
        self.v = View()
        self.v.start()
        self.v.ui_init_done.wait()

        self.v.bindEvent("<<GUIInteraction>>", self.process, data=True)
        self.v.bindEvent("<<StatusUpdate>>", self.cb_status_update)
        self.v.bindEvent("<<StatusQueryResult>>", self.cb_status_query_result)

        self.locked_connect = BooleanObject()

        self.transitions = [
            UIStateTransition(src=UIState.INITIALISATION, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_QUERY_UNASSIGNED),
            UIStateTransition(src=UIState.INITIALISATION, dst=UIState.ALREADY_LOCKED, condition=lambda e: e == Event.RPA_QUERY_ASSIGNED),
            UIStateTransition(src=UIState.MAIN_SCREEN, dst=UIState.CONNECTING, condition=lambda e: e == Event.CLICK_CONNECT, before=lambda: self.locked_connect.clear()),
            UIStateTransition(src=UIState.CONNECTING, dst=UIState.PREPARING, condition=lambda e: e == Event.RPA_LOCKED),
            UIStateTransition(src=UIState.CONNECTING, dst=UIState.WAITING, condition=lambda e: e == Event.RPA_QUEUED),
            UIStateTransition(src=UIState.WAITING, dst=UIState.PREPARING, condition=lambda e: e == Event.RPA_LOCKED),
            UIStateTransition(src=UIState.PREPARING, dst=UIState.CONNECTED, condition=lambda e: e == Event.RPA_PREPARED),
            UIStateTransition(src=UIState.MAIN_SCREEN, dst=UIState.SETTINGS, condition=lambda e: e == Event.CLICK_SETTINGS),
            UIStateTransition(src=UIState.SETTINGS, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.CLICK_SETTINGS_EXIT, before=lambda: self.v.hideSettings()),
            UIStateTransition(src=UIState.WAITING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.CLICK_DISCONNECT, before=lambda: self.m.c.releasePlace()),
            UIStateTransition(src=UIState.MAIN_SCREEN, dst=UIState.ALREADY_LOCKED, condition=lambda e: e == Event.RPA_QUERY_ASSIGNED),
            UIStateTransition(src=UIState.ALREADY_LOCKED, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_QUERY_UNASSIGNED),
            UIStateTransition(src=UIState.ALREADY_LOCKED, dst=UIState.CONNECTING, condition=lambda e: e == Event.SELECT_CONNECTION_MODE, after=lambda: self.locked_connect.set()),

            # error handling transitions
            UIStateTransition(src=UIState.CONNECTED, dst=UIState.MAIN_SCREEN, condition=lambda e: e in (Event.CLICK_DISCONNECT, Event.RPA_QUERY_UNASSIGNED, Event.RPA_UPDATE_UNASSIGNED)),
            UIStateTransition(src=UIState.CONNECTING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.CONNECT_EXCEPTION, before=lambda: self.v.infoBox(exc_queue.get())),
            UIStateTransition(src=UIState.PREPARING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_UPDATE_UNASSIGNED, before=lambda: self.v.infoBox("place not locked anymore, try again")),  # happened while testing: lost connection while preparing
            UIStateTransition(src=UIState.PREPARING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_QUERY_UNASSIGNED and self.locked_connect.is_set(), before=lambda: self.v.infoBox("place not locked anymore, try again")),  # only use RPA_QUERY_UNASSIGNED when connection is established already, otherwise RPA_QUERY_UNASSIGNED could interfer due to latency and cause a reset (even better would be: only when client mode is used)
            UIStateTransition(src=UIState.PREPARING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.PREPARE_EXCEPTION, before=lambda: self.v.infoBox(exc_queue.get())),  # happened while testing: lost connection while preparing
            UIStateTransition(src=UIState.CONNECTING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_UPDATE_UNASSIGNED, before=lambda: self.v.infoBox("place not locked anymore, try again")),
            UIStateTransition(src=UIState.CONNECTING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_QUERY_UNASSIGNED and self.locked_connect.is_set(), before=lambda: self.v.infoBox("place not locked anymore, try again")), # same as last comment
            UIStateTransition(src=UIState.PREPARING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.REMOTE_WEBSERVER_DOWN, before=lambda: self.v.infoBox("Your lock has probably expired. If this is not the case, there is either already one master instance running a webserver or the websever encountered an error. Disconnect all instances and try again.")),
            UIStateTransition(src=UIState.CONNECTED, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.REMOTE_WEBSERVER_DOWN, before=lambda: self.v.infoBox("Your lock has probably expired. If this is not the case, there is either already one master instance running a webserver or the websever encountered an error. Disconnect all instances and try again.")),
            # introduces problems as it may take a while until place is locked. every query during this time will emit RPA_UNASSIGNED
            #UIStateTransition(src=UIState.CONNECTING, dst=UIState.MAIN_SCREEN, condition=lambda e: e == Event.RPA_UNASSIGNED, before=lambda: self.v.infoBox("Place not locked anymore, try again")),
            UIStateTransition(src="*", dst=UIState.SETTINGS, condition=lambda e: e == Event.REFRESH_EXCEPTION, before=self.refresh_exception_transition),
        ]

        # update UI if trapped in wait-queue
        ev_thread = RPAEventHandlerThread(self.m.c.RPAEventQueue, self.v.event)
        ev_thread.start()

        self._initialisation()

    def refresh_exception_transition(self):
        self.m.terminateWebserver()
        self.m.c.releasePlace()
        self.v.infoBox(str(refresh_exc_processed.data))

    def cb_status_query_result(self, event):
        item = self.q.get()
        self.v.updatePlaceList(item["placeList"])
        connectionStatus = ConnectionStatus.from_response(item["rpaResponse"])

        if connectionStatus == ConnectionStatus.ASSIGNED:
            self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_QUERY_ASSIGNED}:")
            self.v.Placename = item["rpaResponse"].name
        elif connectionStatus == ConnectionStatus.UNASSIGNED:
            self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_QUERY_UNASSIGNED}:")

    def cb_status_update(self, event):
        item = self.q.get()
        self.v.updatePlaceList(item["placeList"])
        connectionStatus = ConnectionStatus.from_response(item["rpaResponse"])

        if connectionStatus == ConnectionStatus.ASSIGNED:
            self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_ASSIGNED}:")
            self.v.Placename = item["rpaResponse"].name
        elif connectionStatus == ConnectionStatus.UNASSIGNED:
            self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_UNASSIGNED}:")

    def _initialisation(self):
        def refresh():
            import time
            while True:
                time.sleep(0.5)
                try:
                    # constantly update ConnectionStatus and PlaceList,
                    # notify gui through event (recommended)
                    # data might be serialized and attached to event, simpler with queue
                    item = {"placeList": self.m.PlaceList, "rpaResponse": self.m.c.LockState}
                    self.q.put(item)
                    self.v.event("<<StatusQueryResult>>")
                except Exception as e:
                    # if shutdown is intended: everything is ok
                    if event_shutdown.is_set():
                        break
                    else:
                        logging.debug(f"{e}")
                        refresh_exc_processed.data = e
                        self.v.event("<<GUIInteraction>>", data=f"{Event.REFRESH_EXCEPTION}:")

                        # if an exception happend before: wait until it has been consumed
                        refresh_exc_processed.wait()
                        logging.debug("waited")
                        refresh_exc_processed.clear()
                        logging.debug("cleared")

                    #elif isinstance(e, SSHException):
                    #    # most likely: not connected to network, invalid username/
                    #    self.v.event("<<GUIInteraction>>", data=f"{Event.EXCEPTION}:")
                    #else:
                    #    logging.debug(f"encountered error {e}")
                    #    exc_queue.put(f"Problem with internet connection detected: {e}")
                    #    self.v.event("<<GUIInteraction>>", data=f"{Event.EXCEPTION}:")

        status_thread = threading.Thread(target=refresh, name="status_update", daemon=True)
        status_thread.start()

        self.state = UIState.INITIALISATION
        self.v.sideFrame = "Initialisation"

    def _state_main_screen(self, event_arg):
        self.m.terminateWebserver()
        self.m.c.releasePlace()
        refresh_exc_processed.set()

        self.v.sideFrame = "NewConnection"
        self.v.PlaceSelectable = True

        # possible complications:
        # 1) identity file not specified
        # 2) identity file inexistant
        # 3) wrong identity file
        #    #self.v.showSettings(self.m.c.config, self.m.config_path)
        #    # TODO: improve error messages
        #    # TODO: how to properly handle exceptions wiht possibly state changing effects?
        #    self.v.infoBox(e)

    def _state_settings(self, event_arg):
        self.v.showSettings(self.m.c.config, self.m.config_path)

    def _state_already_locked(self, event_arg):
        self.v.sideFrame = "AlreadyLocked"
        self.v.PlaceSelectable = False

    def _state_connecting(self, event_arg):
        def connect():
            try:
                self.m.getPlace(name)
                self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_LOCKED}:")
            except QueuedException:
                logging.debug(f"do nothing so far, wait for connection to be confirmed")
                self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_QUEUED}:")
            except Exception as e:
                if isinstance(e, TimeoutExpired):
                    logging.debug(f"Probably there is a problem with internet connection being down! {e}")
                    exc_queue.put(f"Problem with internet connection detected: {e}")
                else:
                    logging.debug(f"failed to get place! {e}")
                    exc_queue.put(f"Failed to get place due to: {e}")
                self.m.c.releasePlace()  # release connections by terminating
                self.v.event("<<GUIInteraction>>", data=f"{Event.CONNECT_EXCEPTION}:")


        logging.debug(f"_state_connecting, event_arg: {event_arg}")
        self.v.setProgressStatus("Connecting")
        self.v.sideFrame = "Progress"
        self.v.PlaceSelectable = False
        self.v.QueueCancellable = False
        if event_arg in (None, "", "own"):
            self.m.TakeOver = True
        else:  # "use"
            self.m.TakeOver = False

        try:
            name = self.m.getPlaceByIdx(self.v.SelectedPlaceIdx).name
        except IndexError:
            name = None

        t = threading.Thread(target=connect, name="connect", daemon=True)
        t.start()

    def webserver_down_cb(self, event):
        self.v.event("<<GUIInteraction>>", data=f"{Event.REMOTE_WEBSERVER_DOWN}:")

    def _state_preparing(self, event_arg):
        def prepare_place():
            try:
                # install software
                rv = self.m.p.runCommand(["pip3", "install", "--user", "aiohttp[speedups]"], quiet=True)
                rv.check_returncode()

                # start webserver
                # TODO - choose port, wait for succcess,
                #        current implementation will raise error and return to MAIN_SCREEN
                self.m.runWebserver(self.webserver_down_cb)
                self.v.event("<<GUIInteraction>>", data=f"{Event.RPA_PREPARED}:")
            except Exception as e:
                # if shutdown is intended: everything is ok
                if event_shutdown.is_set():
                    pass
                else:
                    logging.debug(f"failed to prepare, {e}")
                    exc_queue.put(f"Failed to prepare place due to: {e}")
                    self.v.event("<<GUIInteraction>>", data=f"{Event.PREPARE_EXCEPTION}:")

        self.v.setProgressStatus("Preparing place")
        self.v.QueueCancellable = False

        self.ws.setRPAPlace(self.m.p)
        self.v.WebserverURL = "http://127.0.0.1:8081/"

        t = threading.Thread(target=prepare_place, name="prepare place", daemon=True)
        t.start()

    def _state_waiting(self, event_arg):
        self.v.setProgressStatus("Connecting - in wait queue")
        self.v.QueueCancellable = True

    def _state_connected(self, event_arg):
        self.v.PlaceSelectable = False
        self.v.sideFrame = "Connected"

    def process(self, event_data=None):
        event_str, event_arg = event_data.split(':', maxsplit=1)
        event = Event.from_string(event_str)
        logging.debug(f"event: {event}, current_state: {self.state}, current_transition: {self.current_transition}")
        next_transition = None

        # reverse to prioritize first matching entry
        relevant_transitions = filter(lambda t: t.src_state == self.state or t.src_state == "*", reversed(self.transitions))
        for transition in relevant_transitions:
            if transition.func_condition(event):
                next_transition = transition
        #logging.debug(f"relevant transitions: {[(rt.src_state, rt.dst_state) for rt in relevant_transitions]}")

        if next_transition:
            if self.current_transition and self.current_transition.func_after:
                self.current_transition.func_after()
            if next_transition.func_before:
                next_transition.func_before()

            action = self.state_map.get(next_transition.dst_state, None)
            if action:
                action(event_arg)

            self.state = next_transition.dst_state
            self.current_transition = next_transition
            logging.debug(f"current_transition: {self.current_transition}, state: {self.state}")


class ExitSignalPublisher():
    def __init__(self):
        signal.signal(signal.SIGINT, self.handle_signal)
        signal.signal(signal.SIGTERM, self.handle_signal)

        self.subscribers = []

    def subscribe(self, subscriber):
        self.subscribers.append(subscriber)

    def handle_signal(self, *args):
        for subscriber in self.subscribers:
            subscriber.terminate()


def configure_logger():
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)

    # create console handler and set level to debug
    ch = logging.StreamHandler()
    ch.setLevel(logging.DEBUG)

    # create formatter
    formatter = logging.Formatter('%(asctime)s, %(filename)s:%(lineno)d::%(threadName)s - %(name)s - %(levelname)s - %(message)s')

    # add formatter to ch
    ch.setFormatter(formatter)

    # add ch to logger
    logger.addHandler(ch)

    return logger


class AlreadyLockedFrame(ttk.Frame):
    def __init__(self, master):
        super().__init__(master, style="Choice.TFrame")
        self._connection_mode = tkinter.StringVar()
        self._place_phrase = tkinter.StringVar()
        self._phrase = "You already locked {} with another instance:"
        self._set_placename()

        notification_label = ttk.Label(self, textvar=self._place_phrase, style="Choice.TLabel")
        sel_own = ttk.Radiobutton(self, text="Take ownership\n[disconnect will terminate all instances]", variable=self._connection_mode, value='own', style="Choice.TRadiobutton")
        sel_use = ttk.Radiobutton(self, text="Use established connection\n[disconnect won't influence other instances]", variable=self._connection_mode, value='use', style="Choice.TRadiobutton")
        confirm_button = ttk.Button(self, text="Confirm")

        self._connection_mode.set("own")  # initialize choice element

        notification_label.grid(column=1, row=1, pady=10)
        sel_own.grid(column=1, row=3, sticky=tkinter.W, pady=5, padx=15)
        sel_use.grid(column=1, row=4, sticky=tkinter.W, pady=5, padx=15)
        ttk.Frame(self).grid(column=1, row=5)
        confirm_button.grid(column=1, row=6, sticky=[tkinter.E, tkinter.S], padx=15, pady=15)

        self.columnconfigure(1, weight=1)

        confirm_button.bind("<Button>", lambda e: self.event_generate("<<GUIInteraction>>", data=f"{Event.SELECT_CONNECTION_MODE}:{self._connection_mode.get()}", when="tail"))

    def _set_placename(self, place=None):
        logging.debug(f"set placename: {place}")
        value = place if place else "this place"
        self._place_phrase.set(self._phrase.format(value))


class NewConnectionFrame(ttk.Frame):
    def __init__(self, master):
        super().__init__(master, style="Choice.TFrame")

        status_label = ttk.Label(self, text="Status: Disconnected", style="Choice.TLabel")
        msg_label = ttk.Label(self, text="Select a host to connect to", style="Choice.TLabel")
        connect_button = ttk.Button(self, text="Connect", style="Wireframe.TButton")

        status_label.grid(column=1, row=1, pady=25)
        msg_label.grid(column=1, row=2)
        ttk.Frame().grid(column=1, row=3)
        connect_button.grid(column=1, row=4, sticky=[tkinter.E, tkinter.S], padx=15, pady=15)

        self.rowconfigure(3, weight=1)
        self.columnconfigure(1, weight=1)

        connect_button.bind("<Button>", lambda e: self.event_generate("<<GUIInteraction>>", data=f"{Event.CLICK_CONNECT}:", when="tail"))


class InitialisationFrame(ttk.Frame):
    def __init__(self, master):
        super().__init__(master, style="Choice.TFrame")

        status_label = ttk.Label(self, text="Initialisation", style="Choice.TLabel")
        msg_label = ttk.Label(self, text="Fetching data from RPA server", style="Choice.TLabel")
        progressbar = ttk.Progressbar(self, orient=tkinter.HORIZONTAL, length=200, mode='indeterminate')

        status_label.grid(column=1, row=1, pady=25)
        progressbar.grid(column=1, row=2, padx=50, pady=15, sticky=[tkinter.W, tkinter.E])
        msg_label.grid(column=1, row=3, pady=0)
        self.columnconfigure(1, weight=1)

        progressbar.start()


class ConnectedFrame(ttk.Frame):

    def _open_url(self):
        logging.debug(f"trying to open webserver at: {self.webserver_url}")
        if self.webserver_url:
            webbrowser.open(self.webserver_url)

    def __init__(self, master):
        super().__init__(master, style="connected.TFrame")
        self.webserver_url = None
        self._placename = tkinter.StringVar()
        self._placename.set("Status: Connected")

        status_label = ttk.Label(self, textvar=self._placename, style="connected.TLabel")
        webgui_button = ttk.Button(self, text="Open web GUI", command=self._open_url, style="primary.TButton")
        disconnect_button = ttk.Button(self, text="Disconnect", style="warning.TButton")

        status_label.grid(column=1, row=1, pady=25)
        webgui_button.grid(column=1, row=2, columnspan=2, padx=15, sticky=[tkinter.W, tkinter.E])
        disconnect_button.grid(column=1, row=4, sticky=[tkinter.E, tkinter.S], padx=15, pady=15)

        self.rowconfigure(3, weight=1)
        self.columnconfigure(1, weight=1)

        disconnect_button.bind("<Button>", lambda e: self.event_generate("<<GUIInteraction>>", data=f"{Event.CLICK_DISCONNECT}:", when="tail"))

    def _set_webserver_url(self, url):
        self.webserver_url = url

    def _set_placename(self, name):
        self._placename.set(f"Status: Connected [{name}]")


class ProgressFrame(ttk.Frame):
    def __init__(self, master):
        super().__init__(master, style='Progress.TFrame')
        self.status = tkinter.StringVar()

        status_label = ttk.Label(self, textvar=self.status, style="Progress.TLabel")
        self.progressbar = ttk.Progressbar(self, orient=tkinter.HORIZONTAL, length=200, mode='indeterminate')
        self.disconnect_button = ttk.Button(self, text="Disconnect", style="warning.TButton")

        status_label.grid(column=1, row=1, pady=25)
        self.progressbar.grid(column=1, row=3, padx=50, pady=15, sticky=[tkinter.W, tkinter.E])

        # TODO: improve layout?
        self.columnconfigure(1, weight=1)
        self.rowconfigure(2, weight=1)
        self.rowconfigure(3, weight=1)
        self.rowconfigure(4, weight=1)

        self.disconnect_button.grid(column=1, row=4, sticky=[tkinter.E, tkinter.S], padx=15, pady=15)
        self.disconnect_button.grid_remove()

        self.disconnect_button.bind("<Button>", lambda e: self.event_generate("<<GUIInteraction>>", data=f"{Event.CLICK_DISCONNECT}:", when="tail"))

    def setStatus(self, status):
        self.status.set(f"Status: {status}")

    def _set_disconnect_visibility(self, state: bool):
        if state:
            self.disconnect_button.grid()
        else:
            self.disconnect_button.grid_remove()

    def animateProgressbar(self, state):
        if state:
            self.progressbar.start()
        else:
            self.progressbar.stop()

    DisconnectButtonVisible = property(fset=_set_disconnect_visibility)


class SideFrame(ttk.Frame):
    def __init__(self, master):
        super().__init__(master)


class ControlFrame(ttk.Frame):

    def __init__(self, master, streams):
        super().__init__(master)

        sof_name = tkinter.StringVar()

        self.sof_frame = ttk.Frame(self)
        self.sof_title = ttk.Label(self.sof_frame, text="Program board")
        self.sof_path_label = ttk.Label(self.sof_frame, text="Path:")
        self.sof_path = ttk.Entry(self.sof_frame, textvariable=sof_name)
        self.but_select_file = ttk.Button(self.sof_frame, text="Select File", command=lambda: sof_name.set(filedialog.askopenfilename()))
        #filename = filedialog.askopenfilename()
        self.but_download_sof = ttk.Button(self.sof_frame, text="Program", command=lambda: self.event_generate("<<GUIInteraction>>", data=f"{Event.PROGRAM_SOF}:{sof_name.get()}", when="tail"))

        self.sof_frame.grid()
        self.sof_title.grid(column=1, row=1, columnspan=3)
        self.sof_path_label.grid(column=1, row=3)
        self.sof_path.grid(column=2, row=3)
        self.but_select_file.grid(column=3, row=3)
        self.but_download_sof.grid(column=1, row=5, columnspan=3)

        self.streams_frame = ttk.Frame(self)
        self.title_label = ttk.Label(self.streams_frame, text="Open Streams:")
        for n, stream in enumerate(streams, 1):
            #print(stream.name)
            button = ttk.Button(self.streams_frame, text=f"{stream.name}", command=stream.open)
            button.grid(column=n, row=2)
        button = ttk.Button(self.streams_frame, text="oszilloscope")

        self.title_label.grid(column=1, row=1, columnspan=n)
        self.streams_frame.grid()


class SettingsFrame(ttk.Frame):

    def processAction(self, event):
        action = event.widget.cget("text")

        d_changed = {}
        if action in ("Save", "Apply"):
            for n, (name, value) in enumerate(self.config.items(), 1):
                value_entry = getattr(self, f"var_{n}").get()
                if value_entry != value:
                    d_changed[name] = value_entry

            self.config.from_mapping(d_changed)

        logging.debug("changed:", self.config)

        if action == "Save":
            self.config.write_yml(self.path)

        self.event_generate("<<GUIInteraction>>", data=f"{Event.CLICK_SETTINGS_EXIT}:", when="tail")

    def __init__(self, master, config, config_path):
        super().__init__(master, style="main.TFrame")
        self.config = config
        self.path = config_path

        ttk.Frame(self).grid(row=0, column=1, pady=2.5)

        for n, (name, value) in enumerate(config.items(), 1):
            ttk.Label(self, text=f"{name}:", style="main.TLabel").grid(row=n, column=1, sticky=tkinter.E, padx=5, pady=2)
            var = tkinter.StringVar()
            setattr(self, f"var_{n}", var)
            if value not in (None, "None"):
                var.set(value)
            ttk.Entry(self, textvariable=var).grid(row=n, column=2, columnspan=2, sticky=[tkinter.W, tkinter.E])

        f = ttk.Frame(self, style="main.TFrame")
        f.grid(row=n+1, column=1, columnspan=2, pady=15)

        for j, name in enumerate(("Cancel", "Apply", "Save")):
            btn = ttk.Button(f, text=name)
            btn.grid(row=1, column=j, padx=2)
            btn.bind("<Button>", self.processAction)

        self.columnconfigure(2, weight=1)

class HeaderFrame(ttk.Frame):
    def __init__(self, master, style=None):
        super().__init__(master, style="header.TFrame")
        self._title_text = tkinter.StringVar()

        title = ttk.Label(self, textvar=self._title_text, style="header.TLabel")
        self.settings = ttk.Button(self, text="settings", style="Settings.TButton")
        title.grid(row=1, column=1)
        self.settings.grid(row=1, column=1, sticky=[tkinter.N, tkinter.E, tkinter.S])

        self.settings.bind("<Button>", lambda e: self.event_generate("<<GUIInteraction>>", data=f"{Event.CLICK_SETTINGS}:", when="tail"))

        self.columnconfigure(1, weight=1)

    def _set_title(self, text):
        self._title_text.set(text)

    def _show_button(self, state: bool):
        if state:
            self.settings.grid()
        else:
            self.settings.grid_remove()

    Title = property(fset=_set_title)
    ShowButton = property(fset=_show_button)


class MainFrame(ttk.Frame):

    def __init__(self, master):
        super().__init__(master, style="main.TFrame")

        self._placelist = tkinter.StringVar()

        self.placelistbox = tkinter.Listbox(self, listvariable=self._placelist, foreground="#d0d0d0", selectbackground="#708090", background="#405060", relief="solid", borderwidth=1, highlightthickness=0)
        self.sf = None

        self.placelistbox.grid(column=1, row=1, padx=15, pady=15)

        min_width = 350  # self.options.winfo_width()
        self.columnconfigure(2, minsize=min_width)

        self.sideframes = {
            "NewConnection": NewConnectionFrame(self),
            "Connected": ConnectedFrame(self),
            "AlreadyLocked": AlreadyLockedFrame(self),
            "Progress": ProgressFrame(self),
            "Initialisation": InitialisationFrame(self),
        }

    def _side_frame(self, name: str):
        if self.sf:
            if self.sf == self.sideframes["Progress"]:
                self.sf.animateProgressbar(False)
            self.sf.grid_remove()

        self.sf = self.sideframes[name]
        if name == "Progress":
            self.sf.animateProgressbar(True)
        self.sf.grid(column=2, row=1, sticky=[tkinter.W, tkinter.N, tkinter.E, tkinter.S], padx=15, pady=15)

        min_width = 400  # self.options.winfo_width()
        self.columnconfigure(2, minsize=min_width)

    def setProgressStatus(self, status):
        self.sideframes["Progress"].setStatus(status)

    def _queue_cancellable(self, status: bool):
        self.sideframes["Progress"].DisconnectButtonVisible = status

    def _place_selectable(self, status: bool):
        value = "normal" if status else "disable"
        self.placelistbox.configure(state=value)

    def _set_placelist(self, placeList: [str]):
        self._placelist.set(placeList)

    @property
    def SelectedPlaceIdx(self):
        return self.placelistbox.curselection()[0]

    sideFrame = property(fset=_side_frame)
    placeList = property(fset=_set_placelist)


def missingSettingsDialog(root, config, config_path):
    _username = tkinter.StringVar()
    _identity = tkinter.StringVar()
    if config.get("username") is not None:
        _username.set(config.get("username"))

    def close():
        # eh, somebody wants to close me, do nothing :o
        config["username"] = _username.get()
        config["identity"] = _identity.get() if len(_identity.get()) else None
        config.write_yml(config_path)
        dlg.grab_release()
        dlg.destroy()

    dlg = tkinter.Toplevel(root)
    ttk.Label(dlg, text="Some settings are missing:").grid(pady=15)

    container = ttk.Frame(dlg)

    ttk.Label(container, text="tilab username:").grid(row=2, column=1)
    ttk.Entry(container, textvar=_username).grid(row=2, column=2, sticky=[tkinter.W, tkinter.E])

    ttk.Frame(container).grid(row=3, pady=10)

    default_identity = os.path.expanduser("~/.ssh/id_rsa")
    if os.path.exists(default_identity):
        _identity.set(default_identity)
        ttk.Label(container, text="Autodetected SSH-Keys:").grid(row=4, column=1, columnspan=3, padx=5)
    else:
        ttk.Label(container, text="Did you generate an ssh-key? Check the tutorial in TUWEL!").grid(row=4, column=1, columnspan=3)
    ttk.Label(container, text="ssh private key:").grid(row=5, column=1)
    ttk.Entry(container, textvar=_identity).grid(row=5, column=2, sticky=[tkinter.W, tkinter.E])
    ttk.Button(container, text="open", command=lambda: _identity.set(filedialog.askopenfilename())).grid(row=5, column=3, padx=5)
    container.columnconfigure(2, minsize=300)
    container.grid(padx=10, pady=10)
    ttk.Button(dlg, text="Ok", command=close).grid()


    dlg.protocol("WM_DELETE_WINDOW", close) # intercept close button
    dlg.transient(root)   # dialog window is related to main
    dlg.wait_visibility() # can't grab until window appears, so we wait
    dlg.grab_set()        # ensure all input goes to our window
    dlg.wait_window()     # block until window is destroyed


class View(threading.Thread):

    def missingSettingsDialog(self, config, config_path):
        _username = tkinter.StringVar()
        _identity = tkinter.StringVar()
        if config.get("username") is not None:
            _username.set(config.get("username"))

        def close():
            # eh, somebody wants to close me, do nothing :o
            config["username"] = _username.get()
            config["identity"] = _identity.get() if len(_identity.get()) else None
            config.write_yml(config_path)
            dlg.grab_release()
            dlg.destroy()

        dlg = tkinter.Toplevel(self.root)
        ttk.Label(dlg, text="Some settings are missing:").grid(pady=15)

        container = ttk.Frame(dlg)

        ttk.Label(container, text="tilab username:").grid(row=2, column=1)
        ttk.Entry(container, textvar=_username).grid(row=2, column=2, sticky=[tkinter.W, tkinter.E])

        ttk.Frame(container).grid(row=3, pady=10)

        default_identity = os.path.expanduser("~/.ssh/id_rsa")
        if os.path.exists(default_identity):
            _identity.set(default_identity)
            ttk.Label(container, text="Autodetected SSH-Keys:").grid(row=4, column=1, columnspan=3, padx=5)
        else:
            ttk.Label(container, text="Did you generate an ssh-key? Check the tutorial in TUWEL!").grid(row=4, column=1, columnspan=3)
        ttk.Label(container, text="ssh private key:").grid(row=5, column=1)
        ttk.Entry(container, textvar=_identity).grid(row=5, column=2, sticky=[tkinter.W, tkinter.E])
        ttk.Button(container, text="open", command=lambda: _identity.set(filedialog.askopenfilename())).grid(row=5, column=3, padx=5)
        container.columnconfigure(2, minsize=300)
        container.grid(padx=10, pady=10)
        ttk.Button(dlg, text="Ok", command=close).grid()

        dlg.protocol("WM_DELETE_WINDOW", close) # intercept close button
        dlg.transient(self.root)   # dialog window is related to main
        dlg.wait_visibility() # can't grab until window appears, so we wait
        dlg.grab_set()        # ensure all input goes to our window
        dlg.wait_window()     # block until window is destroyed

    def infoBox(self, msg):
        def close():
            dlg.grab_release()
            dlg.destroy()

        try:
            dlg = tkinter.Toplevel(self.root)
            ttk.Label(dlg, text="There was an error:").grid(row=1, column=2, pady=10)
            ttk.Label(dlg, text=msg).grid(row=2, column=2, padx=10)
            ttk.Button(dlg, text="Ok", command=close).grid(row=5, column=2, pady=10)
            dlg.protocol("WM_DELETE_WINDOW", close) # intercept close button
            dlg.transient(self.root)   # dialog window is related to main
            dlg.wait_visibility() # can't grab until window appears, so we wait
            dlg.grab_set()        # ensure all input goes to our window
            popup_instances.append(dlg)
            dlg.wait_window()     # block until window is destroyed
        except tkinter.TclError:
            # ignore errors, normally due to multiple popups with some being closed already
            pass

    def __init__(self, *args, **kwargs):
        super().__init__(target=self.__class__)
        self.ui_init_done: threading.Event = threading.Event()

    def _initialise_styles(self):
        s = ttk.Style()
        s.configure('header.TFrame', foreground='#c0c0c0', background='#404040', borderwidth=1, relief='raised')
        s.configure("header.TLabel", foreground="white", background="#404040")

        s.configure("main.TFrame", foreground="white", background="#506070")
        s.configure("main.TLabel", foreground="white", background="#506070")

        s.configure("connected.TFrame", background="#60a060", borderwidth=2, relief="solid")
        s.configure("connected.TLabel", foreground="white", background="#60a060")

        background_red = [('!active', '#d04040'), ('pressed', 'green'), ('active', '#e06060')]
        s.configure("warning.TButton", foreground="white", borderwidth=2, relief='raised')
        s.map("warning.TButton", background=background_red)
        background_blue = [('!active', '#5050b0'), ('pressed', 'green'), ('active', '#6060c0')]
        s.configure("primary.TButton", foreground="white", borderwidth=2, relief='raised')
        s.map("primary.TButton", background=background_blue)

        s.configure('Progress.TFrame', foreground="white", background='#504060', borderwidth=2, relief='solid')
        s.configure('Progress.TLabel', foreground="white", background='#504060', borderwidth=0, relief='raised')

        s.configure('Choice.TFrame', foreground="white", background='#405060', borderwidth=2, relief='solid')
        s.configure('Choice.TLabel', foreground="white", background='#405060', borderwidth=0, relief='raised')
        background_choice = [('!active', '#405060'), ('pressed', '#607080'), ('active', '#607080')]

        common_fg = "white"
        common_bg = "#b55612"

        s.configure('Choice.TRadiobutton', foreground="white", borderwidth=0, relief='raised')
        s.map("Choice.TRadiobutton", foreground=[('!active', common_fg), ('pressed', common_fg), ('active', common_fg)],
                                     background=background_choice,
                                     indicatorcolor=[('selected', common_bg), ('pressed', common_bg)])

        background_wireframe = [('!active', '#506070'), ('pressed', '#708090'), ('active', '#708090')]
        s.configure('Wireframe.TButton', foreground="white", borderwidth=2, relief="solid")
        s.map("Wireframe.TButton", background=background_wireframe)

        background_settings = [('!active', '#404040'), ('pressed', '#606060'), ('active', '#606060')]
        s.configure('Settings.TButton', foreground="white", borderwidth=1, relief="raised")
        s.map("Settings.TButton", background=background_settings)

    def _initialise_window(self):
        self.root.title("Remote Place Assigner")
        self.root.resizable(False, False)

        self.hf = HeaderFrame(self.root)
        self.hf.grid(column=1, row=0, sticky=[tkinter.W, tkinter.N, tkinter.E, tkinter.S])
        self.hf.Title = "RPA GUI"

        self.mw = MainFrame(self.root)
        self.mw.grid(column=1, row=1)

        min_height = 30
        self.hf.rowconfigure(1, minsize=min_height)
        self.hf.rowconfigure(0, weight=1)

    def _initialise(self):
        self.root = tkinter.Tk()

        self._initialise_styles()
        self._initialise_window()

        self._settings_shown = False

        # TODO: scale font for HDPI displays
        # print("pixels per inch=" + str(self.root.winfo_pixels('1i')))

    def _side_frame(self, frame: str):
        """ set frame to be shown aside hostlist, settings button is only
            shown for specific side frames """
        self.mw.sideFrame = frame
        self.hf.ShowButton = frame in ("NewConnection", "AlreadyLocked")

    def quitTk(self):
        for i in popup_instances:
            try:
                # will raise an RuntimeError (main thread is not in main loop)
                # but still close the popup window
                # i.event_generate("WM_DELETE_WINDOW", when="now")
                # would be preferred but does not work
                i.destroy()
            except RuntimeError:
                pass
        self.root.quit()

    def run(self):
        self._initialise()
        self.root.update()
        size = (self.root.winfo_width(), self.root.winfo_height())
        self.root.minsize(*size)

        self.ui_init_done.set()
        self.root.mainloop()
        logging.debug("tk mainloop exited")

        # signal mainThread to send SIGINT - gracefully shut down
        global event_tk_stopped
        event_tk_stopped.set()

    # following functions are used by controller to change GUI state / query GUI state
    def showSettings(self, config, config_path):
        if not self._settings_shown:
            self._settings_shown = True
            self.hf.Title = "Settings"
            self.hf.ShowButton = False
            self.sw = SettingsFrame(self.root, config, config_path)
            self.sw.grid(column=1, row=1, sticky=[tkinter.W, tkinter.N, tkinter.E, tkinter.S])
            self.root.rowconfigure(1, weight=1)
            self.root.columnconfigure(1, weight=1)

    def hideSettings(self):
        if self._settings_shown:
            self._settings_shown = False
            self.sw.grid_forget()
            self.hf.Title = "RPA GUI"
            self.hf.ShowButton = True
            self.sw.grid_forget()
            self.mw.grid()

    def timer(self, timeout, callback):
        self.root.after(timeout, callback)

    def updatePlaceList(self, placeList: [str]):
        self.mw.placeList = placeList

    def setProgressStatus(self, status):
        self.mw.setProgressStatus(status)

    def bindEvent(self, event, cb, data=False):
        """ register events to notify Controller on GUI interactions
            and allows to execute functions in the tk-thread by
            generating events from other threads
            this is the suggested way of inter-thread notifications
        """

        if data:
            cmd = self.root.register(cb)
            self.root.tk.call("bind", self.root, event, f"{cmd} %d")
        else:
            self.root.bind(event, cb)

    def event(self, *args, **kwargs):
        """ allows to manually generate events, may be called from other threads """
        self.root.event_generate(*args, **kwargs, when="tail")

    @property
    def SelectedPlaceIdx(self):
        return self.mw.SelectedPlaceIdx

    def _set_webserver_url(self, url):
        self.mw.sideframes["Connected"]._set_webserver_url(url)

    def _set_placename(self, name):
        self.mw.sideframes["AlreadyLocked"]._set_placename(name)
        self.mw.sideframes["Connected"]._set_placename(name)

    def _queue_cancellable(self, status):
        self.mw._queue_cancellable(status)

    def _place_selectable(self, value: bool):
        self.mw._place_selectable(value)

    sideFrame = property(fset=_side_frame)
    Placename = property(fset=_set_placename)
    WebserverURL = property(fset=_set_webserver_url)
    PlaceSelectable = property(fset=_place_selectable)
    QueueCancellable = property(fset=_queue_cancellable)


class Model():
    def __init__(self):
        self.c = RPAClient(__name__)
        self.config_path = "./rpa_cfg.yml"
        try:
            self.c.config.from_yml(self.config_path)
        except FileNotFoundError:
            pass
        self.c.config["_keyonly_auth"] = True

        self.p = None
        self.runner = [None]

    def releasePlace(self):
        self.c.releasePlace()
        self.p = None

    def getPlace(self, name=None):
        self.p = self.c.Place(name)

    def runWebserver(self, webserver_down_cb):
        # TODO: assuming that port is available - otherwise OSError is raised
        def webserver():
            port_forwardings = [
                "-L8081:127.0.0.1:8081",
                "-L8082:203.0.113.2:80",
                "-L5850:203.0.113.2:5850",
                "-tt",  # force pseudo TTY-allocation ensures that webserver is stopped with ssh process
            ]
            try:
                logging.debug("starting up webserver")
                with self.p.runCommand(["python3", "/opt/ddca/bin/webserver/webserver.py", "-P", "8081", "-L", "8080", "-r", "/opt/ddca/bin/webserver/webroot", "-S", "/opt/ddca/bin/webserver/sof"], ssh_args=port_forwardings, disconnect_file_handles=True, runner_obj=self.runner) as proc:
                    proc.wait()
                    # TODO: log webserver output instead of disconnecting stdout, stderr
#                    while True:
#                        line = proc.stdout.readline()
#                        if line == "":
#                            break
                logging.debug("webserver exited")
                if event_shutdown.is_set():
                    pass
                else:
                    logging.debug(f"webserver exited unexpectedly, return value: {proc.returncode}, stdout: {proc.stdout}, stderr: {proc.stderr}")
                    webserver_down_cb("remote webserver exited unexpectedly")
            except Exception as e:
                logging.debug(f"webserver EXCEPTION: {e}")
                if event_shutdown.is_set():
                    # if shutdown is intended: everything is ok
                    pass
                else:
                    webserver_down_cb(e)

        self.t_webserver = threading.Thread(target=webserver, name="remote webserver") #, daemon=True)
        self.t_webserver.start()

    def terminateWebserver(self):
        try:
            if self.runner[0]:
                self.runner[0].terminate()
        except:
            pass

    @property
    def ConnectionStatus(self):
        lockstate = self.c.LockState
        return ConnectionStatus.from_response(lockstate)

    @property
    def PlaceList(self):
        ls = self.c.LockState
        self.places = self.c.Places
        names = []
        for place in self.places:
            s = "  "
            if place.state == PlaceState.LOCKED:
                if place.name == ls.name:
                    s += "[assigned]"
                else:
                    s += "[locked]"
            elif place.state == PlaceState.FREE:
                s += "[free]"
            else:
                s += "[unknown]"
            s += f" {place.name}"
            names.append(s)

        return names

    def getPlaceByIdx(self, idx):
        return self.places[idx]

    @property
    def Videostreams(self):
        self.p = self.c.Place()
        return self.p.videostreams

    @property
    def Placename(self):
        if self.p:
            return self.p.name
        else:
            return ""

    def _take_over(self, state: bool):
        self.c.rpa_main = state

    TakeOver = property(fset=_take_over)


class RPAEventHandlerThread(threading.Thread):
    def __init__(self, queue, cb_event):
        super().__init__(target=self.__class__)
        self.queue = queue
        self.cb_event = cb_event
        self.daemon = True

    def run(self):
        while True:
            r = self.queue.get()
            if r.status == RPAStatus.WAITING:
                self.cb_event("<<GUIInteraction>>", data=f"{Event.RPA_QUEUED}:")
            if r.status == RPAStatus.ASSIGNED:
                self.cb_event("<<GUIInteraction>>", data=f"{Event.RPA_LOCKED}:")


class Controller():

    def __init__(self, esp: ExitSignalPublisher):
        esp.subscribe(self)  # stop application on CTRL-C from terminal

        self.fsm = UIStateMachine()
        self.fsm.run()

    def terminate(self):
        self.fsm.stop()
        logging.debug(f"running threads: {threading.enumerate()}")


if __name__ == '__main__':
    options = docopt(usage_msg, version="1.2.1")

    esp = ExitSignalPublisher()

    if options["--debug-log"]:
        configure_logger()

    c = Controller(esp)

    event_tk_stopped.wait()
    signal.pthread_kill(threading.get_ident(), signal.SIGINT)
