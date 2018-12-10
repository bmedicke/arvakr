#include <avr/io.h>

void adc_init() {
  /* select prescaler for ADC clock 125kHz: */
  ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
  ADCSRA |= (1 << ADEN); /* enable the ADC */
  ADMUX = (1 << REFS0); /* select internal 5V reference voltage */
}

uint16_t adc_read(uint8_t channel) {
  uint16_t result;

  ADMUX &= 0xf0; /* clear lower 4 bits in ADMUX. */
  ADMUX |= channel; /* select channel for AD-conversion. */
  ADCSRA |= (1 << ADSC); /* start conversion. */
  while (ADCSRA & (1 << ADSC) ); /* wait until conversion is finished. */

  result = ADCL; /* read low byte first */
  result += (ADCH << 8); /* add high byte */
  return (result);
}

/* convert an integer (0-9999) into a zero-terminated string: */
void to_str(uint16_t val, char* target) {
  int8_t i;

  for (i = 3; i >= 0; i--) {
    /* this takes the first digit and converts the value (0-9): */
    target [i] = val % 10 + '0';
    /* into a readable ASCII character ('0' - '9') */
    /* next digit: */
    val /= 10;

  }
  /* store zero for string termination at index 4: */
  target[4] = 0;
}
