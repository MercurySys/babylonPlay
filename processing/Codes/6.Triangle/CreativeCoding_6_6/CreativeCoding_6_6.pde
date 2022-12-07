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
    new Point(width-1, 0), 
    new Point(0, height-1)
    );
  subdivide(triangle1);

  VisualTriangle triangle2 = new VisualTriangle(
    new Point(width-1, 0), 
    new Point(width-1, height-1), 
    new Point(0, height-1)
    );
  subdivide(triangle2);
}


void subdivide(VisualTriangle triangle) {
  if (triangle.area()<500) return;

  VisualTriangle[] triangles = triangle.subdivide(.4, .6);
  for (int i=0; i<triangles.length; i++) {
    noFill();
    triangle(
      triangles[i].p1.x, triangles[i].p1.y, 
      triangles[i].p2.x, triangles[i].p2.y, 
      triangles[i].p3.x, triangles[i].p3.y
      );
    if (random(1)<.8) {
      subdivide(triangles[i]);
    } else {
      if (random(1)<.2) {
        fill(0);
        triangle(
          triangles[i].p1.x, triangles[i].p1.y, 
          triangles[i].p2.x, triangles[i].p2.y, 
          triangles[i].p3.x, triangles[i].p3.y
          );
      }
    }
  }
}
