
#ifdef NO_ARDUINO
// TEST is defined, bypass Arduino support
#define PROGMEM

// A simple base Thread class to allow for compiling and testing
struct Thread{
  void runned() {}
  int pgm_read_byte(const int* p) { return *p; }
  void analogWrite(int,int) {}
};
#endif


#include "LightingThread.h"
#include "Waveforms.h"

LightingThread::LightingThread(int output_pin):
  m_output_pin(output_pin),
  m_LED_mode(0),
  m_waveform_index(0)
{
}



void LightingThread::run(){
  runned();  // needed for threading infrastructure

  const int waveform_len = waveforms_len[m_LED_mode];
  const int* waveform_ptr = waveforms_table[m_LED_mode];
  waveform_ptr += m_waveform_index % waveform_len;

  int val = pgm_read_byte(waveform_ptr);

  // move to next sample for next time around
  m_waveform_index++;


  // write the value to the pin
  analogWrite(m_output_pin, val);
}


void LightingThread::mode_cycle(){
  // increment LED mode and wrap around
  m_LED_mode = (m_LED_mode + 1) % int(WAVEFORM_COUNT_E);

  // reset to start of waveform on change
  m_waveform_index = 0;
}


#ifdef NO_ARDUINO

int main(int, char**)
{
  LightingThread foo(2);
  foo.mode_cycle();
  foo.run();
  return 0;
}

#endif // LIGHTINGTHREAD_H
