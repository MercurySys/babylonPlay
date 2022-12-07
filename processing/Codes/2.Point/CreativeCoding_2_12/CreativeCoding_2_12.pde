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
  Point[] points = new Point[100];
  for (int i=0; i<100; i++) {
    float x = random(width);
    float y = random(height);
    points[i] = new Point(x, y);
  }
  
  float maxDistance = 300;
  for (int time=0; time<20; time++) {
    for (int i=0; i<points.length; i++) {
      int index = (i+1)%points.length;
      points[i].rotate(points[index], .01);
    }
    
    for (int i=0; i<points.length; i++) {
      Point a = points[i];
      for (int j=i+1; j<points.length; j++) {
        Point b = points[j];
        float d = a.distance(b);
        if (d < maxDistance) {
          float alpha = map(d, 0, maxDistance, 255, 0);
          float weight = map(d, 0, maxDistance, 1, 0);
          stroke(0, alpha);
          strokeWeight(weight);
          line(a.x, a.y, b.x, b.y);
        }
      }
    }
  }
}
