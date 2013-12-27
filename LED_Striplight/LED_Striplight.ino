#include "LPD8806.h"
#include "SPI.h"
#include <math.h>

/*
 * Example to control LPD8806-based RGB LED Modules in a strip
 *
 * adding functions for operating strip with configurable:
 *   timing
 *   ranges
 *   brightness levels
 * and additionally using cyclical functions for values (sin/cos)
 *
 * connections:
 *   GND - ground
 *   5V - power
 *   A1 - data (DI)
 *   A0 - clock (CI)
 */
/*****************************************************************************/

// Number of RGB LEDs in strand:
//int nLEDs = 24;  // testing subsegments
//int nLEDs = 144; // long (repaired) strand
int nLEDs = 32;

// Chose 2 pins for output; can be any valid output pins:
int dataPin  = A1;
int clockPin = A0;
//int dataPin  = 2;
//int clockPin = 3;

int season = 0;

// First parameter is the number of LEDs in the strand.  The LED strips
// are 32 LEDs per meter but you can extend or cut the strip.  Next two
// parameters are SPI data and clock pins:
LPD8806 strip = LPD8806(nLEDs, dataPin, clockPin);

// You can optionally use hardware SPI for faster writes, just leave out
// the data and clock pin parameters.  But this does limit use to very
// specific pins on the Arduino.  For "classic" Arduinos (Uno, Duemilanove,
// etc.), data = pin 11, clock = pin 13.  For Arduino Mega, data = pin 51,
// clock = pin 52.  For 32u4 Breakout Board+ and Teensy, data = pin B2,
// clock = pin B1.  For Leonardo, this can ONLY be done on the ICSP pins.
//LPD8806 strip = LPD8806(nLEDs);

void setup() {
  // Start up the LED strip
  strip.begin();

  // Update the strip, to start they are all 'off'
  strip.show();

  Serial.begin(9600);
  Serial.println("Color Strip Control");
}


void loop() {
  // toggle the built in LED on pin 13
  digitalWrite( 13, digitalRead( 13 ) ^ 1 );

  if(0 == season){
    Serial.print("running TEST CODE");
    winterPattern3();
  }

  if(3 == season){
    autumnPattern();
  }


  if(4 == season){
    int r = random(0,2);
    if(0 == r){
      Serial.print("running [faster] winter [");
      Serial.print(r);
      Serial.print("]\n");
      winterPattern2();
    }
    else{
      Serial.print("running [slower] winter [");
      Serial.print(r);
      Serial.print("]\n");
      winterPattern();
    }
  }
  //  uint32_t a = strip.Color(0x3F, 2, 1);
  //  uint32_t b = strip.Color(0, 0, 0);
  //
  //  fadeBright(a, b, 4, 100);

  //tests();

}

/*
 * Support
 */
struct RGBcolor {
  uint8_t r,g,b;
};

struct RGBcolor extractColors(uint32_t c){
  struct RGBcolor unpacked;
  unpacked.g = (c >> 16) & 0x7F;
  unpacked.r = (c >>  8) & 0x7F;
  unpacked.b =  c        & 0x7F;
  return unpacked;
}

/*
 * Calculate a single channel color fade
 *   w: start
 *   x: finish
 *   y: step size
 *   i: step index
 *   ret: channel value
 */
int calcFade(int w, int x, int y, int i){
  int z, l1, l2 = 0;
  l1 = min(w,x);
  l2 = max(w,x);
  z = (l1 + ((l2-l1) / pow(y,i)));

  //  Serial.print("calcFade: \n  ");
  //  Serial.print(String(w, DEC)+"  ");
  //  Serial.print(String(x, DEC)+"  ");
  //  Serial.print(String(y, DEC)+"  ");
  //  Serial.print(String(i, DEC)+"  ");
  //  Serial.print("\n    ");
  //  Serial.print(String(l1, DEC)+"  ");
  //  Serial.print(String(l2, DEC)+"  ");
  //  Serial.print(String(z, DEC)+"  ");

  return (l1 + ((l2-l1) / pow(y,i)));
}


/*
 * Knight Rider / Battlestar Glactica Cylon effect
 *
 */
void larson(uint32_t sweepColor, uint32_t bgColor, uint8_t wait){
  for(int i=0; i<strip.numPixels(); i++) {
    larsonFrame(i, 3, sweepColor, bgColor);
    delay(wait);
  }
  for(int i=strip.numPixels(); i>0; i--) {
    larsonFrame(i, 3, sweepColor, bgColor);
    delay(wait);
  }
}

