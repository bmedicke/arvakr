#include "utils.h"

/* 2^16-1 =  5 digits + 1 for string terminator */
void uint16_to_str (uint16_t val, char* target) {
  for (int i = 4; i >= 0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[5] = '\0';
}

/* 2^32-1 = 10 digits + 1 for string terminator*/
void uint32_to_str (uint32_t val, char* target) {
  for (int i = 9; i >= 0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[10] = '\0';
}

