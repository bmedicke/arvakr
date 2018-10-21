/* vim: foldmethod=syntax foldnestmax=1 foldenable
   benjamin medicke */

#include <avr/io.h>
#include <avr/eeprom.h>

#include "uart.h"

struct profile {
  uint8_t a, b;
};

void write_stuff() {
  struct profile p;
  p.a = 'b';
  p.b = 'b';
  eeprom_update_block(&p, 0, sizeof(p));
}

void read_stuff() {
  struct profile p;
  eeprom_read_block(&p, 0, sizeof(p));
  uart_transmit(p.a);
  uart_transmit(p.b);
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
