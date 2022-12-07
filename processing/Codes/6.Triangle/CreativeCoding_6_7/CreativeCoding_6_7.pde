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
  VisualTriangle triangle1 = new VisualTriangle(
    new Point(0, 0), 
    new Point(width, 0), 
    new Point(0, height)
    );
  subdivide(triangle1);

  VisualTriangle triangle2 = new VisualTriangle(
    new Point(width, 0), 
    new Point(width, height), 
    new Point(0, height)
    );
  subdivide(triangle2);
}


void subdivide(VisualTriangle triangle) {
  if (triangle.area()<1000) {
    noStroke();
    fill(0);
    triangle(
      triangle.p1.x, triangle.p1.y, 
      triangle.p2.x, triangle.p2.y, 
      triangle.p3.x, triangle.p3.y
      );
    return;
  }

  VisualTriangle[] triangles = triangle.subdivide();
  for (int i=0; i<triangles.length; i++) {
    subdivide(triangles[i]);
  }
}
