#include <stdint.h>

#include "programming_mode.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"

#define PROGRAMMING_MODE_WINDOW 10

#define START_OF_TEXT ';' //TODO: use '\2'
#define END_OF_TEXT   ';' //TODO: use '\3'

void block_for_programming_mode_window(volatile uint32_t* second) {
  debug_string("\n\r> opened programming mode window.");

  uint8_t c = 0;

  while (*second < PROGRAMMING_MODE_WINDOW) {
    uart_receive_nonblocking(&c);
    if (c == START_OF_TEXT) {
      _programming_mode();
      break;
    }
  }

  debug_string("\n\r> closed programming mode window.");
}

void _programming_mode() {
  debug_string("\n\r>> started programming");

  uint8_t c = 0;
  for (;;) {
    uart_receive_nonblocking(&c);
    if (c == END_OF_TEXT) break;
    /* TODO: deserialize data and save to global settings/profile. */
  }

  debug_string("\n\r>> ended programming");
}
