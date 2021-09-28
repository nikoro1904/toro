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
#define EN_R 9
#define EN_L 4

//                   {A,B,A',B'}
const int PIN_L[4] = {3,6,12,5};
const int PIN_R[4] = {11,8,10,7};

#define IN_R1 7
#define IN_R2 2
#define IN_L1 4
#define IN_L2 6

const int FULL_A[4] = {HIGH, HIGH, LOW, LOW};
const int FULL_B[4] = {LOW, HIGH, HIGH, LOW};
const int FULL_C[4] = {LOW, LOW, HIGH, HIGH};
const int FULL_D[4] = {HIGH, LOW, LOW, HIGH};

//Pin p:                  p =  1A   2B    3A'  4B'      // Schritt s:
const int FULLSTEP[4][4] = { {HIGH, HIGH, LOW, LOW },   // s = 0 / U
                             {LOW, HIGH, HIGH, LOW },   // s = 1 / V
                             {LOW, LOW, HIGH, HIGH },   // s = 2 / W
                             {HIGH, LOW, LOW, HIGH } }; // s = 4 / X
uint8_t dir = 0;
uint8_t speed_r = 0;
uint8_t speed_l = 0;
unsigned long pause_r = 10;
unsigned long pause_l = 0;

#include <Wire.h>
#define I2C_ADDRESS 0x04

uint8_t msg = 0;
//unsigned long mainTimer = 0;
//unsigned long loopStartTime = 0;

void setup() {
  for (int i=EN_R; i<=IN_R1; i++) {
    pinMode(i, OUTPUT);
  }
  pinMode(LED_BUILTIN, OUTPUT);
  
  Wire.begin(I2C_ADDRESS);
  Wire.setClock(100000);
  Wire.onReceive(receiveEvent);

//  Serial.begin(115200);
//  mainTimer = micros();
}

void loop() {
  // put your main code here, to run repeatedly:
  //loop_start_time = micros();

  switch (dir){
    case 0x00:
    {
      drive_backwards(80, pause_r);
      break;
    }
    case 0x01:
    {
      rotate_left(45, pause_r);
      break;
    }
    case 0x02:
    {
      rotate_right(45, pause_r);
      break;
    }
    case 0x03:
    {
      drive_forward(80, pause_r);
      break;
    }
    default:
      digitalWrite(EN_R, LOW);
      digitalWrite(EN_L, LOW);
  }

  
}

void receiveEvent(int x) {
  /*
   * this function is executed when new I2C data is available to read.
   * It saves the last byte available to the global variable msg.
   */
  while(Wire.available() > 0) {
    msg = Wire.read();
  }
  dir = (msg & 0x03);
  //speed_r = (msg & 0x1C) >> 2;
  //speed_l = (msg & 0xE0) >> 5;

  //pause_r = speed2pause(speed_r);
  //pause_l = speed2pause(speed_l);

  if(pause_r == 0) {
    digitalWrite(EN_R, LOW);
    digitalWrite(EN_L, LOW);
  }
  else {
    digitalWrite(EN_R, HIGH);
    digitalWrite(EN_L, HIGH);
  }
}

unsigned long speed2pause(uint8_t speed) {
  /* converts speed (3 bit information) to the pause between steps for the 
   *  stepper motor in microseconds.
   *  speed = 0 signifies standing motor. This returns a pause of 0 which 
   *  must be handled separately to the other pauses.   * 
   */
  unsigned long pauses[8] = {0, 17500, 15000, 12500, 10000, 7500, 5000, 2500};
  unsigned long pause = pauses[speed];
  return pause;
}

void rotate_left(int steps, unsigned long pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[3-s][p]); // L backwards
          digitalWrite(PIN_R[p], FULLSTEP[3-s][p]); // R forward
        }
      delayMicroseconds(pause);
    }
  }
}

void rotate_right(int steps, unsigned long pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
      for (int p = 0; p < 4; p++) {
        digitalWrite(PIN_L[p], FULLSTEP[s][p]); // L forward
        digitalWrite(PIN_R[p], FULLSTEP[s][p]); // R backwards
      }
      delayMicroseconds(pause);
    }
  }
}

void drive_forward(int steps, unsigned long pause) {
  for (int i=0; i<steps; i++) {
    for (int s = 0; s < 4; s++) {
      for (int p = 0; p < 4; p++) {
        digitalWrite(PIN_L[p], FULLSTEP[s][p]); // L forward
        digitalWrite(PIN_R[p], FULLSTEP[3-s][p]); // R forward
        }
      delayMicroseconds(pause);
    }
  }
}

void drive_backwards(int steps, unsigned long pause) {
  for (int i=0; i<steps; i++) {
      for (int s = 4; s > 0; s++) {
        for (int p = 0; p < 4; p++) {
          digitalWrite(PIN_L[p], FULLSTEP[3-s][p]); // L backwards
          digitalWrite(PIN_R[p], FULLSTEP[s][p]);  // R backwards
          }
      delayMicroseconds(pause);
    }
  }
}
