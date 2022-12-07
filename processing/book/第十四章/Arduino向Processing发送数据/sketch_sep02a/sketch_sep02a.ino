byte data;
#define HEAD 'H'
#define END 'E'

void setup() {
  Serial.begin(9600);
  data = 0;
}

void loop() {
  Serial.write(HEAD);
  Serial.write(data);
  Serial.write(END);
  data++;
  delay(500);
}
