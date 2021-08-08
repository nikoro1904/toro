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

// Pins for left motor (L)
#define CEL 5
#define ML1 4
#define ML2 0

// pins for right motor (R)
#define CER 3
#define MR1 1
#define MR2 2

void setup() {
  // put your setup code here, to run once:

  // set all motor pins as output
  for (int i=0; i<6; i++) {
      pinMode(i, OUTPUT);
  }

  // turn off both motors
  analogWrite(CEL, 0);
  analogWrite(CER, 0);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  // turn left motor
  digitalWrite(ML1, LOW);
  digitalWrite(ML2, HIGH);
  analogWrite(CEL, 255);

}
