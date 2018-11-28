#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#include "settings.h"
#include "uart.h"
#include "utils.h"

// 0    BT RX
// 1    BT TX
// 2    endstop left
// 3    endstop right
// 4    reset
// 5    enable
// 6    direction
// 7    step
// A0   ---
// A1   camera trigger (mosfet)
// A2   joystick button
// A3   x-achse
// A4   EEPROM
// A5   EEPROM

uint16_t count = 0;

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
      case 'h': {
        while (1) {
          _delay_ms(1000);
          char s[255];
          uint16_to_str(count++, s);
          uart_send_string(s);
          uart_send_string("\n\r");

          DDRD |= (1 << PD5) | (1 << PD6) | (1 << PD7);
          PORTD &= ~(1 << PD5); /* enable driver by pulling /enable low. */
          for (int i = 0; i < 50; i++) {
            _delay_us(1);
            PIND |= (1 << PD7);
            _delay_us(1);
          }
          PORTD &= ~(1 << PD7);
        }
        break;
      }
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

