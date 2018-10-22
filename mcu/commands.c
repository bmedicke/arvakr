#include <stdint.h>
#include "settings.h"
#include "uart.h"

void handle_commands() {
  uint8_t command;
  if (uart_receive_nonblocking(&command)) {
    switch (command) {
      case 'r':
        global_settings_set_defaults();
        break;
      case 'i':
        global_settings_send();
        profile_send(global_settings_get().active_profile);
        break;
      default:
        uart_transmit('?');
    }
  }
}


