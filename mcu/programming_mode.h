#ifndef _PROGRAMMING_MODE_
#define _PROGRAMMING_MODE_

#include <stdint.h>

void block_for_programming_mode_window(volatile uint32_t* second);
void _programming_mode();

#endif /* _PROGRAMMING_MODE_ */
