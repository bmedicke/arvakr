/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#ifndef BAUD
#define BAUD 115200
#endif

#include "settings.h"
#include "uart.h"

int main() {
  uart_init(BAUD);
  global_settings_set_defaults();
  global_settings global = global_settings_get();

  if (global.uart_debug) global_settings_send();

  while (1) {
    uint8_t command;
    uint8_t received =  uart_receive_nonblocking(&command);

    if (received) {
      switch (command) {
        default:
          break;
      }
    }
  }
}

