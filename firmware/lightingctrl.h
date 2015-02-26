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
    //static int i = 0;
    //int val;
    //int waveform_length;
    //waveform_length = pgm_read_byte(waveform_address);
    //use offset to skip over length in first element
    //val = pgm_read_byte(waveform_address + 1 + waveform_index); 
    //waveform_index++; 
    //waveform_index %= waveform_length;
    //analogWrite(pin, val);
///////////////////////////////////////////
    const int waveform_len = waveforms_len[m_LED_mode];
    const int* waveform_ptr = waveforms_table[m_LED_mode];
    waveform_ptr += m_waveform_index % waveform_len;
    int val = pgm_read_byte(waveform_ptr);
    // move to next sample for next time around
    m_waveform_index++;
    // write the value to the pin
    analogWrite(m_output_pin, val);
///////////////////////////////////////////
    //Serial.print("addr: ");
    //Serial.print((int)waveform_address);
    //Serial.print(", len: ");
    //Serial.print(waveform_length);
    //Serial.print(", i: ");
    //Serial.print(waveform_index);
    //Serial.print(", val: ");
    //Serial.print(val);
    //Serial.print("\n");
    //Serial.print("  mode: ");
    //Serial.print(LED_mode);
    //Serial.print("\n");
  }
  void mode_cycle(){
    // increment LED mode and wrap around
    m_LED_mode = (m_LED_mode + 1) % int(WAVEFORM_COUNT_E);
    // reset to start of waveform on change
    m_waveform_index = 0;

    //LED_mode += 1;
    //LED_mode %= LED_mode_lim;

    //waveform_index = 0;  // reset to start of waveform on change

    //if(0 == LED_mode){
    //  waveform_address = (int*) &waveform_OFF;
    //}
    //else if(1 == LED_mode){
    //  waveform_address = (int*) &waveform_LOW;
    //}
    //else if(2 == LED_mode){
    //  waveform_address = (int*) &waveform_FLASH_LOW;
    //}
    //else if(3 == LED_mode){
    //  waveform_address = (int*) &waveform_BEACON_LINEAR;
    //}
    //else if(4 == LED_mode){
    //  waveform_address = (int*) &waveform_BEACON_SINUSOIDAL;
    //}
    //else if(5 == LED_mode){
    //  waveform_address = (int*) &waveform_PULSE_LONG;
    //}
    //else if(6 == LED_mode){
    //  waveform_address = (int*) &waveform_HIGH;
    //}
  }

};

#endif //LIGHTINGCTRL_H
