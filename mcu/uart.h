#ifndef _UART_H_
#define _UART_H_

#include <stdint.h>

void uart_init(uint32_t baudrate);
void uart_transmit(uint8_t c);
uint8_t uart_receive();
uint8_t uart_receive_nonblocking(uint8_t* received);
void uart_send_string(char* str);

#endif /* _UART_H_ */
