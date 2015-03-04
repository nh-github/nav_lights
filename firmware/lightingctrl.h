#ifndef LIGHTINGCTRL_H
#define LIGHTINGCTRL_H
#include "Arduino.h"
#include "avr/pgmspace.h"

#include "waveforms.h"

//#include <StandardCplusplus.h>  // included in program source
#include <vector>
#include <iterator>

// typedef for simple callbacks
typedef void (*cb)(int); 


//LightingThread::LightingThread(int output_pin):
//m_output_pin(output_pin),
//m_LED_mode(0),
//m_waveform_index(0)
//{
//}


// derive from thread class for HPLED
class lightingThread: 
public Thread
{
public:
  int pin;
  int pwr_low = 1;
  int pwr_high = 250;
  int LED_mode = 0;
  int* waveform_address = (int*) &waveform_OFF;
  int waveform_index = 0;
  int m_output_pin;
  int m_LED_mode = 0;
  int m_waveform_index = 0;
  //MODES:  TODO: select a useful set of patterns
  //0 - off
  //1 - on, low
  //2 - on, high
  //3 - on, time varying (pattern/waveform)
  //4 - same as (3) with different pattern
  int LED_mode_lim = 7;

  void run(){
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
  void mode_cycle(){
    // increment LED mode and wrap around
    m_LED_mode = (m_LED_mode + 1) % int(WAVEFORM_COUNT_E);
    // reset to start of waveform on change
    m_waveform_index = 0;
  }
};

#endif //LIGHTINGCTRL_H
