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
  VisualLine[] lines = new VisualLine[100];

  for (int i=0; i<lines.length; i++) {
    Point p1 = new Point(random(width), random(height));
    Point p2 = new Point(random(width), random(height));
    lines[i] = new VisualLine(p1, p2, 1, color(0, 20));
  }
  
  for (int time=0; time<100; time++) {
    for (int i=0; i<lines.length; i++) {
      VisualLine l1 = lines[i];
      VisualLine l2 = lines[(i+1)%lines.length];
      l1.p1.rotate(l1.p2, 0.01);
      l1.p2.rotate(l2.p1, 0.01);
      lines[i].display();
    }
  }
}
