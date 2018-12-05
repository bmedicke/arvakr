#include <avr/eeprom.h>
#include <stdint.h>

#include "settings.h"
#include "uart.h"
#include "utils.h"

global_settings global_settings_get() {
  global_settings g;
  eeprom_read_block(&g, GLOBAL_SETTINGS_START_ADDRESS,
                    sizeof(global_settings));
  return g;
}

void global_settings_set(global_settings* g) {
  eeprom_update_block(&g, GLOBAL_SETTINGS_START_ADDRESS,
                      sizeof(global_settings));
}

void global_settings_set_defaults() {
  global_settings g;
  g.version = 0;
  g.authentication_token = -1;
  g.status_led = 1;
  g.autostart = 1;
  g.uart_debug = 1;
  g.active_profile = 0;
  eeprom_update_block(&g, GLOBAL_SETTINGS_START_ADDRESS,
                      sizeof(global_settings));
}

void global_settings_send() {
  char s[11];
  global_settings g = global_settings_get();
  uart_send_string("\n\r\n\rglobal settings\n\r> version: ");
  uart_transmit(g.version + '0');
  uart_send_string("\n\r> status_led: ");
  uart_transmit(g.status_led + '0');
  uart_send_string("\n\r> autostart: ");
  uart_transmit(g.autostart + '0');
  uart_send_string("\n\r> uart_debug: ");
  uart_transmit(g.uart_debug + '0');
  uart_send_string("\n\r> active_profile: ");
  uart_transmit(g.active_profile + '0');
  uart_send_string("\n\r> authentication_token: ");
  uint32_to_str(g.authentication_token, s);
  uart_send_string(s);
  uart_send_string("\n\r");
}

/* ATmega328 uses 16 bit to address the eeprom, so we use uint16_t */

uint8_t profile_get(profile* p, uint8_t id) {
  if (id >= NUMBER_OF_PROFILES) return 0;
  uint16_t destination_address = PROFILE_START_ADDRESS + (id * PROFILE_SIZE);
  eeprom_read_block(p, (void*) destination_address, sizeof(*p));
  return 1;
}

uint8_t profile_set(profile* p, uint8_t id) {
  if (id >= NUMBER_OF_PROFILES) return 0;
  uint16_t destination_address = PROFILE_START_ADDRESS + (id * PROFILE_SIZE);
  eeprom_update_block(p, (void*) destination_address, sizeof(*p));
  return 1;
}

uint8_t profile_set_defaults(uint8_t id) {
  if (id >= NUMBER_OF_PROFILES) return 0;

  profile p;
  //p.cooldown = 0;
  p.drive_mode = 0;
  p.profile_version = 0;
  p.CRC = 0;
  //Step-Shoot-Step variables
  p.direction = 0;
  p.startup_delay = 0; //seconds
  p.step_speed = 1; //mirco seconds
  p.vibrations_duration = 3; //seconds
  p.relay_trigger_duration = 200;//milliseconds
  p.shutter_delay = 1; //seconds

  uint16_t destination_address = PROFILE_START_ADDRESS + (id * PROFILE_SIZE);
  eeprom_update_block(&p, (void*) destination_address, sizeof(p));
  return 1;
}

void profile_send(uint8_t id) {
  /*
  profile p;
  profile_get(&p, id);
  char s[11];

  uart_send_string("\n\rprofile ");
  uart_transmit(id + '0');

  uart_send_string("\n\r> drive_mode: ");
  uart_transmit(p.drive_mode + '0');

  uart_send_string("\n\r> step_count: ");
  uart_transmit(p.step_count + '0');

  uart_send_string("\n\r> cooldown: ");
  uart_transmit(p.cooldown + '0');

  uart_send_string("\n\r> step_delay: ");
  uart_transmit(p.step_delay + '0');

  uart_send_string("\n\r> direction: ");
  uart_transmit(p.direction + '0');

  uart_send_string("\n\r> dynamic_curve: ");
  uart_transmit(p.dynamic_curve + '0');

  uart_send_string("\n\r> profile_version: ");
  uart_transmit(p.profile_version + '0');

  uart_send_string("\n\r> startup_delay: ");
  uint32_to_str(p.startup_delay, s);
  uart_send_string(s);
  uart_send_string("\n\r");
  */
}
