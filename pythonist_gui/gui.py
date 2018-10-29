#!python3
# coding: utf-8

import ui
import cb
import time
from console import hud_alert


class global_settings:
    def __init__(self):
        self.debug_mode = 0
        self.active_profile = 0


class profile_settings:
    def __init__(self):
        self.name = 'step-shoot-step'  # default profile.
        self.debug_mode = 0
        self.cmd = 'S'


global_settings = global_settings()
profile = profile_settings()


def load_profile(sender):
    global profile
    if sender.title == 'bulb':
        profile.name = 'bulb'
        profile.cmd = 'B'

    elif sender.title == 'continuous':
        profile.name = 'continuous'
        profile.cmd = 'C'

    elif sender.title == 'step-shoot-step':
        profile = profile_settings()

    else:
        profile = profile_settings()

    hud_alert('selected ' + profile.name)


class BLEDeviceManager(object):
    def __init__(self):
        self.peripheral = None
        self.characteristic = None

    def did_discover_peripheral(self, p):
        if p.name == 'MLT-BT05' and not self.peripheral:
            self.peripheral = p
            cb.connect_peripheral(self.peripheral)

    def did_connect_peripheral(self, p):
        p.discover_services()

    def did_discover_services(self, p, error):
        for s in p.services:
            if s.uuid == 'FFE0':
                p.discover_characteristics(s)

    def did_discover_characteristics(self, s, error):
        for c in s.characteristics:
            if c.uuid == 'FFE1':
                self.characteristic = c

    def did_write_value(self, c, error):
        hud_alert('uploaded ' + profile.name)

    def upload_profile(self, sender):
        pass
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, profile.cmd, True)

    def close(self):
        cb.reset()


mcmd = BLEDeviceManager()
cb.set_central_delegate(mcmd)
cb.scan_for_peripherals()

v = ui.load_view()
v.present('gui')
v.wait_modal()  # block 'till view closes.
cb.reset()  # reset the ble connection.
