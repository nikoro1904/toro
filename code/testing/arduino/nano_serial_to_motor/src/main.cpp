#include <Arduino.h>
#include "movement_functions.h"

/*
 * Niko Rosberg, TORO Project, 04-Nov-2023
 * Code for readout of Serial values (from Raspberry Pi 4 via USB)
 * and sending of motor commands to the L293 board.
 * 
 */



volatile uint8_t dir = 0xFF;
volatile uint8_t interval = 10;
int distance = 10;
int rotation = 10;

void setup() {
  Serial.begin(115200);
  for (int i=3; i<=12; i++) {
    pinMode(i, OUTPUT);
  }
  both_motors_on();
}

void loop() {
  // put your main code here, to run repeatedly:


  switch (dir) {
    case 0x00:    // drive backwards
      both_motors_on();
      drive_backwards(distance, interval);
      break;
    case 0x01:                                // turn front left
      both_motors_on();
      turn_front_left(rotation, interval);
      break;
    case 0x02:                                // turn front right
      both_motors_on();
      turn_front_right(rotation, interval);
      break;
    case 0x03:                                // drive forward
      both_motors_on();
      drive_forward(distance, interval);
      break;
    case 0x04:                                // rotate left
      both_motors_on();
      rotate_left(rotation, interval);
      break;
    case 0x05:// rotate right
      both_motors_on();
      rotate_right(rotation, interval);
      break;
    case 0x06:                                // drive fast forward
      both_motors_on();
      drive_forward(distance, 2*interval/3);
      break;
    case 0x07:                                // turn back left
      both_motors_on();
      turn_back_left(rotation, interval);
      break;
    case 0x08:                                // turn back right
      both_motors_on();
      turn_back_right(rotation, interval);
      break;
    case 0x10:
      both_motors_on();
      drive_backwards(distance, 2*interval/3);
      break;
    case 0x11:
      both_motors_on();
      rotate_left(rotation, interval);
    case 0xa0:
      both_motors_off();
      interval = 3;
      break;
    case 0xa1:
      both_motors_off();
      interval = 5;
      break;
    case 0xa2:
      both_motors_off();
      interval = 10;
      break;
    case 0xa3:
      both_motors_off();
      interval = 15;
      break;
    case 0xa4:
      both_motors_off();
      interval = 20;
      break;
    case 0xa5:
      both_motors_off();
      interval = 25;
    case 0xfd:  // msg 0xfd is reserved for esp32-master communication
      break;
    case 0xfe:  // msg 0xfe is reserved for esp32-master communication
      break;
    case 0xff:
      both_motors_off();                      // off
    default:
      both_motors_off();                      // off
  }
}

void serialEvent() {
  while(Serial.available() > 0) {
    dir = Serial.read();
  }
  Serial.println(dir);
}
