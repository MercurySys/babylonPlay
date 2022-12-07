// Creative Coding
// Ren Yuan

import processing.pdf.*;
void setup() {
  String filename = this.getClass().getName();
  beginRecord(PDF, filename + ".pdf");
  size(1000, 1000);
  ellipseMode(RADIUS);
  rectMode(CORNERS);
  background(255);
  stroke(0);
  noFill();
  render();
  endRecord();
  saveFrame(filename + ".jpg");
}

void render() {    
  VisualCircle[] circles = new VisualCircle[100];
  for (int i=0; i<circles.length; i++) {
    float radian = TAU * (sqrt(5)-1)/2 * i;
    float radius = sqrt(i+1) * 40;
    float x = width/2 + cos(radian) *  radius;
    float y = height/2 + sin(radian) *  radius;
    Point p = new Point(x, y);
    circles[i] = new VisualCircle(p, 30);
  }
  
  for(VisualCircle circle : circles) circle.displayStroke();
}
