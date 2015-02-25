#ifndef PROTO2_MISC_H
#define PROTO2_MISC_H
#include "Arduino.h"
#include "avr/pgmspace.h"

#include "waveforms.h"

//#include <StandardCplusplus.h>  // included in program source
#include <vector>
#include <iterator>

// typedef for simple callbacks
typedef void (*cb)(int); 

// derive from thread class for onboard indicators
class indicatorThread: 
public Thread
{
public:
  int pin;
  int duty = 1;
  int rate = 1;
  int duty_base = 10;
  void run(){
    runned();  // needed for threading infrastructure
    static bool ledStatus = false;
    ledStatus = duty > ((rate * millis()) / 100) % duty_base;
    digitalWrite(pin, ledStatus);
  }
};

// derive from thread class to handle power/mode button
class buttonThread: 
public Thread
{
public:
  int pin;
  int state = 0;
  long duration = 0;
  cb cb_push = & event_push;
  cb cb_hold = & event_hold;

  void run(){
    // check the UI button and mark short/long press/hold things
    // run at ~50ms intervals
    // TODO: feed a callback/function pointer for state changes
    //
    // how to get data out of callback? global var?

    // track time seen for high value
    // check delay to next low value
    // 0.25s/1s short/long presses
    // if >4s without low value, ``held'' state
    // States:
    // * 0 - no press
    // * 1 - short press just ended
    // * 2 - long press just ended
    // * 3 - held for at least 4 seconds (ongoing)
    runned();  // needed for threading infrastructure
    int SHORT_LIMIT = 50;
    int LONG_LIMIT = 500;
    int HOLD_LIMIT = 2000;
    //long RESET_DELAY = 500;

    static int val_c = 0;
    static int val_p = 0;
    static long start_time = 0;
    static long t1 = 0;
    static long t1b = 0;
    static long duration = 0;
    //
    int pressed_type = 0;
    //static long reset_time = 0;
    // ware - this WILL clear on release


    // if pin vals = [0,1]
    //   update start_time
    //   set button val [state] = 0
    // if pin vals = [1,1]
    //   check for long hold
    // if pin vals = [1,0]
    //   check pres duration, set button val [state]

    val_p = val_c;
    val_c = digitalRead(pin);
    if(0 == val_p && 0 == val_c){  // low
    }
    else if(0 == val_p && 1 == val_c){  // rising edge
      start_time = millis();
      pressed_type = 0;
      duration = 0;
    }
    else if(1 == val_p && 1 == val_c){  // high
      if(start_time + HOLD_LIMIT < millis()){
        start_time = LONG_LIMIT + millis();
        cb_hold(25);
        //Serial.print("timeout!\n");
        //delay(20);
      }
      else{
        Serial.print("running duration: ");
        Serial.print(millis() - start_time);
        Serial.print("\n");
      }
    }
    else if(1 == val_p && 0 == val_c){  // falling edge
      duration = millis() - start_time;
      if(SHORT_LIMIT <= duration && duration < LONG_LIMIT){
        cb_push(1);
        //Serial.print("press: 1 short\n");
      }
      else if(LONG_LIMIT <= duration && duration < HOLD_LIMIT){
        cb_push(2);
        //Serial.print("press: 2 long\n");
      }
    }
  }
  //int get_state(){
  //  int ret = state;
  //  duration = 0;
  //  state = 0;
  //  return ret;
  //}

  void static event_push(int push_type){
    if(1 == push_type){ Serial.print("push event: 1 short\n");}
    if(2 == push_type){ Serial.print("push event: 2 long\n");}
    Serial.print("  (replace this callback with desired function)\n");
  }
  void static event_hold(int pause){
    Serial.print("timeout!\n");
    Serial.print("  (replace this callback with desired function)\n");
    delay(pause);
  }
};

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
    int val;
    int waveform_length;
    waveform_length = pgm_read_byte(waveform_address);
    //use offset to skip over length in first element
    val = pgm_read_byte(waveform_address + 1 + waveform_index); 
    waveform_index++; 
    waveform_index %= waveform_length;
    analogWrite(pin, val);

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
    LED_mode += 1;
    LED_mode %= LED_mode_lim;

    waveform_index = 0;  // reset to start of waveform on change

    if(0 == LED_mode){
      waveform_address = (int*) &waveform_OFF;
    }
    else if(1 == LED_mode){
      waveform_address = (int*) &waveform_LOW;
    }
    else if(2 == LED_mode){
      waveform_address = (int*) &waveform_FLASH_LOW;
    }
    else if(3 == LED_mode){
      waveform_address = (int*) &waveform_BEACON_LINEAR;
    }
    else if(4 == LED_mode){
      waveform_address = (int*) &waveform_BEACON_SINUSOIDAL;
    }
    else if(5 == LED_mode){
      waveform_address = (int*) &waveform_PULSE_LONG;
    }
    else if(6 == LED_mode){
      waveform_address = (int*) &waveform_HIGH;
    }
  }

  void OLDrun(){
    runned();  // needed for threading infrastructure
//    static int i = 0;
//  //  if(0 > LED_mode){
//  //    LED_mode = 0;
//  //  }
//  //  if(LED_mode > LED_mode_lim){
//  //    LED_mode = LED_mode_lim - 1;
//  //  }
//    // MODE PROGRAMMING
//    if(0 == LED_mode){
//      analogWrite(pin, 0);
//    }
//    else if(1 == LED_mode){
//      analogWrite(pin, pwr_low);
//    }
//    else if(2 == LED_mode){
//      i++;
//      i %= wfrmA_len;
//      analogWrite(pin, wfrmA[i]);
//    }
//    else if(3 == LED_mode){
//      i++;
//      i %= wfrmB_len;
//      analogWrite(pin, wfrmB[i]);
//    }
//    else if(4 == LED_mode){
//      i++;
//      i %= wfrmC_len;
//      analogWrite(pin, wfrmC[i]);
//    }
//    else if(5 == LED_mode){
//      analogWrite(pin, pwr_high);
//    }
  }
//  void OLDmode_cycle(){
//    LED_mode += 1;
//    LED_mode %= LED_mode_lim;
//  }
};

#endif //PROTO2_MISC_H
