#!python3
# coding: utf-8

import ui
import cb
import time
import notification
from console import hud_alert

view = None  # keep track of our view.


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
        self.autoscroll_enable = 1

    def did_discover_peripheral(self, p):
        if p.name == 'MLT-BT05' and not self.peripheral:
            self.peripheral = p
            cb.connect_peripheral(self.peripheral)
        elif p.name == 'BT05' and not self.peripheral:
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
                self.peripheral.set_notify_value(c, True)

    def did_write_value(self, c, error):
        pass

    def did_update_value(self, c, error):
        if c.uuid == 'FFE1':
            view['console_textview'].text += c.value.decode().replace('\r', '')
            if self.autoscroll_enable:
                view['console_textview'].content_offset = (
                    0,
                    view['console_textview'].content_size[1]
                    - view['console_textview'].height,
                )

    def upload(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, self.profile.cmd, True)

    def console_clear(self, sender):
        view['console_textview'].text = ''

    def console_copy(self, sender):
        pass

    def set_autoscroll(self, sender):
        self.autoscroll_enable = sender.value

    def test(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(
            c, ';;', True
        )  # signal start of text.

    def mcu_reset(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, 'R', True)

    def ble_disconnect(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, '', True)

    def ble_connect(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, '', True)

    def stop(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, '', True)

    def pause(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, '', True)

    def toggle_led(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, 'l', True)

    def get_size(self, sender):
        hud_alert(str(ui.get_window_size()))

    def new_command(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, sender.text, True)
        sender.text = ''

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
    view = ui.load_view('gui')
    view.present()
    view['console_textview'].editable = False

# split screen and slide out menu:
elif width == 320 or width == 694 or width == 507:
    view = ui.load_view('gui_tiny')
    view.present()

# fallback
else:
    mcmd.get_size(None)
    view = ui.load_view('gui_tiny')
    view.present()

view.wait_modal()  # block 'till view closes.
cb.reset()  # reset the ble connection.
