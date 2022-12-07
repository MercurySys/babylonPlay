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
  Point[] points = new Point[200];
  for (int i=0; i<points.length; i++) {
    points[i] = new Point(random(width), random(height));
  }

  float maxDistance = 300;
  for (int i=0; i<points.length; i++) {
    Point a = points[i];
    for (int j=i+1; j<points.length; j++) {
      Point b = points[j];
      float d = a.distance(b);
      if (d < maxDistance) {
        float alpha = map(d, 0, maxDistance, 255, 0);
        float weight = map(d, 0, maxDistance, 2, 0);
        stroke(0, alpha);
        strokeWeight(weight);
        line(a.x, a.y, b.x, b.y);
      }
    }
  }
}
