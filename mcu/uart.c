#include <avr/io.h>

void uart_init (uint32_t baudrate)
{
  uint16_t ubrr = (F_CPU / 8 / baudrate) -1;
  UBRR0H = (uint8_t) (ubrr >> 8) ;
  UBRR0L = (uint8_t) (ubrr & 0xff);
  UCSR0A = (1<<U2X0);
  UCSR0B = (1<<TXEN0) | (1<<RXEN0);
}

void uart_transmit (uint8_t c)
{
  while (! (UCSR0A & (1<<UDRE0)));
  UDR0=c;
}

uint8_t uart_receive ()
{
  while (!(UCSR0A & (1<<RXC0)));
  return(UDR0);
}

uint8_t uart_receive_nonblocking(uint8_t* command) {
  if (UCSR0A & (1<<RXC0)) {
    *command = UDR0;
    return 1;
  } else {
    return 0;
  }
}

void uart_send_string(char* str) {
  /* pointer starts out on leftmost character of our string */
  /* while our pointer points to anything but '\0' send the value */
  while (*str) {
    uart_transmit(*str);
    str++;
  }
}

