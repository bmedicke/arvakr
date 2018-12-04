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
      case 'e': {
        DDRD |= (1 << PD2); // input.
        PORTD |= (1 << PD2); // enable pullup.
        while (1) {
          if (PIND & (1 << PD2)) uart_send_string("\n\rzu");
          else uart_send_string("\n\roffen");
          _delay_ms(300);
        }
      }
      case 'R':
        /* hardware reset by pulling RESET_ low (via resistor). */
        DDRD |= (1 << PD4);
        PORTD &= ~(0 << PD4);
        break;
      case 'r':
        global_settings_set_defaults();
        uint8_t i = 0;
        for (; i < 20; i++) profile_set_defaults(i);
        break;
      case 't': {
        DDRC |= (1 << PC1);
        PORTC |= (1 << PC1);
        _delay_ms(200);
        PORTC &= ~(1 << PC1);
      }
      break;
      case 'i':
        global_settings_send();
        profile_send(global_settings_get().active_profile);
        break;
      case 'h': {
        while (1) {
          char s[255];
          uint16_to_str(count++, s);
          uart_send_string(s);
          uart_send_string("\n\r");

          // 1. step:
          for (int i = 0; i < 50; i++) {
            _delay_us(1);
            PIND |= (1 << PD7); // toggle motor.
            _delay_us(1);
          }
          PORTD &= ~(1 << PD7);

          // 2. wait for vibrations to settle:
          _delay_ms(3800);

          // 3. trigger camera:
          {
            DDRC |= (1 << PC1);
            PORTC |= (1 << PC1);
            _delay_ms(200);
            PORTC &= ~(1 << PC1);
          }

          // 4. wait for camera:
          _delay_ms(5000);
        }
        break;
      }
      case '0':
        profile_send(0);
        break;
      case '1':
        profile_send(1);
        break;
      case '2':
        profile_send(2);
        break;
      default:
        uart_transmit('?');
    }
  }
}

