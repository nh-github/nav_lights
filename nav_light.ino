// basic firmware for navigation light [2nd] prototype

/*
TODO: try threading
 * SimpleThread as example
 ** blink green LED on LED_PIN <- 1 Hz?
 ** blink yellow LED (MISC_STAT) <- 5 Hz?
 ** blink/pulse HPLED (LED_CTRL) <- delay a while, low power for now
 ** print stuff?
 ** monitor pin
 */

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
// TODO: check creation in setup()
buttonThread ui = buttonThread();
indicatorThread led1 = indicatorThread();
indicatorThread led2 = indicatorThread();
lightingThread light = lightingThread();

// One Controller to run them all
ThreadController controller = ThreadController();

typedef void (*void_callback)();

void baa(){
  Serial.print("baa");
}

void_callback func = &baa;

//void func ( void (*f)(int) );

void callbaa( void (*f)()){
  f();
}
  void callbaa_static(){
  func();
}

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

  //led1.pin = MISC_STAT;
  //led1.setInterval(500);
  //led1.enabled = false;  // turn on later

  //led2.pin = LED_PIN;
  //led2.setInterval(500);  // 1 Hz cyclic, 2 Hz changes
  //led2.enabled = false;

  light.pin = LED_CTRL;
  light.setInterval(20);
  //light.enabled = false;


  controller.add(&ui);
  //controller.add(&led1);
  //controller.add(&led2);
  controller.add(&light);

  for(int i=9; i>0; i--){
    digitalWrite(MISC_STAT, i%2);
    digitalWrite(LED_PIN, i%3);
    delay(100);
  }
  digitalWrite(MISC_STAT, LOW);

  Serial.print("foo\n");
  //baa();
  callbaa(baa);
  callbaa_static();
  Serial.print("\nbar\n");
  delay(10000);

}  // setup


void loop() {
  Serial.print("loop\n");

  controller.run();
  static long timer = 0;
  if(timer < millis()){
    timer = millis() + 500;
    if(2==ui.get_state()){
      light.LED_mode += 1;
      light.LED_mode %= light.LED_mode_lim;
    }
  }
  digitalWrite(LED_PIN, digitalRead(PWR_SENSE));

  delay(20);

  // SHUTDOWN
  if(4==ui.state){
    shutdown_hold();
  }
}

void shutdown_hold(){
  Serial.print("SHUTTING DOWN\n");
  controller.clear();
  digitalWrite(PWR_CTRL, LOW);
  digitalWrite(LED_CTRL, LOW);

  // kill threads
  // turn off all LEDs
  // turn off power
  // spin until power removed
  while(true){
    digitalWrite(MISC_STAT, HIGH);
    delay(25);
    digitalWrite(MISC_STAT, LOW);
    delay(225);
    Serial.print("waiting for pwr cut\n");
  }
}

