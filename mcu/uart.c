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
  while (! ( UCSR0A & (1<<UDRE0))) ;
  UDR0=c;
}

uint8_t uart_receive ()
{
  while (! ( UCSR0A & (1<<RXC0))) ;  // this waits for a received character!
  // attention: the CPU stays here until a character comes into the UART.
  //  (maybe not what you want for assignment 2 ...)
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

void uart_sendstring( char * str )      // sends all characters of a string (until the 0 at the end) to the UART
{
  while ( * str ) {                   // loop over all characters in the string (until zero at the end)
    uart_transmit(*str);
    str++;
  }
}

