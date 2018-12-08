#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

#include "settings.h"
#include "uart.h"
#include "utils.h"

// 0   PD0    BT RX
// 1   PD1    BT TX
// 2   PD2    endstop left
// 3   PD3    endstop right
// 4   PD4    hardware reset
// 5   PD5    stepper enable
// 6   PD6    stepper direction
// 7   PD7    stepper step
// A0  PC0    microstep (halfstep)
// A1  PC1    camera trigger (mosfet)
// A2  PC2    joystick button
// A3  PC3    x-achse
// A4  PC4    EEPROM
// A5  PC5    EEPROM

uint16_t count = 0;

void handle_commands() {
  uint8_t command;
  if (uart_receive_nonblocking(&command)) {
    switch (command) {
      case 'R':
        hardware_reset();
        break;
      case 'r':
        global_settings_set_defaults();
        uint8_t i = 0;
        for (; i < 20; i++) profile_set_defaults(i);
        uart_send_string("\n\rwrote default values to eeprom\n\r");
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

