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
  VisualCircle[] circles = new VisualCircle[40];
  for (int i=0; i<circles.length; i++) {
    float x = width/2 + random(-20, 20);
    float y = height/2 + random(-20, 20);
    Point p = new Point(x, y);
    float r = random(100, 450);
    circles[i] = new VisualCircle(p, r, color(0, 100));
  }

  for (VisualCircle circle : circles) circle.displayStroke();

  stroke(0);
  strokeWeight(5);
  for (int i=0; i<circles.length; i++) {
    VisualCircle a = circles[i];
    for (int j=i+1; j<circles.length; j++) {
      VisualCircle b = circles[j];
      Point[] points = a.intersect(b);
      if (points!=null) {
        point(points[0].x, points[0].y);
        point(points[1].x, points[1].y);
      }
    }
  }
}
