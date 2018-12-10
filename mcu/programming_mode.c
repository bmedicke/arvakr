#include <avr/io.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>

#include "programming_mode.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"

#define PROGRAMMING_MODE_WINDOW 3

#define START_OF_TEXT ';'
#define END_OF_TEXT   ';'
#define SEPERATOR     "!"

void block_for_programming_mode_window(volatile uint32_t* second) {
  debug_string("\n\r> opened programming mode window.");

  uint8_t c = 0;

  while (*second < PROGRAMMING_MODE_WINDOW) {
    uart_receive_nonblocking(&c);
    if (c == START_OF_TEXT) {
      _programming_mode();
      break;
    }
  }

  debug_string("\n\r> closed programming mode window.");
}

void _programming_mode() {
  debug_string("\n\r>> started programming\n\r");

  uint8_t i = 0;
  uint8_t c = 0;
  char program_string[255] = {'\0'};

  while (1) {
    if (uart_receive_nonblocking(&c)) {
      if (c == END_OF_TEXT) break;
      program_string[i++] = c;
    }
  }

  debug_string(program_string);

  global_settings global = global_settings_get();

  profile p;
  profile_get(&p, global.active_profile);

  char* token;

  /* deserialize global settings: */

  token = strtok(program_string, SEPERATOR);
  if (token != NULL) global.version = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) global.autostart = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) global.status_led = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) global.uart_debug = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) global.active_profile = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) global.authentication_token = strtol(token, NULL, 10);

  global_settings_set(&global);

  /* deserialize profile: */

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.profile_version = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.CRC = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.drive_mode = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.direction = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.startup_delay = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.step_speed = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.vibrations_duration = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.post_shutter_delay = strtol(token, NULL, 10);

  token = strtok(NULL, SEPERATOR);
  if (token != NULL) p.microstep_enabled = strtol(token, NULL, 10);

  p.relay_trigger_duration = 200;

  profile_set(&p, global.active_profile);
  debug_string("\n\r>> ended programming");
}
