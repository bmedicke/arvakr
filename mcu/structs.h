#ifndef _STRUCTS_H_
#define _STRUCTS_H_

#include <stdint.h>

#define GLOBAL_SETTINGS_START_ADDRESS 0
#define GLOBAL_SETTINGS_SIZE 20
#define PROFILE_START_ADDRESS GLOBAL_SETTINGS_SIZE + 1

typedef struct {
  uint8_t version;
  uint32_t autentication_token;
  uint8_t status_led;
  uint8_t autostart;
  uint8_t debug;
} global_settings;

typedef struct {
  uint8_t drive_mode;
} profile;

#endif /* _STRUCTS_H_ */
