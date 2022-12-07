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
  int n = 5;
  Point[] points = new Point[5];
  for (int i=0; i<n; i++) {
    points[i] = new Point(random(width), random(height));
  }

  Triangle[] triangles = new Triangle[n-2];
  for (int i=0; i<n-2; i++) {
    triangles[i] = new Triangle(points[i], points[i+1], points[i+2]);
  }

  stroke(0, 100);
  for (int time = 0; time<100; time++) {
    for (int i=0; i<n; i++) {
      int j = (i+1)%n;
      points[i].rotate(points[j], .01);
    }

    for (int i=0; i<n-2; i++) {
      Circle circle = triangles[i].circumcircle();
      ellipse(circle.p.x, circle.p.y, circle.r, circle.r);
    }
  }
}
