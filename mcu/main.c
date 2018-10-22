/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#ifndef BAUD
#define BAUD 115200
#endif

#include <avr/interrupt.h>
#include "settings.h"
#include "uart.h"

void handle_commands() {
  uint8_t command;
  if (uart_receive_nonblocking(&command)) {
    switch (command) {
      case 'r': /* reset global settings to default */
        global_settings_set_defaults();
        break;
      case 'i': /* read global settings and send it over uart */
        global_settings_send();
        break;
      default:
        uart_transmit('?');
    }
  }
}

void handle_mode(uint8_t mode) {
    switch (mode) {
      case continous:
        break;
      case step_shoot_step:
        break;
      case bulb:
        break;
    }
}

int main() {
  uart_init(BAUD);

  global_settings global = global_settings_get();
  if (global.uart_debug)
    global_settings_send();

  profile p;
  if (!profile_get(&p, global.active_profile))
    uart_sendstring("invalid profile!");

  if (global.uart_debug)
    profile_send(global.active_profile);

  sei();

  while (1) {
    handle_commands();
    handle_mode(p.drive_mode);
  }
}

