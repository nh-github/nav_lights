#ifndef LIGHTINGTHREAD_H
#define LIGHTINGTHREAD_H


#ifndef TEST

#include "Arduino.h"
#include "avr/pgmspace.h"

#else
// TEST is defined, bypass Arduino support
#define PROGMEM

// A simple base Thread class to allow for compiling and testing
struct Thread{
  void runned() {}
  int pgm_read_byte(const int* p) { return *p; }
  void analogWrite(int,int) {}
};
#endif




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
    6, 5, 4, 3, 2, 2, 1, 1, 0, 0 };



// derive from thread class for HPLED
struct LightingThread:
  public Thread
{
  // pin to write analog output to
  int pin;

  // current lighting mode
  int LED_mode = 0;

  // index into the waveform table in memory
  int waveform_index = 0;

  //MODES:  TODO: select a useful set of patterns
  //0 - off
  //1 - on, low
  //2 - on, high
  //3 - on, time varying (pattern/waveform)
  //4 - same as (3) with different pattern

  // Make static const to allow compiler optimziations
  static const int LED_mode_lim = 7;

  // Create a table of waveform pointers for simple indexing
  // See 'Arrays of strings' on http://arduino.cc/en/Reference/PROGMEM
  const int* waveforms_table[LED_mode_lim] = {
    waveform_OFF,
    waveform_LOW,
    waveform_FLASH_LOW,
    waveform_BEACON_LINEAR,
    waveform_BEACON_SINUSOIDAL,
    waveform_PULSE_LONG,
    waveform_HIGH,
  };


  void run(){
    runned();  // needed for threading infrastructure

    const int* waveform_address = waveforms_table[LED_mode];

    // store waveform_length in val (stored as first entry of waveform)
    int val = pgm_read_byte(waveform_address);

    // calculate index of value
    // use 1 offset to skip over length in first element
    waveform_address = waveform_address + 1 + (waveform_index % val);

    // increment waveform index for next cycle and
    // wrap the index by the waveform length (val)
    waveform_index = (waveform_index + 1) % val;

    // read the value of the waveform from cached address
    val = pgm_read_byte(waveform_address);

    // write the value to the pin
    analogWrite(pin, val);
  }

  void mode_cycle(){
    // increment LED mode and wrap around
    LED_mode = (LED_mode + 1) % LED_mode_lim;

  // reset to start of waveform on change
    waveform_index = 0;
  }

};


#ifdef TEST

struct LightingThread;

int main(int, char**){
  LightingThread foo;
  foo.mode_cycle();
  foo.run();
  return 0;
}

#endif



#endif // LIGHTINGTHREAD_H
