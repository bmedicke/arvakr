#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#include "modes.h"
#include "settings.h"
#include "uart.h"
#include "utils.h"
#include "adc.h"
#include "motor.h"


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
  if (!(PINC & (1 << PC2))) {
    DDRC |= (1 << PC1);
    PORTC |= (1 << PC1);
    _delay_ms(200);
    PORTC &= ~(1 << PC1);
  }
  while (1) {
// while (!(joystickX >= 440 && joystickX <= 584)){
    uint16_t joystickX = adc_read(3);
    uint8_t left_endstop_activ, right_endstop_activ;
    if (PIND & (1 << PD3)) { //left
      left_endstop_activ = 1; //pressed
    } else {
      left_endstop_activ = 0; //not pressed
    }
    if (PIND & (1 << PD2)) { //right
      right_endstop_activ = 1;//pressed
    } else {
      right_endstop_activ = 0;//not pressed
    }
    if (joystickX >= 500 && joystickX <= 524) {
      break;
    }
    if (left_endstop_activ) {
      if (joystickX >= 0 && joystickX <= 3) { //left fullspeed
        joystick_leftFullspeed();
      } else if (joystickX >= 4 && joystickX <= 219) { //left normal speed
        joystick_leftNormalspeed();
      } else if (joystickX >= 220 && joystickX <= 499) { //left low speed
        joystick_leftLowspeed();
      }
    }
    if (right_endstop_activ) {
      if (joystickX >= 525 && joystickX <= 804) { //right low speed
        joystick_rightLowspeed();
      } else if (joystickX >= 805 && joystickX <= 1019) { //right normal speed
        joystick_rightNormalspeed();
      } else if (joystickX >= 1020 && joystickX <= 1023) { //right fullspeed
        joystick_rightFullspeed();
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
  global_settings global = global_settings_get();



  profile p;
  //for SSS mode
  profile_get(&p, global.active_profile);
  p.direction = 1;
  if(p.direction == 0){
    PORTD &= ~(1 << PD6);
  }else{
      PORTD |= (1 << PD6);
  }

  while (1) {
    //TODO
    //von eeprom lesen?
    //todo endstop = richtungswechsel oder stop
    //notlösung: abfragen ob notstop erreicht wurde !!!! vor schritt 1
    //variabel machen

    if (PIND & (1 << PD3)) { //left
      PORTD |= (1 << PD6);
      uart_send_string("left endstop hit");
    }
    if (PIND & (1 << PD2)) { //right
      PORTD &= ~(1 << PD6);
      uart_send_string("right endstop hit");
    }

      _delay_ms(300);



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

