#ifndef PROTO2_MISC_H
#define PROTO2_MISC_H
#include "Arduino.h"
//#include "avr/pgmspace.h"  // doesn't work

//#include <StandardCplusplus.h>
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
  //MODES: 
  //0 - off
  //1 - on, low
  //2 - on, high
  //3 - on, time varying (pattern/waveform)
  //4 - same as (3) with different pattern
  int LED_mode_lim = 6;

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
    1, 1<<2, 1<<3, 1<<4, 1<<5, 1<<6, 1<<7, 250, 250, 250,
    250, 250, 250, 1<<7, 1<<6, 1<<5, 1<<4, 1<<3, 1<<2, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };
  int wfrmC_len=50;
  int wfrmC[wfrm_max_len]={ // l == 100
    1, 4, 16, 34, 58, 87, 118, 149, 179, 205,
    227, 242, 250, 250, 242, 227, 205, 179, 149, 118,
    7, 58, 34, 16, 4, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
  // NOTE: ADDING ADDITIONAL WAVEFORMS BORKS UP THINGS
  //int wfrmD_len=100;
  //int wfrmD[wfrm_max_len]={ // l == 100
  //  0, 0, 0, 1, 1, 2, 2, 3, 4, 5,
  //  6, 7, 9, 10, 12, 13, 15, 17, 18, 20,
  //  22, 24, 26, 28, 30, 32, 34, 36, 38, 40,
  //  42, 44, 46, 47, 49, 51, 52, 54, 55, 57,
  //  58, 59, 60, 61, 62, 62, 63, 63, 64, 64,
  //  64, 64, 64, 63, 63, 62, 62, 61, 60, 59,
  //  58, 57, 55, 54, 52, 51, 49, 47, 46, 44,
  //  42, 40, 38, 36, 34, 32, 30, 28, 26, 24,
  //  22, 20, 18, 17, 15, 13, 12, 10, 9, 7,
  //  6, 5, 4, 3, 2, 2, 1, 1, 0, 0  };
  //int wfrmE_len=2; //50;
  //int wfrmE[wfrm_max_len]={ // l ==50
  //  1, 1,
  //  //1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  //  //2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  //  //2, 2, 2, 2, 2, 1, 1, 1, 1, 1,
  //  //1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  //  //1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  //  };
  ////int wfrm[wfrm_max_len]={255,  255};

  //>>>t = np.arange(0,2,1/50.)
  //>>>v=(1-np.cos(t * np.pi)) * 32
  //>>>for count, i in enumerate(v):
  //>>>    print "{:d}, ".format(int(round(i))),
  //>>>    if 9 == j % 10:
  //>>>        print ""
  void run(){
    runned();  // needed for threading infrastructure
    static int i = 0;
  //  if(0 > LED_mode){
  //    LED_mode = 0;
  //  }
  //  if(LED_mode > LED_mode_lim){
  //    LED_mode = LED_mode_lim - 1;
  //  }
    // MODE PROGRAMMING
    if(0 == LED_mode){
      analogWrite(pin, 0);
    }
    else if(1 == LED_mode){
      analogWrite(pin, pwr_low);
    }
    else if(2 == LED_mode){
      i++;
      i %= wfrmA_len;
      analogWrite(pin, wfrmA[i]);
    }
    else if(3 == LED_mode){
      i++;
      i %= wfrmB_len;
      analogWrite(pin, wfrmB[i]);
    }
    else if(4 == LED_mode){
      i++;
      i %= wfrmC_len;
      analogWrite(pin, wfrmC[i]);
    }
    else if(5 == LED_mode){
      analogWrite(pin, pwr_high);
    }
  }
  void mode_cycle(){
    LED_mode += 1;
    LED_mode %= LED_mode_lim;
  }
};

#endif //PROTO2_MISC_H
