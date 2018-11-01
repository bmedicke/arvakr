#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdint.h>

void uint16_to_str(uint16_t val, char* target); /* string should be  6 char */
void uint32_to_str(uint32_t val, char* target); /* string should be 11 char */

void debug_string(char* str);
void error_string(char* str);

#endif /* _UTILS_H_ */
