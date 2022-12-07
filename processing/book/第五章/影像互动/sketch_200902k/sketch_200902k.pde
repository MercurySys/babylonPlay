import processing.video.*;

Capture myCamera;
String [] device;
color c;

void setup() {
  size(320, 240);
  device = Capture.list();
  myCamera = new Capture(this, 320, 240);
  myCamera.start();
}

void draw() {
  if (myCamera.available() == true) {
    println("摄像头读取正常");
    myCamera.read();
  }
  background(0);
  myCamera.loadPixels();
  for (int x = 0; x<myCamera.width; x+=10) {
    for (int y = 0; y<myCamera.height; y+=10) {
      c = myCamera.pixels[x + myCamera.width * y];
      pushMatrix();    //推入矩阵
      translate(x,y);  //改变原点坐标
      fill(c);
      rectMode(CENTER);
      rotate(red(c));
      rect(0, 0, 10, 10);
      popMatrix();      //推出矩阵
    }
  }
  myCamera.updatePixels();
  loadPixels();
  updatePixels();
}
