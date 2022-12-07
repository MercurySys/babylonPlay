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
    float x = map(i, -1, lines.length, 0, width);
    float y = noise(float(i)/100)*height;
    float length = height/2;
    Point p1 = new Point(x, y-length/2);
    Point p2 = new Point(x, y+length/2);
    lines[i] = new VisualLine(p1, p2, 2, color(0));
  }
  
  for(VisualLine line : lines) line.display();
}
