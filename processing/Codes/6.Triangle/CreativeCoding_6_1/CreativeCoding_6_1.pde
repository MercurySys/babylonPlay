// Creative Coding
// Ren Yuan

import processing.pdf.*;
void setup() {
  String filename = this.getClass().getName();
  //beginRecord(PDF, filename + ".pdf");
  size(1000, 1000);
  ellipseMode(RADIUS);
  rectMode(CORNERS);
  background(255);
  stroke(0);
  noFill();
  render();
  //endRecord();
  saveFrame(filename + ".jpg");
}

void render() {
  blendMode(DIFFERENCE);
  
  VisualTriangle[] triangles = new VisualTriangle[20];
  for (int i=0; i<triangles.length; i++) {
    Point p1 = new Point(random(width), random(height));
    Point p2 = new Point(random(width), random(height));
    Point p3 = new Point(random(width), random(height));
    triangles[i] = new VisualTriangle(p1, p2, p3, color(255));
  }

  for (VisualTriangle triangle : triangles) triangle.displayFill();
}
