#include <avr/io.h>
#include <util/delay.h>
#include <util/twi.h> /* two wire interface */

#include "external_eeprom.h"
#include "uart.h"

#define EEPROM_ADDRESS 0b10100000 /* last digit must be 0. */
#define READ_MODE  1
#define WRITE_MODE 0
#define EEPROM_SIZE_IN_BYTES 256
#define WRITE_CYCLE_TIME_IN_MS 5

void _twi_start() {
  TWCR = (1 << TWINT) | (1 << TWSTA) | (1 << TWEN); /* start  bit. */
  while ((TWCR & (1 << TWINT)) == 0); /* block until transmission complete. */
}

void _twi_stop() {
  TWCR = (1 << TWINT) | (1 << TWSTO) | (1 << TWEN); /* stop bit. */
}

uint8_t _twi_read_nack() {
  TWCR = (1 << TWINT) | (1 << TWEN); /* ommit ack bit. */
  while ((TWCR & (1 << TWINT)) == 0); /* block until transmission complete. */
  return TWDR;
}

void _twi_write(uint8_t value) {
  TWDR = value; /* data register. */
  TWCR = (1 << TWINT) | (1 << TWEN);
  while ((TWCR & (1 << TWINT)) == 0); /* block until transmission complete. */
}

void _twi_send_address(uint8_t target) {
  _twi_write((uint8_t)target >> 8);   /* 8 MSB. */
  _twi_write((uint8_t)target & 0xFF); /* 8 LSB. */
}

uint8_t _twi_read_status() {
  return TWSR & ~0b111; /* mask out 3 LSB, we need the 5 MSB. */
}

void external_eeprom_init(uint32_t scl) {
  TWSR = 0; /* clear status register. */
  TWBR = 0.5 * ((F_CPU / scl) - 16); /* calculate bit rate. */
  TWCR = (1 << TWEN); /* enable TWI. */
}

void external_eeprom_write_byte(uint8_t target, uint8_t value) {
  _twi_start();

  _twi_write(EEPROM_ADDRESS | WRITE_MODE); /* select device and mode. */
  _twi_send_address(target);
  _twi_write(value);

  _twi_stop();

  _delay_ms(WRITE_CYCLE_TIME_IN_MS);
}

uint8_t external_eeprom_read_byte(uint8_t target) {
  uint8_t value = 0;
  _twi_start();

  _twi_write(EEPROM_ADDRESS | WRITE_MODE);
  _twi_send_address(target);

  _twi_start();
  _twi_write(EEPROM_ADDRESS | READ_MODE);
  value = _twi_read_nack();

  _twi_stop();
  return value;
}

void external_eeprom_update_byte(uint8_t target, uint8_t value) {
  uint8_t byte = external_eeprom_read_byte(target);
  if (value != byte)
    external_eeprom_write_byte(target, value);
}

void external_eeprom_dump() {
  for (int i =  0; i < EEPROM_SIZE_IN_BYTES; i++) {
    if (i % 8 == 0) uart_transmit(' ');
    if (i % 32 == 0) uart_send_string("\n\r");
    uart_transmit(external_eeprom_read_byte(i) + '0');
  }
  uart_send_string("\n\r");
}

