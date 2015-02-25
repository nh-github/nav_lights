#ifndef WAVEFORMS_H
#define WAVEFORMS_H
#include "Arduino.h"
#include "avr/pgmspace.h"

// waveform storage bits
// store length in first element

// off
const PROGMEM int waveform_OFF[] = { 1, 0, };

// on (low)
const PROGMEM int waveform_LOW[] = { 2, 1, 1, };

// on (high)
const PROGMEM int waveform_HIGH[] = { 1, 255, };

// low power flashing
const PROGMEM int waveform_FLASH_LOW[] = { 50, // 50 elements
    1,  1,  0,  0,  0,  0,  0,  0,  0,  0, 
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    1,  0,  0,  0,  0,  0,  1,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0, };

// linear ramp flash
const PROGMEM int waveform_BEACON_LINEAR[] = { 50, // 50 elements
    1, 1<<2, 1<<3, 1<<4, 1<<5, 1<<6, 1<<7, 1<<7, 1<<7, 1<<7,
    1<<7, 1<<7, 1<<7, 1<<7, 1<<6, 1<<5, 1<<4, 1<<3, 1<<2, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };

// sinusoidal ramp flash
const PROGMEM int waveform_BEACON_SINUSOIDAL[] = { 50, // 50 elements
    1, 4, 16, 34, 58, 87, 118, 149, 179, 205,
    227, 242, 250, 250, 242, 227, 205, 179, 149, 118,
    87, 58, 34, 16, 4, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };

// longer pulsing [?]
const PROGMEM int waveform_PULSE_LONG[] = { 100, // 100 elements
    0, 0, 0, 1, 1, 2, 2, 3, 4, 5,
    6, 7, 9, 10, 12, 13, 15, 17, 18, 20,
    22, 24, 26, 28, 30, 32, 34, 36, 38, 40,
    42, 44, 46, 47, 49, 51, 52, 54, 55, 57,
    58, 59, 60, 61, 62, 62, 63, 63, 64, 64,
    64, 64, 64, 63, 63, 62, 62, 61, 60, 59,
    58, 57, 55, 54, 52, 51, 49, 47, 46, 44,
    42, 40, 38, 36, 34, 32, 30, 28, 26, 24,
    22, 20, 18, 17, 15, 13, 12, 10, 9, 7,
    6, 5, 4, 3, 2, 2, 1, 1, 0, 0  };

#endif //WAVEFORMS_H
