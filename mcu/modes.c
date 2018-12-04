#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#include "modes.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"
#include "adc.h"


void _mode_continous(uint32_t second) {
  local_persist uint32_t last_second = 0;
adc_init();


DDRD |= (1 << PD6); //output
DDRC |= (1 << PC2); // input.
PORTC |= (1 << PC2); // enable pullup.
//Endstops
DDRD &= ~((1 << PD2) | (1 << PD3)); // input. irgendwo falsch
PORTD |= (1 << PD2) | (1 << PD3); // enable pullup.
  /* entered once per second: */
  if (last_second != second) {
    char seconds[11];
    uint32_to_str(second, seconds);
    debug_string("\n\r");
    debug_string(seconds);

  }
  /* TODO: Joystick fahren */
//while (!deadzone)
if(!(PINC & (1<<PC2))){
  DDRC |= (1 << PC1);
  PORTC |= (1 << PC1);
  _delay_ms(200);
  PORTC &= ~(1 << PC1);

  uart_send_string("i bims ein button\n\r");
}
while (1) {
// while (!(joystickX >= 440 && joystickX <= 584)){
uint16_t joystickX = adc_read(3);
uint8_t left_endstop_activ, right_endstop_activ;
if(PIND & (1<<PD3)){//left
  left_endstop_activ = 1; //pressed
}else{
  left_endstop_activ = 0; //not pressed
}
if(PIND &(1<<PD2)){//right
  right_endstop_activ = 1;//pressed
}else{
  right_endstop_activ = 0;//not pressed
}
if (joystickX >= 480 && joystickX <= 544){
  break;
}
if(left_endstop_activ){
if(joystickX >= 0 && joystickX<=159){//left fullspeed
      PORTD |= (1 << PD6); //pin high (direction left)
      for(int i = 0; i<10;i++){
      _delay_us(1);
      PIND |= (1 << PD7); // toggle motor.
    }
  }else if(joystickX >= 160 && joystickX<=319){//left normal speed
    PORTD |= (1 << PD6); //pin high (direction left)
    for(int i = 0; i<10;i++){
    _delay_us(10);
    PIND |= (1 << PD7); // toggle motor.
  }

  }else if(joystickX >= 320 && joystickX<=479){//left low speed
    PORTD |= (1 << PD6); //pin high (direction left)
    for(int i = 0; i<10;i++){
    _delay_us(100);
    PIND |= (1 << PD7); // toggle motor.
  }

  }
}
if(right_endstop_activ){
if(joystickX >= 545 && joystickX<=704){//right low speed
      PORTD &= ~(1 << PD6); //pin low (direction right)
      for(int i = 0; i<10;i++){
      _delay_us(100);
      PIND |= (1 << PD7); // toggle motor.
    }

  }else if(joystickX >= 705 && joystickX<=864){//right normal speed
      PORTD &= ~(1 << PD6); //pin low (direction right)
      for(int i = 0; i<10;i++){
      _delay_us(10);
      PIND |= (1 << PD7); // toggle motor.
    }

  }else if(joystickX >= 865 && joystickX<=1023){//right fullspeed
      PORTD &= ~(1 << PD6); //pin low (direction right)
      for(int i = 0; i<10;i++){
      _delay_us(1);
      PIND |= (1 << PD7); // toggle motor.
    }
  }
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
  DDRD &= ~((1 << PD2) | (1 << PD3)); // input. irgendwo falsch
  PORTD |= (1 << PD2) | (1 << PD3); // enable pullup.
  DDRD |= (1 << PD6); //output


  if (last_second != second) {
  }
  //global_settings global = global_settings_get();



  //profile p;
  //for SSS mode
  //profile_get(&p, global_settings.active_profile());

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


  //_delay_ms(p.startup_delay());

  // 1. step:
  //0 = nach links
  //1 = nach rechts
  /*if(p.direction() == 0){
    PORTD |= (1 << PD6); //pin high (direction left)
  }else{
    PORTD &= ~(1 << PD6); //pin low (direction right)
  }

  */

  for (int i = 0; i < 50; i++) {
    //_delay_us(p.step_delay());
    _delay_us(1);
    PIND |= (1 << PD7); // toggle motor.
    //_delay_us(p.step_delay());
    _delay_us(1);
  }
  PORTD &= ~(1 << PD7);

  // 2. wait for vibrations to settle:
  _delay_ms(1000);
  //_delay_ms(p.cooldown());//todo cooldown

  // 3. trigger camera:
  {
    DDRC |= (1 << PC1);
    PORTC |= (1 << PC1);
    _delay_ms(200);//hardcoded
    PORTC &= ~(1 << PC1);
  }

  // 4. wait for camera:
  _delay_ms(1000);//todo

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

