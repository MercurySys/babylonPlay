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
  VisualRectangle[] rectangles = new VisualRectangle[10];
  for (int i=0; i<rectangles.length; i++) {
    rectangles[i] = new VisualRectangle(
      new Point(random(width), random(height)), 
      new Point(random(width), random(height)));
    rectangles[i].velocity = new Vector(random(-5, 5), random(-5, 5));
  }

  for (int time=0; time<100; time++) {
    for (int i=0; i<rectangles.length; i++) {
      VisualRectangle a = rectangles[i];
      a.update();
      for (int j=i+1; j<rectangles.length; j++) {
        VisualRectangle b = rectangles[j];
        Rectangle rect = a.intersectRect(b);
        if (rect != null) {
          stroke(0, 100);
          strokeWeight(1);
          noFill();
          rect(rect.p1.x, rect.p1.y, rect.p2.x, rect.p2.y);
        }
      }
    }
  }
}
