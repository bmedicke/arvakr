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
  if (last_second != second) {
  }

  while(1){
    //TODO
    //von eeprom lesen?
    //todo endstop = richtungswechsel oder stop
    //notlösung: abfragen ob notstop erreicht wurde !!!! vor schritt 1
    //variabel machen
  // 1. step:
  for (int i = 0; i < 50; i++) {
    _delay_us(1);
    PIND |= (1 << PD7); // toggle motor.
    _delay_us(1);
  }
  PORTD &= ~(1 << PD7);

  // 2. wait for vibrations to settle:
  _delay_ms(3800);

  // 3. trigger camera:
  {
    DDRC |= (1 << PC1);
    PORTC |= (1 << PC1);
    _delay_ms(200);
    PORTC &= ~(1 << PC1);
  }

  // 4. wait for camera:
  _delay_ms(5000);

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

