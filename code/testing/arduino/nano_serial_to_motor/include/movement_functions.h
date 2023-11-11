#include <Arduino.h>

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