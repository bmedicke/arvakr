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


# central role:
class BLEDeviceManager(object):
    def __init__(self):
        self.peripheral = None
        self.characteristic = None
        self.global_settings = global_settings()
        self.profile = profile_settings()

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
        pass

    def upload_profile(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, self.profile.cmd, True)

    def test(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, 'i', True)

    def get_size(self, sender):
        hud_alert(str(ui.get_window_size()))

    def load_profile(self, sender):
        if sender.title == 'bulb':
            self.profile.name = 'bulb'
            self.profile.cmd = 'B'

        elif sender.title == 'continuous':
            self.profile.name = 'continuous'
            self.profile.cmd = 'C'

        elif sender.title == 'step-shoot-step':
            self.profile = profile_settings()

        else:
            self.profile = profile_settings()

        hud_alert('selected ' + self.profile.name)

    def close(self):
        cb.reset()


mcmd = BLEDeviceManager()
cb.set_central_delegate(mcmd)
cb.scan_for_peripherals()

width = min(ui.get_window_size())

# full screen
if width >= 768:
    v = ui.load_view('gui')
    v.present()

# split screen and slide out menu:
elif width == 320 or width == 694 or width == 507:
    v = ui.load_view('gui_tiny')
    v.present()

# fallback
else:
    mcmd.get_size(None)
    v = ui.load_view('gui_tiny')
    v.present()

v.wait_modal()  # block 'till view closes.
cb.reset()  # reset the ble connection.
