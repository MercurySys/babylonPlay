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
    lines[i] = new VisualLine(p1, p2, 1, color(0, 30));
  }
  
  for (int time=0; time<1000; time++) {
    for (int i=0; i<lines.length; i++) {
      lines[i].p1.rotate(lines[i].p2, 0.01);
      for (int j=0; j<lines.length; j++) {
        Point p = lines[i].intersect(lines[j]);
        if (p!=null) lines[i].display();
      }
    }
  }
}
