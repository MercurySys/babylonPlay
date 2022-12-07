byte data;
char message;

void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {
    message = Serial.read();
    if (message == 'H') {
      Serial.print("接收到起始位信息：");
      Serial.println(message);
      
      data = Serial.read();
      
      digitalWrite(13,HIGH);
      delay(data);
      digitalWrite(13,LOW);
      
      Serial.print("接收的数据为：");
      Serial.println(data);
      
    } else if (message == 'E') {
      Serial.print("接收到停止位信息：");
      Serial.println(message);
      Serial.println("信息接收完毕！");
    }
  }
}
