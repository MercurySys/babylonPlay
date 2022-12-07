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
    float r = random(100, 500);
    circles[i] = new VisualCircle(p, r);
  }

  stroke(0, 50);
  strokeWeight(1);
  for (int time=0; time<100; time++) {
    for (int i=0; i<circles.length; i++) {
      VisualCircle a = circles[i];
      a.update();
      for (int j=i+1; j<circles.length; j++) {
        VisualCircle b = circles[j];
        Point[] points = a.intersect(b);
        if (points!=null) {
          line(points[0].x, points[0].y, points[1].x, points[1].y);
        }
      }
    }
  }
}
