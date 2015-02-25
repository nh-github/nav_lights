// basic firmware for navigation light [2nd] prototype


#include "Thread.h"
#include "ThreadController.h"
#include <JsonGenerator.h>
#include <StandardCplusplus.h>  // req for proto2_misc lib

#include "proto2_misc.h"

// IO connections
#define PWR_SENSE 2   // power/mode/function switch
#define CHG_STAT 3    // temp, thermistor
#define LED_STAT 5    // flag from LED driver for low battery
#define LED_CTRL 6    // LED driver control
#define PWR_CTRL 7    // high to keep running, low to cut power
#define PWR_FAULT 8   // flag from load switch
#define MISC_STAT 9   // <- indicator LED
#define LED_PIN 13    // onboard LED
#define LED_TEMP1 A0
#define LED_TEMP2 A1


// Create thread objects
// TODO: check creation in setup() <- mis-scoped for loop() (do all in setup?)
buttonThread ui = buttonThread();
indicatorThread led1 = indicatorThread();
indicatorThread led2 = indicatorThread();
lightingThread light = lightingThread();

// One Controller to run them all
ThreadController controller = ThreadController();

void setup() {
  Serial.begin(115200);  // SERIAL DEBUG
  pinMode(LED_PIN, OUTPUT);
  pinMode(LED_CTRL, OUTPUT);
  pinMode(PWR_CTRL, OUTPUT);
  pinMode(MISC_STAT, OUTPUT);
  digitalWrite(PWR_CTRL, HIGH);


  // threading setup
  ui.pin = PWR_SENSE;
  ui.setInterval(50);
  ui.cb_hold = shutdown_hold;
  ui.cb_push = change_mode;

  light.pin = LED_CTRL;
  light.setInterval(20);


  controller.add(&ui);
  controller.add(&light);

  for(int i=9; i>0; i--){
    digitalWrite(MISC_STAT, i%2);
    digitalWrite(LED_PIN, i%3);
    delay(100);
  }
  digitalWrite(MISC_STAT, LOW);

  Serial.print("setup\n");
  getFreeRam();
}  // setup


void loop() {
  //Serial.print("loop\n");

  controller.run();
  digitalWrite(LED_PIN, digitalRead(PWR_SENSE));

  delay(20);
}

void change_mode(int detail){
  if(1 == detail){
    light.mode_cycle();
  }
}

void shutdown_hold(int base){
  Serial.print("SHUTTING DOWN\n");
  controller.clear();
  digitalWrite(PWR_CTRL, LOW);
  digitalWrite(LED_CTRL, LOW);

  // kill threads
  // turn off all LEDs
  // turn off power
  // blink until power removed
  while(true){
    digitalWrite(MISC_STAT, HIGH);
    delay(base);
    digitalWrite(MISC_STAT, LOW);
    delay(base * 5);
    Serial.print("waiting for pwr cut\n");
  }
}

//ref: https://stackoverflow.com/questions/14663543/memory-limits-on-arduino
int getFreeRam()
{
  extern int __heap_start, *__brkval;
  int v;

  v = (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);

  Serial.print("Free RAM = ");
  Serial.println(v, DEC);

  return v;
}
