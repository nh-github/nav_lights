#ifndef PROTO2_MISC_H
#define PROTO2_MISC_H
#include "Arduino.h"

// derive from thread class for onboard indicators
class indicatorThread: 
public Thread
{
public:
  int pin;
  void run(){
    runned();  // needed for threading infrastructure
    static bool ledStatus = false;
    ledStatus = !ledStatus;
    digitalWrite(pin, ledStatus);

//    static long counter = 0;
//    
//    int limit = 2;
//    counter++;
//    counter %= limit;
//    digitalWrite(pin, 0==counter);
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
  void run(){
    // check the UI button and do something with it
    // how to get data out of callback? global var?
    // Serial.print(ui.statevar); ?
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
    int LONG_LIMIT = 1000;
    int HOLD_LIMIT = 4000;
    long RESET_DELAY = 500;

    static int val;
    static long t0 = 0;
    static long t1 = 0;
    //static long duration = 0;
    static long reset_time = 0;
    // ware - this WILL clear on release
    val = digitalRead(pin);
    if(0 == val){
      t0 = millis();
      //digitalWrite(LED_PIN, LOW);
    }
    else{
      t1 = millis();
      duration = t1 - t0;
      //digitalWrite(LED_PIN, HIGH);
    }

    if(HOLD_LIMIT <= duration){
      state = 4;
      reset_time = millis() + RESET_DELAY;
    }
    else if(LONG_LIMIT <= duration){
      state = 3;
      reset_time = millis() + RESET_DELAY;
    }
    else if(SHORT_LIMIT <= duration){
      state = 2;
      reset_time = millis() + RESET_DELAY;
    }
    else{
      if(reset_time < millis()){
        //state = 0;
        //duration = 0;
      }
    }
    ArduinoJson::Generator::JsonObject<22> data;
    data["t0"] = t0;
    data["t1"] = t1;
    data["dur"] = duration;
    data["S"] = state;
    data["r"] = reset_time;
    // also possible: data.prettyPrintTo(Serial);
  }
  int get_state(){
    int ret = state;
    duration = 0;
    state = 0;
    return ret;
  }
};


// derive from thread class for HPLED
class lightingThread: 
public Thread
{
public:
  int pin;
  int pwr_low = 1;
  int pwr_high = 5;
  int LED_mode = 0;
  //MODES: 
  //0 - off
  //1 - on, low
  //2 - on, high
  //3 - on, time varying (pattern/waveform)
  //4 - same as (3) with different pattern
  int LED_mode_lim = 8;

  int wfrm_len=50;
  const static int wfrm_max_len=200;
  int wfrmA_len=50;
  int wfrmA[wfrm_max_len]={ // l == 50
    1,  1,  0,  0,  0,  0,  0,  0,  0,  0, 
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    1,  0,  0,  0,  0,  0,  1,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,   };
  int wfrmB_len=50;
  int wfrmB[wfrm_max_len]={ // l ==50
    1, 1<<2, 1<<4, 1<<7, 1<<6, 1<<4, 1<<2, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };
  int wfrmC_len=100;
  int wfrmC[wfrm_max_len]={ // l == 100
    1, 4, 16, 34, 58, 87, 118, 149, 179, 205,
    227, 242, 250, 250, 242, 227, 205, 179, 149, 118,
    7, 58, 34, 16, 4, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
  int wfrmD_len=100;
  int wfrmD[wfrm_max_len]={ // l == 100
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
  int wfrmE_len=50;
  int wfrmE[wfrm_max_len]={ // l ==50
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    };
  //int wfrm[wfrm_max_len]={255,  255};

  //>>>t = np.arange(0,2,1/50.)
  //>>>v=(1-np.cos(t * np.pi)) * 32
  //>>>for count, i in enumerate(v):
  //>>>    print "{:d}, ".format(int(round(i))),
  //>>>    if 9 == j % 10:
  //>>>        print ""
  void run(){
    runned();  // needed for threading infrastructure
    static int i = 0;
    if(LED_mode > LED_mode_lim){
      LED_mode = 0;
    }
    // MODE PROGRAMMING
    if(0 == LED_mode){
      analogWrite(pin, 0);
    }
    else if(1 == LED_mode){
      analogWrite(pin, pwr_low);
    }
    else if(2 == LED_mode){
      analogWrite(pin, pwr_high);
    }
    else if(3 == LED_mode){
      analogWrite(pin, wfrmA[i]);
      i++;
      i %= wfrmA_len;
    }
    else if(4 == LED_mode){
      analogWrite(pin, wfrmB[i]);
      i++;
      i %= wfrmB_len;
    }
    else if(5 == LED_mode){
      analogWrite(pin, wfrmC[i]);
      i++;
      i %= wfrmC_len;
    }
    else if(6 == LED_mode){
      analogWrite(pin, wfrmD[i]);
      i++;
      i %= wfrmD_len;
    }
    else if(7 == LED_mode){
      analogWrite(pin, wfrmE[i]);
      i++;
      i %= wfrmE_len;
    }
//    else if(4 == LED_mode){
//      analogWrite(pin, pwr_high * wfrm[i]);
//      i++;
//      i %= wfrm_len;
//    }
    else if(8 == LED_mode){
      analogWrite(pin, 8);
    }
  }
};

#endif //PROTO2_MISC_H
