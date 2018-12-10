#ifndef _STRUCTS_H_
#define _STRUCTS_H_

#include <stdint.h>

#define GLOBAL_SETTINGS_START_ADDRESS 0
#define GLOBAL_SETTINGS_SIZE 24

#define PROFILE_START_ADDRESS GLOBAL_SETTINGS_SIZE - 1
#define PROFILE_SIZE 50
#define NUMBER_OF_PROFILES 20

enum drive_modes { continous, step_shoot_step, bulb };

/* global settings */
typedef struct {
  uint8_t version; // 1
  uint8_t autostart; // 2
  uint8_t status_led; // 3
  uint8_t uart_debug; // 4
  uint8_t active_profile; // 5
  uint32_t authentication_token; // 6
} global_settings;

/* profile */
typedef struct {
  uint8_t profile_version; // 7
  uint8_t CRC; // 8
  uint8_t drive_mode; // 9

  /* step-shoot-step variables: */
  uint8_t direction; // 10
  uint32_t startup_delay; // 11
  uint8_t step_speed; // 12
  uint8_t vibrations_duration; // 13
  uint8_t post_shutter_delay; // 14
  uint8_t relay_trigger_duration; // -
  uint8_t microstep_enabled; // 15
} profile;

#endif /* _STRUCTS_H_ */
