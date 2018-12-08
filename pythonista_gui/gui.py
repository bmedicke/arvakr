#!python3
# coding: utf-8

import ui
import cb
import time
import notification
from console import hud_alert

view = None  # keep track of our view.

VERSION = 2
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
        self.post_shutter_delay = 1
        self.step_speed = 1
        self.vibration_duration = 3
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

    def did_update_value(self, c, error):
        if c.uuid == 'FFE1':
            view['console_textview'].text += c.value.decode().replace('\r', '')
            if self.autoscroll_enable:
                view['console_textview'].content_offset = (
                    0,
                    view['console_textview'].content_size[1]
                    - view['console_textview'].height,
                )

    def console_clear(self, sender):
        view['console_textview'].text = ''

    def test(self, sender):
        c = self.characteristic
        payload = 'T'
        self.peripheral.write_characteristic_value(c, payload, True)

    def info(self, sender):
        c = self.characteristic
        payload = 'i'
        self.peripheral.write_characteristic_value(c, payload, True)

    def trigger(self, sender):
        c = self.characteristic
        payload = 't'
        self.peripheral.write_characteristic_value(c, payload, True)

    def eeprom_reset(self, sender):
        c = self.characteristic
        payload = 'r'
        self.peripheral.write_characteristic_value(c, payload, True)

    def upload(self, sender):
        c = self.characteristic

        payload = (
            str(self.global_settings.version)
            + SEP
            + str(int(self.global_settings.autostart))
            + SEP
            + str(int(self.global_settings.status_led))
            + SEP
            + str(int(self.global_settings.uart_debug))
            + SEP
            + str(self.global_settings.active_profile)
            + SEP
            + str(self.global_settings.authentication_token)
            + SEP
            + str(self.profile.profile_version)
            + SEP
            + str(self.profile.CRC)
            + SEP
            + str(self.profile.drive_mode)
            + SEP
            + str(self.profile.direction)
            + SEP
            + str(self.profile.startup_delay)
            + SEP
            + str(self.profile.step_speed)
            + SEP
            + str(self.profile.vibration_duration)
            + SEP
            + str(self.profile.post_shutter_delay)
        )

        self.peripheral.write_characteristic_value(c, START, True)
        self.peripheral.write_characteristic_value(c, payload, True)
        self.peripheral.write_characteristic_value(c, END, True)

    def mcu_reset(self, sender):
        c = self.characteristic
        self.peripheral.write_characteristic_value(c, 'R', True)

    def ble_disconnect(self, sender):
        cb.reset()

    def close(self):
        cb.reset()

    def autoscroll(self, sender):
        self.autoscroll_enable = sender.value

    def autostart(self, sender):
        self.global_settings.autostart = sender.value

    def status_led(self, sender):
        self.global_settings.status_led = sender.value

    def uart_debug(self, sender):
        self.global_settings.uart_debug = sender.value

    def mode(self, sender):
        self.profile.drive_mode = sender.selected_index

    def direction(self, sender):
        self.profile.direction = sender.selected_index

    def step_speed(self, sender):
        self.profile.step_speed = sender.text

    def vibration_duration(self, sender):
        self.profile.vibration_duration = sender.text

    def startup_delay(self, sender):
        self.profile.startup_delay = sender.text

    def post_shutter_delay(self, sender):
        self.profile.post_shutter_delay = sender.text


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
    view = ui.load_view('gui_tiny')
    view.present()

view.wait_modal()  # block 'till view closes.
cb.reset()  # reset the ble connection.
