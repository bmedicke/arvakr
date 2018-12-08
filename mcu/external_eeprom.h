#ifndef _EXTERNAL_EEPROM_H_
#define _EXTERNAL_EEPROM_H_

#include <stdint.h>

void external_eeprom_init(uint32_t scl);
void external_eeprom_write_byte(uint16_t target, uint8_t value);
void external_eeprom_update_byte(uint16_t target, uint8_t value);
uint8_t external_eeprom_read_byte(uint16_t target);
void external_eeprom_dump();

#endif /* _EXTERNAL_EEPROM_H_ */