void fadeSweep(uint32_t c, uint32_t d, int width, int wait){
  for(int i=0; i<(width+strip.numPixels()); i++) {
    halfLarsonFrame(i, width, c, d);
    delay(wait);
  }
}

void larsonFrame(int center, int width, uint32_t c, uint32_t d){
  //struct RGBcolor rgbBase = extractColors(strip.getPixelColor(0));
  struct RGBcolor rgbCenter = extractColors(c);
  struct RGBcolor rgbBase = extractColors(d);

  int r, g, b, diff;
  r = rgbCenter.r;
  g = rgbCenter.g;
  b = rgbCenter.b;
  for(int i=0; i<width; i++) {
    strip.setPixelColor(center+i, strip.Color(r, g, b));
    strip.setPixelColor(center-i, strip.Color(r, g, b));
    r = calcFade(rgbBase.r, rgbCenter.r, 4, i);
    g = calcFade(rgbBase.g, rgbCenter.g, 4, i);
    b = calcFade(rgbBase.b, rgbCenter.b, 4, i);
  }
  strip.setPixelColor(center+width, d);
  strip.setPixelColor(center-width, d);
  strip.show();
}

void halfLarsonFrame(int center, int width, uint32_t c, uint32_t d){
  //struct RGBcolor rgbBase = extractColors(strip.getPixelColor(0));
  struct RGBcolor rgbCenter = extractColors(c);
  struct RGBcolor rgbBase = extractColors(d);

  int r, g, b, diff;
  r = rgbCenter.r;
  g = rgbCenter.g;
  b = rgbCenter.b;
  for(int i=0; i<width; i++) {
    strip.setPixelColor(center+i, strip.Color(r, g, b));
    r = calcFade(rgbBase.r, rgbCenter.r, 4, i);
    g = calcFade(rgbBase.g, rgbCenter.g, 4, i);
    b = calcFade(rgbBase.b, rgbCenter.b, 4, i);
  }
  strip.setPixelColor(center+width, d);
  strip.show();
}

/*
 * Simple effect: fade from one color to another through "white"
 *
 * fade to brighter white/gray, then to second color
 */
void fadeBright(
uint32_t colorStart, 
uint32_t colorEnd, 
uint8_t stepSize, 
uint8_t stepDelay){
  Serial.print("FOO: ");
  Serial.print(colorStart, HEX);
  Serial.print(", ");
  Serial.print(colorEnd);
  Serial.print("; ");
  Serial.print(colorStart-colorEnd);
  Serial.print("\n");
  singleColor(colorStart);
  delay(500);
  singleColor(colorEnd);
  delay(500);
  singleColor(colorStart);


  delay(stepDelay);
}

void tests(void){
  // test on just a section
  strip.updateLength(32);
  // low brightness output
  singleColor(strip.Color(1, 1, 1));
  strip.setPixelColor(1, strip.Color(83, 30, 16)); // A73C20 scaled to 7bits
  delay(1500);
  singleColor(strip.Color(1, 1, 1));
  delay(500);

  // flash
  singleColor(strip.Color(127,127,1));
  singleColor(strip.Color(127,1,127));
  singleColor(strip.Color(1,127,127));
  singleColor(strip.Color(0,0,0));

  uint32_t c1 = strip.Color(96, 0, 0);
  uint32_t c2 = strip.Color(96, 96, 0);
  uint32_t c3 = strip.Color(0, 96, 96);
  uint32_t c4 = strip.Color(96, 0, 96);
  uint32_t cN = strip.Color(0, 1, 0);
  fadeSweep(c1, c2, 3, 50);
  fadeSweep(c2, c3, 3, 50);
  fadeSweep(c3, c4, 3, 50);
  fadeSweep(c4, cN, 3, 50);

  // Knight Rider / Battlestar Galactica Cyclon
  uint32_t sweepColor = strip.Color(96, 0, 0);
  //uint32_t bgColor = strip.getPixelColor(0);
  uint32_t bgColor = strip.Color(0, 1, 0);
  for(int i=0; i<9; i++){
    larson(sweepColor, bgColor, 50);
  }

  delay(5000);
  colorWipe(strip.Color(1, 1, 1), 50);
  colorWipe(strip.Color(7, 1, 1), 50);
  colorWipe(strip.Color(1, 1, 1), 50);
  colorWipe(strip.Color(63, 1, 1), 50);
  colorWipe(strip.Color(1, 1, 1), 50);
  colorWipe(strip.Color(127, 1, 1), 50);

  // single pixel
  //colorChase(strip.Color(63, 63, 63), 50);
  //colorBounce(strip.Color(2, 2, 16), 10);
  // all on
  //  (127, 0, 0)
  //  (127, 127, 0)
  //  (127, 82, 0)

  //  colorWipe(strip.Color(127, 0, 0), 10);  // Red
  //  colorWipe(strip.Color(127, 82, 0), 10);  // Red
  //  colorWipe(strip.Color(127, 127, 0), 10);  // Red
  //  colorWipe(strip.Color(1,   3,   0), 10);  // 

  //  singleColor(strip.Color(127,0,0));
  //  delay(450);
  //  singleColor(strip.Color(127,127,0));
  //  delay(450);
  //  singleColor(strip.Color(127,82,0));
  //  delay(450);

  //rainbow(10);
  //rainbowCycle(0);
}

