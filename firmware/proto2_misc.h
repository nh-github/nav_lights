#ifndef PROTO2_MISC_H
#define PROTO2_MISC_H
#include "Arduino.h"
#include "avr/pgmspace.h"

#include "button_interface.h"
#include "lightingctrl.h"
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

#endif //PROTO2_MISC_H
