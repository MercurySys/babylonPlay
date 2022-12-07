#include <Servo.h>
const int trig = 2;
const int echo = 3;

const int LR = A0;
float distance;
float control_value;
Servo myservo;

void setup() {
  Serial.begin(9600);
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
  myservo.attach(9);
  myservo.write(0);
}

void loop() {
  digitalWrite(trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(15);
  digitalWrite(trig, LOW);
  distance = pulseIn(echo, HIGH) / 58.0;
  Serial.println(distance);

  control_value = getDirection();
  myservo.write(control_value);
  
  if (control_value >= 180) {
    control_value = 180;
  }
  if (control_value <= 0) {
    control_value = 0;
  }
  delay(5);
}

float getDirection() {
  float value = analogRead(LR);
  return value;
}
