#!python3
# coding: utf-8

import ui
import cb
import time
import notification
from console import hud_alert

view = None  # keep track of our view.

VERSION = 1
START = ';'
END = ';'
SEP = '!'


class global_settings:
    def __init__(self):
        self.version = VERSION
        self.autostart = 1
        self.status_led = 1
        self.uart_debug = 1
        self.active_profile = 0
        self.authentication_token = 0


class profile_settings:
    def __init__(self):
        self.startup_delay = 0
        self.drive_mode = 0
        self.step_count = 0
        self.cooldown = 0
        self.step_delay = 0
        self.direction = 0
        self.dynamic_curve = 0
        self.profile_version = VERSION
        self.CRC = 0


# central role:
class BLEDeviceManager(object):
    def __init__(self):
        self.peripheral = None
        self.characteristic = None
        self.autoscroll_enable = 1

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

    def test(self, sender):
        c = self.characteristic
        # self.peripheral.write_characteristic_value(c, self.profile.cmd, True)

    def console_clear(self, sender):
        view['console_textview'].text = ''

    def console_copy(self, sender):
        pass

    def set_autoscroll(self, sender):
        self.autoscroll_enable = sender.value

    def upload(self, sender):
        c = self.characteristic

        payload = (
            str(self.global_settings.version)
            + SEP
            + str(self.global_settings.autostart)
            + SEP
            + str(self.global_settings.status_led)
            + SEP
            + str(self.global_settings.uart_debug)
            + SEP
            + str(self.global_settings.active_profile)
            + SEP
            + str(self.global_settings.authentication_token)
            + SEP
            + str(self.profile.startup_delay)
            + SEP
            + str(self.profile.drive_mode)
            + SEP
            + str(self.profile.step_count)
            + SEP
            + str(self.profile.cooldown)
            + SEP
            + str(self.profile.step_delay)
            + SEP
            + str(self.profile.direction)
            + SEP
            + str(self.profile.dynamic_curve)
            + SEP
            + str(self.profile.profile_version)
            + SEP
            + str(self.profile.CRC)
        )

        self.peripheral.write_characteristic_value(c, START, True)
        self.peripheral.write_characteristic_value(c, payload, True)
        self.peripheral.write_characteristic_value(c, END, True)

    def mcu_reset(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, 'R', True)

    def ble_disconnect(self, sender):
        cb.reset()

    def ble_connect(self, sender):
        pass

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
        if sender.title == 'continuous':
            self.profile.drive_mode = 0
        elif sender.title == 'step-shoot-step':
            self.profile.drive_mode = 1
        elif sender.title == 'bulb':
            self.profile.drive_mode = 2

        hud_alert('selected ' + self.sender.title)

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
