import processing.video.*;

Capture myCamera;
String [] device;
color c;
int x, y;

void setup() {
  size(1280, 720);
  device = Capture.list();
  myCamera = new Capture(this, 1280, 720);
  myCamera.start();
  background(0);
}

void draw() {
  if (myCamera.available() == true) {
    println("摄像头读取正常");
    myCamera.read();
  }

  myCamera.loadPixels();
  if (x < myCamera.width) {
    if (y < myCamera.height) {
      c = myCamera.pixels[x + myCamera.width * y];
      pushMatrix();
      translate(x, y);
      fill(c);
      rectMode(CENTER);
      rotate(red(c));
      rect(0, 0, 10, 10);
      popMatrix();
    }
  }
  x += 10;
  if (x >= myCamera.width) {
    x = 0;
    y+=10;
  }
  if (y >= myCamera.height) {
    x = 0;
    y = 0;
background(0);
  }

  myCamera.updatePixels();
  loadPixels();
  updatePixels();
}
