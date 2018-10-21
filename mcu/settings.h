#ifndef _SETTINGS_H_
#define _SETTINGS_H_

#include "structs.h"

global_settings global_settings_get();
void global_settings_set(global_settings* g);
void global_settings_set_defaults();
void global_settings_send();

uint8_t profile_get(profile* p, uint8_t id);
uint8_t profile_set(profile* p, uint8_t id);
uint8_t profile_set_defaults(uint8_t id);
void profile_send(uint8_t id);

#endif /* _SETTINGS_H_ */
