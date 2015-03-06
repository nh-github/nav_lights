#ifndef WAVEFORMS_H
#define WAVEFORMS_H
#include "Arduino.h"
#include "avr/pgmspace.h"

// waveform storage bits

// macro to declare all waveforms
// applies the DECLARE_WAVEFORM macro to each waveform definition
#define DECLARE_WAVEFORMS(DECLARE_WAVEFORM)     \
  DECLARE_WAVEFORM(OFF, 0)                      \
  DECLARE_WAVEFORM(LOW, 1)                      \
  DECLARE_WAVEFORM(FLASH_LOW,                   \
                   1,  1,  0,  0,  0,  0,  0,  0,  0,  0, \
                   0,  0,  0,  0,  0,  0,  0,  0,  0,  0, \
                   1,  0,  0,  0,  0,  0,  1,  0,  0,  0, \
                   0,  0,  0,  0,  0,  0,  0,  0,  0,  0, \
                   0,  0,  0,  0,  0,  0,  0,  0,  0,  0, )   \
                                                              \
  DECLARE_WAVEFORM(BEACON_LINEAR,                             \
                   1, 1<<2, 1<<3, 1<<4, 1<<5, 1<<6, 1<<7, 1<<7, 1<<7, 1<<7, \
                   1<<7, 1<<7, 1<<7, 1<<7, 1<<6, 1<<5, 1<<4, 1<<3, 1<<2, 1, \
                   1, 1, 1, 1, 1, 1, 1, 1, 1, 1,                        \
                   1, 1, 1, 1, 1, 1, 1, 1, 1, 1,                        \
                   1, 1, 1, 1, 1, 1, 1, 1, 1, 1)                        \
                                                                        \
  DECLARE_WAVEFORM(BEACON_SINUSOIDAL,                                   \
                   1, 4, 16, 34, 58, 87, 118, 149, 179, 205,            \
                   227, 242, 250, 250, 242, 227, 205, 179, 149, 118,    \
                   87, 58, 34, 16, 4, 1, 1, 1, 1, 1,                    \
                   1, 1, 1, 1, 1, 1, 1, 1, 1, 1,                        \
                   1, 1, 1, 1, 1, 1, 1, 1, 1, 1)                        \
                                                                        \
  DECLARE_WAVEFORM(PULSE_LONG,                                          \
                   0, 0, 0, 1, 1, 2, 2, 3, 4, 5,                        \
                   6, 7, 9, 10, 12, 13, 15, 17, 18, 20,                 \
                   22, 24, 26, 28, 30, 32, 34, 36, 38, 40,              \
                   42, 44, 46, 47, 49, 51, 52, 54, 55, 57,              \
                   58, 59, 60, 61, 62, 62, 63, 63, 64, 64,              \
                   64, 64, 64, 63, 63, 62, 62, 61, 60, 59,              \
                   58, 57, 55, 54, 52, 51, 49, 47, 46, 44,              \
                   42, 40, 38, 36, 34, 32, 30, 28, 26, 24,              \
                   22, 20, 18, 17, 15, 13, 12, 10, 9, 7,                \
                   6, 5, 4, 3, 2, 2, 1, 1, 0, 0)                        \
  DECLARE_WAVEFORM(HIGH, 255)                                           \
  //DECLARE_WAVEFORM(NAME, values...)                                   \



// This macro expands to create the enum def
#define DECL_Waveforms_e_ENTRY(name, ...) WAVEFORM_ ## name ## _E,

// Declare the Waveforms_e enum type
enum Waveforms_e {
  // For each waveform, expand the macro to declare the enum value
  DECLARE_WAVEFORMS(DECL_Waveforms_e_ENTRY)
  WAVEFORM_COUNT_E,
};


// This macro expands to create the waveform_len array entry value
#define DECL_WAVEFORM_LEN_ENTRY(name, ...) (sizeof((int[]){__VA_ARGS__})/sizeof(int)),

// Declare the waveforms_len array
const int waveforms_len[WAVEFORM_COUNT_E] = {
  // Foe each waveform, expand the macro to compute the waveform array length
  DECLARE_WAVEFORMS(DECL_WAVEFORM_LEN_ENTRY)
};


// This macro expands to the unique waveform array name
#define DECL_waveform_VARNAME(VARNAME, ...) waveform_ ## VARNAME


// This macro expands to declare and initialize the waveform array variable
#define DECL_waveform_(name, ...)                                     \
  const PROGMEM int DECL_waveform_VARNAME(name) [] = { __VA_ARGS__ };

// For each waveform, expand the macro to declare and initialize the waveform array variable
DECLARE_WAVEFORMS(DECL_waveform_);


// This macro expands to the waveform array variable name with a trailing comma
#define DECL_waveform_table_ENTRY(name, ...) DECL_waveform_VARNAME(name),


// Declare the waveforms_table variable initialized for each waveform array variable
const int* waveforms_table[WAVEFORM_COUNT_E] = {
  DECLARE_WAVEFORMS(DECL_waveform_table_ENTRY)
};
#endif //WAVEFORMS_H
