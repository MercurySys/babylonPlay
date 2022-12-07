import processing.serial.*;

Serial myPort;
final char HEAD = 'H';
final char END = 'E';
byte message  = 0;
String open, close;

void setup() {
  size(250, 150);
  open = "串口通信开启！";
  close = "串口通信关闭！";
  println("Arduino连接在：" + Serial.list()[0]);
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  background(0);
  text("信息起始位：" + HEAD, 10, 10);
  text("信息停止位：" + END, 10, 25);
  if (keyPressed) {
    if (key == 's') {
        text(open, 10, 50);
        text("传输起始位：" + HEAD,10,71);
        myPort.write(HEAD);
        myPort.write(message);
        text("数据正在传输，传输中的数据为：" + message, 10, 91);
        myPort.write(END);
        text("传输停止位："+END,10,111);
        message++;
    } else {
      text(close, 10, 50);
    }
  }
  delay(100);
}
