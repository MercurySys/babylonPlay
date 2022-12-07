import processing.serial.*;

Serial myPort;
char HEAD;
byte [] message;

void setup() {
  size(200, 100);
  println("Arduino连接在：" + Serial.list()[0]);
  myPort = new Serial(this, Serial.list()[0], 9600);
  message = new byte[10];
}

void draw() {
  background(0);
  try {
    if (myPort.available() > 0) {
      HEAD = (char)myPort.read();
      if (HEAD == 'H') {
        message = myPort.readBytesUntil('E');
        for (int i = 0; i < message.length-1; i++) {
          if (message[message.length-1] == 'E') {
            println("从Arduino接收的数据为：" + message[i]);
            println("数据接收完整！");
            textAlign(CENTER);

   text("Arduino发送的数据为："+message[i],width/2,height/2);
          }
        }
      }
      delay(500);
    }
  }
  catch(Exception e) {
    println("读取速度不稳定！");
  }
}
