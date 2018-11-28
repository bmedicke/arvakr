#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#include "settings.h"
#include "uart.h"

void handle_commands() {
  uint8_t command;
  if (uart_receive_nonblocking(&command)) {
    switch (command) {
      case 'l':
        DDRB |= (1 << PB5);
        PORTB ^= (1 << PB5);
        break;
      case 'R':
        /* hardware reset by pulling RESET_ low (via resistor). */
        DDRB |= (1 << PB4);
        PORTB &= ~(0 << PB4);
        break;
      case 'r':
        global_settings_set_defaults();
        break;
      case 'i':
        global_settings_send();
        profile_send(global_settings_get().active_profile);
        break;
      case 'T':
        DDRD |= (1<<5)|(1<<6)|(1<<7);
        PORTD &= ~(1<<5); /* enable driver by pulling /enable low. */
        for (int i = 0;i < 50;i++) {
          _delay_us(700);
          PIND |= (1<<PD7);
          _delay_us(700);
        }
        PORTD &= ~(1<<PD7);
        break;
      case '0':
        profile_send(0);
        break;
      case '1':
        profile_send(1);
        break;
      default:
        uart_transmit('?');
    }
  }
}

