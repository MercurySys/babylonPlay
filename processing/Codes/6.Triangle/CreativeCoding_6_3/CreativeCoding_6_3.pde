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
  VisualTriangle[] triangles = new VisualTriangle[3];
  for (int i=0; i<triangles.length; i++) {
    Point p1 = new Point(random(width), random(height));
    Point p2 = new Point(random(width), random(height));
    Point p3 = new Point(random(width), random(height));
    triangles[i] = new VisualTriangle(p1, p2, p3, color(200));
  }

  for (VisualTriangle triangle : triangles) {
    triangle.displayStroke();
    Point p = triangle.circumcenter();
    stroke(0);
    strokeWeight(5);
    point(p.x, p.y);
    Circle circle = triangle.circumcircle();
    strokeWeight(2);
    noFill();
    ellipse(circle.p.x, circle.p.y, circle.r, circle.r);
  }
}
