#include "modes.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"
#include "adc.h"

void _mode_continous(uint32_t second) {
  local_persist uint32_t last_second = 0;
adc.init();
uint16_t joystickX = adc_read(3);
DDRC |= (1 << PC2); // input.
PORTC |= (1 << PC2); // enable pullup.
  /* entered once per second: */
  if (last_second != second) {
    char seconds[11];
    uint32_to_str(second, seconds);
    debug_string("\n\r");
    debug_string(seconds);

  }
  /* TODO: Joystick fahren */
//while (!deadzone)
if(PINC & (1<<PC2)){
  DDRC |= (1 << PC1);
  PORTC |= (1 << PC1);
  _delay_ms(200);
  PORTC &= ~(1 << PC1);
}
while (!(joystickX >= 480 && joystickX <= 544)){

  if(joystickX >= 0 && joystickX<=159){//left fullspeed

  }else if(joystickX >= 160 && joystickX<=319){//left normal speed

  }else if(joystickX >= 320 && joystickX<=479){//left low speed

  }else if(joystickX >= 545 && joystickX<=704){//right low speed

  }else if(joystickX >= 705 && joystickX<=864){//right normal speed

  }else if(joystickX >= 865 && joystickX<=1023){//right fullspeed

  }

}
//Video während dem fahren triggern?

  last_second = second;
}

void _mode_step_shoot_step(uint32_t second) {
  local_persist uint32_t last_second = 0;
//eeprom einlesen
  /* entered once per second: */

  //Endstops
  DDRD |= (1 << PD2) | (1 << PD3); // input.
  PORTD |= (1 << PD2) | (1 << PD3); // enable pullup.

  if (last_second != second) {
  }
  global_settings global = global_settings_get();



  profile p;
  if(global_settings.active_profile() == 1) {//for SSS mode
    profile_get(&p, global_settings.active_profile());
  }
  while(1){
    //TODO
    //von eeprom lesen?
    //todo endstop = richtungswechsel oder stop
    //notlösung: abfragen ob notstop erreicht wurde !!!! vor schritt 1
    //variabel machen

    if (PIND & (1 << PD2)){
      //or other change direction

      _delay_ms(300);
    }

  // 1. step:
  _delay_ms(p.startup_delay());
  if(p.direction() == "left")//if which direction set stepper in the other direction
  for (int i = 0; i < 50; i++) {
    _delay_us(p.step_delay());
    PIND |= (1 << PD7); // toggle motor.
    _delay_us(p.step_delay());
  }
  PORTD &= ~(1 << PD7);

  // 2. wait for vibrations to settle:
  _delay_ms(p.cooldown());//todo cooldown

  // 3. trigger camera:
  {
    DDRC |= (1 << PC1);
    PORTC |= (1 << PC1);
    _delay_ms(200);//hardcoded
    PORTC &= ~(1 << PC1);
  }

  // 4. wait for camera:
  _delay_ms(5000);//todo

}
  last_second = second;
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

