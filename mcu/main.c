/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#include "settings.h"
#include "uart.h"

int main() {
  uart_init(115200);
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

