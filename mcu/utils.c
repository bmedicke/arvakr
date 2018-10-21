#include "utils.h"

void uint16_to_str (uint16_t val, char* target) {
  int8_t i;
  for (i=5; i>=0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[6] = 0;
}

void uint32_to_str (uint32_t val, char* target) {
  int8_t i;
  for (i=9; i>=0; i--) {
    target [i] = val % 10 + '0';
    val /= 10;
  }
  target[10] = '\0';
}

