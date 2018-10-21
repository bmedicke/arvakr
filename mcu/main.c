/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#include <avr/io.h>

#include "settings.h"
#include "structs.h"
#include "uart.h"
#include "utils.h"

void send_ready_note() {
  uart_sendstring("ready\n\r");
}

int main() {
  uart_init(115200);
  send_ready_note();
  global_settings_set_defaults();

  while (1) {
    uint8_t command;
    uint8_t received =  uart_receive_nonblocking(&command);
    if (received) {
      switch (command) {
        case 'i':
          send_global_settings();
          break;
        default:
          break;
      }
    }
  }
}

