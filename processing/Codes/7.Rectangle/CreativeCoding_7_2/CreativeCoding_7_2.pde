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
  VisualRectangle[] rectangles = new VisualRectangle[100];
  for (int i=0; i<rectangles.length; i++) {
    rectangles[i] = new VisualRectangle(
      new Point(random(width), random(height)), 
      new Point(random(width), random(height)));
    rectangles[i].velocity = new Vector(random(-3, 3), random(-3, 3));
  }

  Point[] points = new Point[10];
  for (int i=0; i<points.length; i++) {
    points[i] = new Point(random(width), random(height));
  }

  for (int time=0; time<1000; time++) {
    for (int i=0; i<rectangles.length; i++) {
      VisualRectangle rect = rectangles[i];
      for (int j=0; j<points.length; j++) {
        Point p = rect.contains(points[j]);
        if (p!=null) {
          rect.update();
          stroke(0, 10);
          line(p.x, p.y, rect.p1.x, rect.p1.y);
          line(p.x, p.y, rect.p2.x, rect.p2.y);
        }
      }
    }
  }
}
