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
  VisualRectangle[] rectangles = new VisualRectangle[20];
  for (int i=0; i<rectangles.length; i++) {
    rectangles[i] = new VisualRectangle(
      new Point(random(width), random(height)), 
      new Point(random(width), random(height)), 
      1, color(0, 50));
  }

  for (int i=0; i<rectangles.length; i++) {
    VisualRectangle a = rectangles[i];
    for (int j=i+1; j<rectangles.length; j++) {
      VisualRectangle b = rectangles[j];
      Rectangle rect = a.intersectRect(b);
      if (rect != null) {
        stroke(0);
        strokeWeight(1);
        int n = int((rect.p2.x - rect.p1.x)/5);
        for (int k=0; k<n; k++) {
          float x = map(k, 0, n, rect.p1.x, rect.p2.x);
          line(x, rect.p1.y, x, rect.p2.y);
        }
      }
    }
  }
}
