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
  VisualCircle[] circles = new VisualCircle[10];
  for (int i=0; i<circles.length; i++) {
    Point p = new Point(random(width), random(height));
    float r = random(5, 500);
    circles[i] = new VisualCircle(p, r);
    float area = circles[i].area();
    float alpha = map(area, 25*PI, 250000*PI, 150, 0);
    circles[i].setColor(color(0, alpha));
  }

  for (VisualCircle circle : circles) circle.displayFill();
}
