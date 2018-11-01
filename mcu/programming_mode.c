#include <stdint.h>

#include "programming_mode.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"

#define WAIT_FOR_SECONDS 10

#define START_OF_TEXT ';' //TODO: use '\2'
#define END_OF_TEXT   ';' //TODO: use '\3'

uint8_t programming_mode_window(uint32_t second) {
  /* keep track of wheter we already entered programming mode,
   * to avoid accidental multiple invokations */
  static uint8_t already_executed = 0;

  uint8_t c = 0;
  if (uart_receive_nonblocking(&c)) {
    switch (c) {
      case START_OF_TEXT:
        _programming_mode();
        already_executed = 1;
        break;
    }
  }

  if (already_executed || (second >= WAIT_FOR_SECONDS))
    return 0;

  return 1;
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
