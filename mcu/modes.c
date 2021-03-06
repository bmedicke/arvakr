#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

#include "adc.h"
#include "modes.h"
#include "motor.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"

void _mode_continous(uint32_t second) {
  local_persist uint32_t last_second = 0;

  /* entered once per second: */
  if (last_second != second) {
    char seconds[11];
    uint32_to_str(second, seconds);
    debug_string("\n\r");
    debug_string(seconds);
  }

  /* trigger camera with joystick button: */
  if (!(PINC & (1 << PC2))) {
    PORTC |= (1 << PC1);
    _delay_ms(200);
    PORTC &= ~(1 << PC1);
  }

  /* handle joystick movement: */
  while (1) {
    uint16_t joystickX = adc_read(3);

    if (joystickX >= 500 && joystickX <= 524) {
      break;
    }

    /* left endstop */
    if (PIND & (1 << PD3)) {
      if (joystickX >= 0 && joystickX <= 3) { // left fullspeed
        joystick_leftFullspeed();
      } else if (joystickX >= 4 && joystickX <= 219) { // left normal speed
        joystick_leftNormalspeed();
      } else if (joystickX >= 220 && joystickX <= 499) { // left low speed
        joystick_leftLowspeed();
      }
    }

    /* right endstop */
    if (PIND & (1 << PD2)) {
      if (joystickX >= 525 && joystickX <= 804) { // right low speed
        joystick_rightLowspeed();
      } else if (joystickX >= 805 && joystickX <= 1019) { // right normal speed
        joystick_rightNormalspeed();
      } else if (joystickX >= 1020 && joystickX <= 1023) { // right fullspeed
        joystick_rightFullspeed();
      }
    }

  }

  last_second = second;
}

void _mode_step_shoot_step(uint32_t second) {
  local_persist uint8_t first_run = 1;
  local_persist uint16_t count = 0;

  char seconds[11];
  uint32_to_str(second, seconds);
  debug_string("\n\r");
  debug_string(seconds);

  profile p;
  global_settings global = global_settings_get();
  profile_get(&p, global.active_profile);

  if (first_run) {
    first_run = 0;

    if(p.microstep_enabled){
      halfstep();
    }else{
      fullstep();
    }

    /* set direction according to active profile: */
    if (p.direction == 0) {
      PORTD &= ~(1 << PD6);
    } else {
      PORTD |= (1 << PD6);
    }

    /* delay startup: */
    for (int c = 0; c < p.startup_delay; c++) _delay_ms(1000);
  }

  /* reverse direction when endstop hit: */
  if (!(PIND & (1 << PD3))) { // left
    PORTD &= ~(1 << PD6);
    debug_string("\n\rleft endstop hit");
  } else if (!(PIND & (1 << PD2))) { // right
    PORTD |= (1 << PD6);
    debug_string("\n\rright endstop hit");
  }

  // 1. step:
  for (int c = 0; c < p.step_speed; c++){
    _delay_ms(50);
    PORTD |= (1 << PD7);
    _delay_ms(50);
    PORTD &= ~(1 << PD7);
  }

  // 2. wait for vibrations to settle:
  for (int c = 0; c < p.vibrations_duration;
       c++) _delay_ms(1000);

  // 3. trigger camera:
  PORTC |= (1 << PC1);
  for (int c = 0; c < p.relay_trigger_duration; c++) _delay_ms(1);
  PORTC &= ~(1 << PC1);

  {
    count++;
    char count_str[6];
    uint16_to_str(count, count_str);
    debug_string("\n\rshutter count: ");
    debug_string(count_str);
  }

  // 4. wait for camera:
  for (int c = 0; c < p.post_shutter_delay; c++) _delay_ms(1000);
}

void _mode_bulb(uint32_t second) {
  local_persist uint32_t last_second = 0;

  /* entered once per second: */
  if (last_second != second) {
  }

  last_second = second;
}

void handle_mode(uint8_t mode, uint32_t second) {
  switch (mode) {
    case continous:
      _mode_continous(second);
      break;
    case step_shoot_step:
      _mode_step_shoot_step(second);
      break;
    case bulb:
      _mode_bulb(second);
      break;
    default:
      _mode_continous(second);
  }
}

