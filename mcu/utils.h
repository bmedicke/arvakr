#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdint.h>

#define local_persist   static
#define global_variable static

void uint8_to_str(uint8_t val, char* target);   /* string should be  4 char */
void uint16_to_str(uint16_t val, char* target); /* string should be  6 char */
void uint32_to_str(uint32_t val, char* target); /* string should be 11 char */

void debug_string(char* str);
void error_string(char* str);

void hardware_reset();

#endif /* _UTILS_H_ */
