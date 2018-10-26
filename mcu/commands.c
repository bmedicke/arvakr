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
      case '0':
        profile_send(0);
        break;
      case '1':
        profile_send(1);
        break;
      case '2':
        profile_send(2);
        break;
      case '3':
        profile_send(3);
        break;
      case '4':
        profile_send(4);
        break;
      case '5':
        profile_send(5);
        break;
      case '6':
        profile_send(6);
        break;
      case '7':
        profile_send(7);
        break;
      case '8':
        profile_send(8);
        break;
      case '9':
        profile_send(9);
        break;
      default:
        uart_transmit('?');
    }
  }
}


