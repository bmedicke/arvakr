#include <avr/interrupt.h>

#include "commands.h"
#include "eexternal_eprom.h"
#include "modes.h"
#include "programming_mode.h"
#include "settings.h"
#include "timer.h"
#include "uart.h"
#include "utils.h"

#define UART_BAUD 9600
#define I2C_SCL 400000

volatile global_variable uint32_t
second; /* 32bit is enough to store ~136 years */

ISR(TIMER1_OVF_vect) {
  reset_timer();
  second++;
}

int main() {
  uart_init(UART_BAUD);
  external_eeprom_init(I2C_SCL);
  timer_init();
  sei();

  global_settings global = global_settings_get();

  profile p;
  if (!profile_get(&p, global.active_profile))
    error_string("profile id out of range!");

  if (global.uart_debug) {
    global_settings_send();
    profile_send(global.active_profile);
    // TODO: check if eeprom online!
    /* external_eeprom_dump(); */
  }

  block_for_programming_mode_window(&second);
  /* TODO: reread settings, if we entered programming mode! */

  for (;;) {
    handle_commands();
    handle_mode(p.drive_mode, second);
  }
}

