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
        self.name = 'step-shoot-step'  # default profile
        self.debug_mode = 1
        self.cmd = 'S'


g = global_settings()
p = profile_settings()


def load_profile(sender):
    global p
    if sender.title == 'bulb':
        p.name = 'bulb'
        p.cmd = 'B'

    elif sender.title == 'continuous':
        p.name = 'continuous'
        p.cmd = 'C'

    elif sender.title == 'step-shoot-step':
        p = profile_settings()

    else:
        p = profile_settings()

    hud_alert('loaded ' + p.name)


class MyCentralManagerDelegate(object):
    def __init__(self):
        self.peripheral = None

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
                self.peripheral.write_characteristic_value(c, p.cmd, True)
                hud_alert('uploaded ' + p.name)

    def did_write_value(self, c, error):
        cb.reset()

    def did_update_value(self, s, error):
        hud_alert('did_update_value')


def upload(sender):
    cb.set_central_delegate(MyCentralManagerDelegate())
    cb.scan_for_peripherals()


v = ui.load_view()
v.present('gui')
