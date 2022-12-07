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
  VisualTriangle triangle = new VisualTriangle(
    new Point(width/2, 0), 
    new Point(width, height), 
    new Point(0, height), color(0, 50)
    );

  VisualTriangle[] triangles = new VisualTriangle[100];
  for (int i=0; i<triangles.length; i++) {
    float t = map(i, 0, triangles.length, 0, 1);
    triangles[i] = triangle.lerp(t);
  }

  for (VisualTriangle t : triangles) t.displayStroke();
}
