// Robotic Tutorials Niko Rosberg
// 08.01.2021
// used self-built L293B board
// L293     Arduino UNO
// CE1      DP5~
// IN1      DP4
// IN2      DP0
// CE2      DP3~
// IN3      DP1
// IN4      DP2

// v2 of L293B board (PCB)
// L293     Arduino Nano Motor
// -------------------------
// U1:
// CE       DP6~
// IN1      DP12  A
// IN2      DP3   A'
// IN3      DP4   B
// IN4      DP5   B'
//-----------------------------------
// U2:
// CE       DP11~
// IN1      DP7   A
// IN2      DP8   A'
// IN3      DP9   B
// IN4      DP10  B'


// Pins for left motor (L, 1)
#define EN_L1 6
#define L1_1 12
#define L1_2 3
#define L1_3 4
#define L1_4 5

// pins for right motor (R)
#define EN_R2 11
#define R2_1 7
#define R2_2 8
#define R2_3 9
#define R2_4 10

const int PIN_L1[4] = {L1_1, L1_3, L1_2, L1_4};
const int PIN_R2[4] = {R2_1, R2_3, R2_2, R2_4};


//Pin p:                  p =  1A   2B    3A'  4B'      // Schritt s:
const int FULLSTEP[4][4] = { {HIGH, HIGH, LOW, LOW },   // s = 0 / U
                             {LOW, HIGH, HIGH, LOW },   // s = 1 / V
                             {LOW, LOW, HIGH, HIGH },   // s = 2 / W
                             {HIGH, LOW, LOW, HIGH } }; // s = 3 / X

void setup() {
  // put your setup code here, to run once:

  // set all motor pins as output
  for (int i=3; i<13; i++) {
      pinMode(i, OUTPUT);
  }

  // turn off both motors
  analogWrite(EN_L1, 0);
  analogWrite(EN_R2, 0);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  digitalWrite(EN_R2, HIGH);
  turn_R2(true, 40, 2000);
  digitalWrite(EN_R2, LOW);
  delay(500);
  digitalWrite(EN_R2, HIGH);
  turn_R2(false, 40, 2000);
  digitalWrite(EN_R2, LOW);
  delay(1000);

  digitalWrite(EN_L1, HIGH);
  turn_L1(true, 40, 2000);
  digitalWrite(EN_L1, LOW);
  delay(500);
  digitalWrite(EN_L1, HIGH);
  turn_L1(false, 40, 2000);
  digitalWrite(EN_L1, LOW);
  delay(1000);

}

void turn_L1(bool motor_direction, int motor_steps, int motor_speed) {
  for (int i=0; i<motor_steps; i++) {
    for (int s=0; s<4; s++) {
      for (int p=0; p<4; p++) {
        int s2 = motor_direction? s : 3-s;
        digitalWrite(PIN_L1[p], FULLSTEP[s2][p]);
      }
      delayMicroseconds(motor_speed);
    }
  }
}

void turn_R2(bool motor_direction, int motor_steps, int motor_speed) {
  for (int i=0; i<motor_steps; i++) {
    for (int s=0; s<4; s++) {
      for (int p=0; p<4; p++) {
        int s2 = motor_direction? s : 3-s;
        digitalWrite(PIN_R2[p], FULLSTEP[s2][3-p]);
      }
      delayMicroseconds(motor_speed);
    }
  }
}
