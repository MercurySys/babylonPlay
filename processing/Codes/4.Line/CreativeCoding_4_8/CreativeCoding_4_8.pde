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
  VisualLine[] lines = new VisualLine[10];

  for (int i=0; i<lines.length; i++) {
    Point p1 = new Point(random(width), random(height));
    Point p2 = new Point(random(width), random(height));
    lines[i] = new VisualLine(p1, p2);
  }
  
  for (int time=0; time<1000; time++) {
    float t = map(time, 0, 1000, 0, 1);
    for (int i=0; i<lines.length-1; i++) {
      VisualLine l1 = lines[i];
      VisualLine l2 = lines[i+1];
      Point p1 = l1.lerp(t);
      Point p2 = l2.lerp(t);
      float d = p1.distance(p2);
      float alpha = map(d, 0, width, 10, 0);
      stroke(0, alpha);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
}