/*
 * Wipe in moderate steps from red to yellow and back
 */
void autumnPattern(void) {
  for(int i=0; i<105; i+=15){
    Serial.print("Color up: ");
    Serial.print(i);
    Serial.print("\n");
    colorWipe(strip.Color(127, i, 0), 25);
    //singleColor(strip.Color(127, i, 0));
    //delay(50);
  }
  for(int i=105; i>0; i-=15){
    Serial.print("Color down: ");
    Serial.print(128-i);
    Serial.print("\n");
    colorWipe(strip.Color(127, i, 0), 25);
    //singleColor(strip.Color(127, i, 0));
    //delay(50);
  }
}

/*
 * Winter color pattern
 *
 * Red, Green, White in gentle combinations
 */
void winterPattern(void) {
  Serial.println("Winter / Holiday themed color");
  int brightHi = 124;
  int brightStep = 2;

  colorWipe(strip.Color(brightHi,0,0), 100);

  //red->bright
  for(int i=0; i<brightHi; i+=brightStep){
    singleColor(strip.Color(brightHi,i,i/4));
    delay(200);
  }
  //bright->green
  for(int i=0; i<brightHi; i+=brightStep){
    singleColor(strip.Color(brightHi-i,brightHi,(brightHi-i)/4));
    delay(200);
  }
  //green->bright
  for(int i=0; i<brightHi; i+=brightStep){
    singleColor(strip.Color(i, brightHi, i/4));
    delay(200);
  }
  //bright->red
  for(int i=0; i<brightHi; i+=brightStep){
    singleColor(strip.Color(brightHi, brightHi-i, (brightHi-i)/4));
    delay(200);
  }
  //delay(500);
  //singleColor(strip.Color(1,1,1));
  //delay(5500);
  //  colorBounce(strip.Color(127, 0, 0), 10);
  //  colorBounce(strip.Color(0, 127, 0), 10);
  //  colorBounce(strip.Color(127, 127, 127), 10);
  //  colorWipe(strip.Color(0, 64, 0), 75);
  //  colorWipe(strip.Color(64, 0, 0), 75);
  //  colorWipe(strip.Color(0, 0, 0), 75);
}

/*
 * Winter color pattern
 *
 * Red, Green, White in flashier combinations
 */
void winterPattern2(void) {
  Serial.println("Higher energy Winter / Holiday themed color");
  uint32_t sweepColor, bgColor;

  sweepColor = strip.Color(96, 0, 0);
  bgColor = strip.Color(0, 1, 0);
  colorWipe(bgColor, 150);
  for(int i=0; i<9; i++){
    larson(sweepColor, bgColor, 50);
  }
  colorWipe(strip.Color(0, 0, 0), 150);

  sweepColor = strip.Color(0, 96, 0);
  bgColor = strip.Color(1, 0, 0);
  colorWipe(bgColor, 150);
  for(int i=0; i<9; i++){
    larson(sweepColor, bgColor, 50);
  }
  colorWipe(strip.Color(0, 0, 0), 150);
}

/*
 * Winter color pattern
 *
 * Multicolor lights with twinkling
 */
