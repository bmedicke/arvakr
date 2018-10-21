/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#ifndef BAUD
#define BAUD 115200
#endif

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
    }
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

  while (1) {
    handle_commands();
    switch (p.drive_mode) {
      case continous:
        break;
      case step_shoot_step:
        break;
      case bulb:
        break;
    }
  }
}

