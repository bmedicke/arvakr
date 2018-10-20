/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "timer.h"
#include "uart.h"

struct profile {
  uint8_t a;
};

void send_instructions() {
  uart_sendstring("benbenben");
}

void write_stuff() {
  char* string = "ben!ben!";
  for (int i = 0;i < 10;i++)
    eeprom_update_byte((uint8_t*) i, string[i]);
}

void read_stuff() {
  uint8_t byte = 0;
  for (int i = 0;i < 10;i++) {
    byte = eeprom_read_byte((uint8_t*) i);
    uart_transmit(byte);
  }
}

void test() {
  uart_transmit(sizeof(struct profile)+'0');
}

int main() {
  uart_init(BAUD);

  char c;
  while (1) {
    c = uart_receive();
    switch (c) {
      case 'r':
        read_stuff();
        break;
      case 'w':
        write_stuff();
        break;
      case 't':
        test();
        break;
    }
  }
}
