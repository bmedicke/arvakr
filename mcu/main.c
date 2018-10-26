#include <avr/interrupt.h>

#include "commands.h"
#include "modes.h"
#include "settings.h"
#include "timer.h"
#include "uart.h"

#ifndef BAUD
  #define BAUD 115200
#endif

static uint32_t second; /* 32bit is enough to store ~136 years */

ISR(TIMER1_OVF_vect) {
  reset_timer();
  second++;
}

int main() {
  uart_init(BAUD);
  timer_init();

  global_settings global = global_settings_get();
  if (global.uart_debug)
    global_settings_send();

  profile p;
  if (!profile_get(&p, global.active_profile))
    uart_send_string("profile id out of range!");

  if (global.uart_debug)
    profile_send(global.active_profile);

  sei();

  for (;;) {
    handle_commands();
    handle_mode(p.drive_mode, second);
  }
}

