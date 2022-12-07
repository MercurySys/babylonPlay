import processing.serial.*;

Serial myPort;
int ln;    

void setup() {
  size(600, 400);
  ln = 10;                                   //10代表回车
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  background(0);
  if (myPort.available() > 0) {
      String recv_data = myPort.readStringUntil(10);
    if (recv_data != null) {
      float data = float(recv_data);
      showInfo(recv_data, 10, 25);
      println("距离为：" + recv_data);
      getEffect(data);
    }
    delay(5);
  }
}

void showInfo(String info, float x, float y) {
try {
  info = info.trim();
  PFont font = createFont("myFont.vlw", 20);
  textFont(font);
  textSize(20);
  text("接收到的距离数据为：" + info + " 厘米", x, y);
  }
catch(Exception e) {
  println("数据传输有误！");
  }
}

void getEffect(float info) {
stroke(255);
strokeWeight(2);
info = constrain(info,0,300);
info = map(info,0,300,100,300);
fill(info,info*2,info*3);
ellipse(width/2, height/2, info, info);
}
