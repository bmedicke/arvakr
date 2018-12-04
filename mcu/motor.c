#include <avr/io.h>
#include <util/delay.h>
#include "motor.h"


#define stepPin PD7            //Define Step pin
#define dirPin PD6             //Define Direction pin
#define Enable PD5              //Define Enable pin
#define MS1 PB0              //Microselect 1
#define MS2 PB1              //Microselect 2
#define MS3 PB2              //Microselect 3


void init() {
  DDRD |= (1 << PD5) | (1 << PD6) | (1 <<
                                     PD7); // Configure PORTD5, PORTD6, PORTD7 as output
  DDRB |= (1 << PB0) | (1 << PB1) | (1 << PB2);
  PORTD &= ~(1 << PD5);               // Enable driver
  DDRD &= ~(1 << PD2) | (1 << PD3);
  PORTD |= (1 << PD2) | (1 << PD3);
}

// MS deaktiviert
void fullstep() {
  PORTB &= ~(1 << MS1) | (1 << MS2) | (1 << MS3);
}

// 12min-360Grad-3,8h9
void halfstep() {
  PORTB |= (1 << MS1);
  PORTB &= ~(1 << MS2) | (1 << MS3);
}

// 24min -360 Grad-7,6h
void quarterstep() {
  PORTB |= (1 << MS2);
  PORTB &= ~(1 << MS1) | (1 << MS3);
}

// 32min -360 Grad -10h
void eighthstep() {
  PORTB |= (1 << MS1) | (1 << MS2);
  PORTB &= ~(1 << MS3);
}

// 108min-360 Grad-34,2h
void sixteenthstep() {
  PORTB |= (1 << MS1) | (1 << MS2) | (1 << MS3);
}


void joystick_rightFullspeed() {
  PORTD &= ~(1 << dirPin);
  _delay_ms(1);
  PIND |= (1 << stepPin);
  
}

void joystick_rightNormalspeed() {
  PORTD &= ~(1 << dirPin);
  _delay_ms(5);
  PIND |= (1 << stepPin);
  
}

void joystick_rightLowspeed() {
  PORTD &= ~(1 << dirPin);
  _delay_ms(10);
  PIND |= (1 << stepPin);
  _delay_ms(10);
}

void joystick_leftLowspeed() {
  PORTD |= (1 << dirPin);
  _delay_ms(10);
  PIND |= (1 << stepPin);
}


void joystick_leftNormalspeed() {
  PORTD |= (1 << dirPin);
  _delay_ms(5);
  PIND |= (1 << stepPin);
}


void joystick_leftFullspeed() {
  PORTD |= (1 << dirPin);
  _delay_ms(1);
  PIND |= (1 << stepPin);
  
}


void microstep() {
  halfstep();
  for (int i = 0; i < 50; i++) {
    _delay_us(700);
    PIND |= (1 << stepPin); // toggle motor.
    _delay_us(700);
    _delay_ms(1000);
  }
}


/* int main(void) { */
/*   init(); */

/*   while (1) { */

/* //joystick_rightFullspeed(); */
/* //joystick_rightNormalspeed(); */
/* //joystick_rightLowspeed(); */

/* //joystick_leftFullspeed(); */
/* //joystick_leftNormalspeed(); */
/* joystick_leftLowspeed(); */

/*   } */
/* } */

