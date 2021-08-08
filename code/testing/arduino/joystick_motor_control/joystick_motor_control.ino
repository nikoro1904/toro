/* Niko Rosberg, TORO Project, 13-05-2021
*  Code for readout of joystick and motor control
*  use L293B board
*/
#define FB_PIN A5
#define LR_PIN A4

#define EN_R 3
#define EN_L 5

#define IN_R1 7
#define IN_R2 2
#define IN_L1 4
#define IN_L2 6

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  for (int i=2; i<7; i++) {
    pinMode(i, OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:

  // read analog values (0...1023)
  int senseFB = analogRead(FB_PIN);
  int senseLR = analogRead(LR_PIN);

  // calculate normalized output values (-5...5)
  int normFB = map(senseFB, 0, 1023, -5, 5);
  int normLR = map(senseLR, 0, 1023, -5, 5);

  // calc motor control values
  int motorControlR = normFB + normLR;
  int motorControlL = normFB - normLR;

  // calc PWM values
  int signedPwmR = map(motorControlR, -10, 10, -255, 255);
  int signedPwmL = map(motorControlL, -10, 10, -255, 255);

  // get abs values
  int pwmR = abs(signedPwmR);
  int pwmL = abs(signedPwmL);

  // get signs
  int dirR = getIntSign(signedPwmR);
  int dirL = getIntSign(signedPwmL);

  // set input/direction pins
  setInputPins(dirR, IN_R1, IN_R2);
  setInputPins(dirL, IN_L1, IN_L2);

  // set enable/strength pins
  analogWrite(EN_R, pwmR);
  analogWrite(EN_L, pwmL);

  Serial.print(motorControlR);
  Serial.print("  ");
  Serial.println(motorControlL);
  delay(100);
}

int getIntSign(int integer) {
  if (integer >> 15) {
    return 1;
  } else {
      return -1;
  }
}

void setInputPins(int direction, int in1, int in2) {
  if (direction > 0) {
    digitalWrite(in1, HIGH);
    digitalWrite(in2, LOW);
  } else {
    digitalWrite(in1, LOW);
    digitalWrite(in2, HIGH);
  }
}

void setEnablePin(int strength, int en) {
  int pwmValue = map(strength, 0, 5, 0, 255);
  analogWrite(en, pwmValue);
}
