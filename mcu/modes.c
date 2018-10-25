#include "modes.h"
#include "uart.h"
#include "settings.h"

void mode_continous() {
}

void mode_step_shoot_step() {
}

void mode_bulb() {
}

void handle_mode(uint8_t mode) {
  switch (mode) {
    case continous:
      mode_continous();
      break;
    case step_shoot_step:
      mode_step_shoot_step();
      break;
    case bulb:
      mode_bulb();
      break;
  }
}

