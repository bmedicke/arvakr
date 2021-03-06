#include <avr/interrupt.h>

#include "adc.h"
#include "commands.h"
#include "external_eeprom.h"
#include "modes.h"
#include "programming_mode.h"
#include "settings.h"
#include "timer.h"
#include "uart.h"
#include "utils.h"

#define UART_BAUD 9600
#define I2C_SCL 400000

/* 32bit is enough to store ~136 years: */
volatile global_variable uint32_t second;

ISR(TIMER1_OVF_vect) {
  reset_timer();
  second++;
}

void slider_init() {
  /* stepper: */
  DDRD |= (1 << PD5) | (1 << PD6) | (1 << PD7);
  PORTD &= ~(1 << PD5); /* enable driver by pulling /enable low. */

  /* joystick button: */
  DDRC |= (1 << PC2); /* input. */
  PORTC |= (1 << PC2); /* enable pullup. */

  /* endstops: */
  DDRD &= ~((1 << PD2) | (1 << PD3)); /* input. irgendwo falsch */
  PORTD |= (1 << PD2) | (1 << PD3); /* enable pullup. */

  /* camera trigger: */
  DDRC |= (1 << PC1);
}

int main() {
  /* initialize special function registers: */
  uart_init(UART_BAUD);
  external_eeprom_init(I2C_SCL);
  timer_init();
  adc_init();
  slider_init();
  sei();

  /* wait a few seconds for programming instructions: */
  block_for_programming_mode_window(&second);

  /* read global and profile settings from internal eeprom: */
  global_settings global = global_settings_get();
  profile p;
  if (!profile_get(&p, global.active_profile))
    error_string("profile id out of range!");

  for (;;) {
    /* check for and handle UART commands: */
    handle_commands();
    /* run configured mode: */
    handle_mode(p.drive_mode, second);
  }
}

