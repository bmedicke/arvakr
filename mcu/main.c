/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#ifndef BAUD
#define BAUD 115200
#endif

#include "settings.h"
#include "uart.h"

int main() {
  /* setup */
  uart_init(BAUD);

  /* get global settings from the eeprom */
  global_settings global = global_settings_get();

  /* send debug output over uart */
  if (global.uart_debug) global_settings_send();

  while (1) {
    uint8_t command;
    uint8_t received = uart_receive_nonblocking(&command);

    if (received) {
      switch (command) {
        case 'r': /* reset global settings to default */
          global_settings_set_defaults();
          break;
        case 'i': /* read global settings and send it over uart */
          global_settings_send();
          break;
        default:
          break;
      }
    }
  }
}

