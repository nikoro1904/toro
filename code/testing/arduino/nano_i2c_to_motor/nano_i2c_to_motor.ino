/*
 * Niko Rosberg, TORO Project, 27-Sept-2021
 * Code for readout of I2C values (from ESP32)
 * and sending of motor commands to the L293 board.
 * 
 */

// I2C pins
#define SDA A4
#define SCL A5

// L293 pins
#define EN_R 11
#define EN_L 6

//                   {A,B,A',B'}
const int PIN_R[4] = {7,9,8,10};
const int PIN_L[4] = {12,4,3,5}; //{11,8,10,7};

//Pin p:                  p =  1A   2B    3A'  4B'      // Schritt s:
const int FULLSTEP[4][4] = { {HIGH, HIGH, LOW, LOW },   // s = 0 / U
                             {LOW, HIGH, HIGH, LOW },   // s = 1 / V
                             {LOW, LOW, HIGH, HIGH },   // s = 2 / W
                             {HIGH, LOW, LOW, HIGH } }; // s = 3 / X

volatile uint8_t dir = 0xFF;
volatile uint8_t interval = 10;
int distance = 10;
int rotation = 10;

#include <Wire.h>
#define I2C_ADDRESS 0x04

void setup() {
  for (int i=3; i<=12; i++) {
    pinMode(i, OUTPUT);
  }
  both_motors_on();

  Wire.begin(I2C_ADDRESS);
  Wire.onReceive(readI2Cinput);
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

void readI2Cinput(int howMany) {
  while(Wire.available() > 0) {
    dir = Wire.read();
  }
}

void turn_back_left(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[3-s][p]); // L backwards
          digitalWrite(PIN_R[p], LOW); // R stands
        }
      delay(my_pause);
    }
  }
}

void turn_back_right(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], LOW); // L forward
          digitalWrite(PIN_R[p], FULLSTEP[s][p]); // R stands
        }
      delay(my_pause);
    }
  }
}

void turn_front_left(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], LOW); // L stands
          digitalWrite(PIN_R[p], FULLSTEP[3-s][p]); // R forward
        }
      delay(my_pause);
    }
  }
}

void turn_front_right(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[s][p]); // L forward
          digitalWrite(PIN_R[p], LOW); // R stands
        }
      delay(my_pause);
    }
  }
}

void rotate_left(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[3-s][p]); // L backwards
          digitalWrite(PIN_R[p], FULLSTEP[3-s][p]); // R forward
        }
      delay(my_pause);
    }
  }
}

void rotate_right(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[s][p]); // L forward
          digitalWrite(PIN_R[p], FULLSTEP[s][p]); // R backward
        }
      delay(my_pause);
    }
  }
}
void drive_forward(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
      for (int p = 0; p < 4; p++) {
        digitalWrite(PIN_L[p], FULLSTEP[s][p]); // L forward
        digitalWrite(PIN_R[p], FULLSTEP[3-s][p]); // R forward
        }
      delay(my_pause);
    }
  }
}

void drive_backwards(int steps, int my_pause) {
  for (int i=0; i<steps; i++) {
      for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[3-s][p]); // L backwards
          digitalWrite(PIN_R[p], FULLSTEP[s][p]);  // R backwards
          }
      delay(my_pause);
    }
  }
}

void both_motors_on() {
  digitalWrite(EN_L, HIGH);
  digitalWrite(EN_R, HIGH);
}

void both_motors_off() {
  for (int s = 0; s < 4; s++) {
    for (int p = 0; p < 4; p++) {
      digitalWrite(PIN_L[p], LOW); // L backwards
      digitalWrite(PIN_R[p], LOW);  // R backwards
    }
  }
  digitalWrite(EN_L, LOW);
  digitalWrite(EN_R, LOW);
}
