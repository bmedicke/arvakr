#ifndef _ADC_H_
#define _ADC_H_

void adc_init();
uint16_t adc_read(uint8_t channel);
void to_str(uint16_t val, char* target);

#endif /* ADC_H */

