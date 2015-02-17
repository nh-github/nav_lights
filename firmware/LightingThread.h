#ifndef LIGHTINGTHREAD_H
#define LIGHTINGTHREAD_H

#ifndef NO_ARDUINO
#include "Arduino.h"
#include "avr/pgmspace.h"
#endif


// derive from thread class for HPLED
struct LightingThread:
  public Thread
{
  // Constructor, pass output pin
  LightingThread(int output_pin);
  void run();
  void mode_cycle();

  // pin to write analog output to
  int m_output_pin;

  // current lighting mode
  int m_LED_mode;

  // index into the waveform table in memory
  int m_waveform_index;
};


#endif // LIGHTINGTHREAD_H