void winterPattern3(void) {
  Serial.println("Twinkling lights");
  int nColors, pixelID, perColor, numRounds, wait, a, b, c;
  perColor = 9;
  numRounds = 9;
  wait = 100;
  a = 2;
  b = 1;
  uint32_t pixelColor;
  uint32_t pixelColors[] = {
    strip.Color(2 * a + b, b, b),
    strip.Color(a + b, a + b, b),
    strip.Color(b, 2 * a + b, b),
    strip.Color(b, a + b, a + b),
    strip.Color(b, b, 2 * a + b),
    strip.Color(a + b, b, a + b),
  };
  /*
  uint32_t pixelColors[] = {
   strip.Color(a, 0, 0),
   strip.Color(0, a, 0),
   strip.Color(0, 0, a),
   };
   */

  nColors = sizeof(pixelColors) / sizeof(pixelColors[0]);
  for(int roundNo=0; roundNo < numRounds; roundNo++){
    pixelColor = pixelColors[(rand() % nColors)];
    for(int i=0; i < perColor; i++){
      pixelID = rand() % nLEDs;
      strip.setPixelColor(pixelID, pixelColor);
      strip.show();
      delay(wait);
    }
    delay(4 * wait);
  }
}

// Run a single dot back and forth
void colorBounce(uint32_t c, uint8_t wait) {
  int i;

  // Then display one pixel at a time:
  for(i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c); // Set new pixel 'on'
    strip.show();              // Refresh LED states
    strip.setPixelColor(i, 0); // Erase pixel, but don't refresh!
    delay(wait);
  }
  for(i=strip.numPixels()-1; i>1; i--) {
    strip.setPixelColor(i, c); // Set new pixel 'on'
    strip.show();              // Refresh LED states
    strip.setPixelColor(i, 0); // Erase pixel, but don't refresh!
    delay(wait);
  }
  //strip.show(); // Refresh to turn off last pixel
}

// Run a single dot back and forth
void singleColor(uint32_t c) {
  int i;
  for(i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c); // Set new pixel 'on'
  }
  strip.show();              // Refresh LED states
}

void rainbow(uint8_t wait) {
  int i, j;

  for (j=0; j < 384; j++) {     // 3 cycles of all 384 colors in the wheel
    for (i=0; i < strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel( (i + j) % 384));
    }  
    strip.show();   // write all the pixels out
    delay(wait);
  }
}

// Slightly different, this one makes the rainbow wheel equally distributed 
// along the chain
void rainbowCycle(uint8_t wait) {
  uint16_t i, j;

  for (j=0; j < 384 * 5; j++) {     // 5 cycles of all 384 colors in the wheel
    for (i=0; i < strip.numPixels(); i++) {
      // tricky math! we use each pixel as a fraction of the full 384-color wheel
      // (thats the i / strip.numPixels() part)
      // Then add in j which makes the colors go around per pixel
      // the % 384 is to make the wheel cycle around
      strip.setPixelColor(i, Wheel( ((i * 384 / strip.numPixels()) + j) % 384) );
    }  
    strip.show();   // write all the pixels out
    delay(wait);
  }
}

// Fill the dots progressively along the strip.
void colorWipe(uint32_t c, uint8_t wait) {
  int i;

  for (i=0; i < strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait);
  }
}

// Chase one dot down the full strip.
void colorChase(uint32_t c, uint8_t wait) {
  int i;

  // Start by turning all pixels off:
  for(i=0; i<strip.numPixels(); i++) strip.setPixelColor(i, 0);

  // Then display one pixel at a time:
  for(i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c); // Set new pixel 'on'
    strip.show();              // Refresh LED states
    strip.setPixelColor(i, 0); // Erase pixel, but don't refresh!
    delay(wait);
  }

  strip.show(); // Refresh to turn off last pixel
}

/* Helper functions */

//Input a value 0 to 384 to get a color value.
//The colours are a transition r - g -b - back to r

uint32_t Wheel(uint16_t WheelPos)
{
  byte r, g, b;
  switch(WheelPos / 128)
  {
  case 0:
    r = 127 - WheelPos % 128;   //Red down
    g = WheelPos % 128;      // Green up
    b = 0;                  //blue off
    break; 
  case 1:
    g = 127 - WheelPos % 128;  //green down
    b = WheelPos % 128;      //blue up
    r = 0;                  //red off
    break; 
  case 2:
    b = 127 - WheelPos % 128;  //blue down 
    r = WheelPos % 128;      //red up
    g = 0;                  //green off
    break; 
  }
  return(strip.Color(r,g,b));
}



































