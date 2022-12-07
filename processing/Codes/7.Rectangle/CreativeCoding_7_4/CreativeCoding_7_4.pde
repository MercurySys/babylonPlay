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
  }

  for (VisualRectangle rect : rectangles) rect.displayStroke();

  for (int i=0; i<rectangles.length; i++) {
    VisualRectangle a = rectangles[i];
    for (int j=i+1; j<rectangles.length; j++) {
      VisualRectangle b = rectangles[j];
      ArrayList<Point> points = a.intersectPoint(b);
      for (int k=0; k<points.size(); k++) {
        Point p = points.get(k);
        stroke(0);
        strokeWeight(5);
        point(p.x, p.y);
      }
    }
  }
}
