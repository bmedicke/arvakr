#include <stdint.h>
#include <avr/eeprom.h>

#include "utils.h"
#include "uart.h"
#include "settings.h"

void global_settings_set_defaults() {
  global_settings g;
  g.version = 0;
  g.autentication_token = -1;
  g.status_led = 1;
  g.autostart = 1;
  g.uart_debug = 1;
  eeprom_update_block(&g, GLOBAL_SETTINGS_START_ADDRESS,
      sizeof(global_settings));
}

global_settings global_settings_get() {
  global_settings g;
  eeprom_read_block(&g, GLOBAL_SETTINGS_START_ADDRESS,
      sizeof(global_settings));
  return g;
}

void global_settings_send() {
  char s[11];
  global_settings g = global_settings_get();
  uart_sendstring("\n\rsizeof\n\r> global_settings: ");
  uart_transmit(sizeof(global_settings)+'0');
  uart_sendstring("\n\r\n\rglobal settings:\n\r> version: ");
  uart_transmit(g.version+'0');
  uart_sendstring("\n\r> status_led: ");
  uart_transmit(g.status_led+'0');
  uart_sendstring("\n\r> autostart: ");
  uart_transmit(g.autostart+'0');
  uart_sendstring("\n\r> uart_debug: ");
  uart_transmit(g.uart_debug+'0');
  uart_sendstring("\n\r> authentication_token: ");
  uint32_to_str(g.autentication_token, s);
  uart_sendstring(s);
  uart_sendstring("\n\r");
}

