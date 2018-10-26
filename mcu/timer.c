#include <avr/io.h>

#include "timer.h"

#define TIMER1_OFFSET 0

void reset_timer() {
  /* result in overflow event once per second */
  TCNT1 = 49911;
}

void timer_init() {
  TCCR1B = ((1 << CS12) | (1 << CS10)); /* timer 1 prescaler 1024. */
  TIMSK1 |= (1 << TOIE1); /* enable timer 1 overflow interrupts. */
  reset_timer();
}
