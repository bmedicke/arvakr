#include "modes.h"
#include "uart.h"
#include "settings.h"
#include "utils.h"

void _mode_continous(uint32_t second) {
  static uint32_t last_second = 0;

  if (last_second != second) {
    /* called once per second. */
    char seconds[11];
    uint32_to_str(second, seconds);
    uart_send_string("\n\r");
    uart_send_string(seconds);
  }

  last_second = second;
}

void _mode_step_shoot_step(uint32_t second) {
  static uint32_t last_second = 0;

  if (last_second != second) {
    /* once per second. */
  }

  last_second = second;
}

void _mode_bulb(uint32_t second) {
  static uint32_t last_second = 0;

  if (last_second != second) {
    /* once per second. */
  }

  last_second = second;
}

void handle_mode(uint8_t mode, uint32_t second) {
  switch (mode) {
    case continous:
      _mode_continous(second);
      break;
    case step_shoot_step:
      _mode_step_shoot_step(second);
      break;
    case bulb:
      _mode_bulb(second);
      break;
  }
}

