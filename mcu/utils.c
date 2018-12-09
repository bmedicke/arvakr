#include <avr/io.h>
#include <util/delay.h>

#include "settings.h"
#include "uart.h"
#include "utils.h"

/* 2^8-1 =  3 digits + 1 for string terminator */
void uint8_to_str (uint8_t val, char* target) {
  for (int i = 2; i >= 0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[3] = '\0';
}

/* 2^16-1 =  5 digits + 1 for string terminator */
void uint16_to_str (uint16_t val, char* target) {
  for (int i = 4; i >= 0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[5] = '\0';
}

/* 2^32-1 = 10 digits + 1 for string terminator*/
void uint32_to_str (uint32_t val, char* target) {
  for (int i = 9; i >= 0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[10] = '\0';
}

void debug_string(char* str) {
  if (global_settings_get().uart_debug)
    uart_send_string(str);
}

void error_string(char* str) {
  /* TODO: flash status led red */
  uart_send_string(str);
}

void hardware_reset() {
  /* hardware reset by pulling RESET_ low (via resistor). */
  debug_string("\n\rresetting\n\r");
  _delay_ms(100);
  DDRD |= (1 << PD4);
  PORTD &= ~(0 << PD4);
}
