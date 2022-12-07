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
    Point p1 = new Point(x, random(height));
    Point p2 = new Point(x, random(height));
    lines[i] = new VisualLine(p1, p2);
    float alpha = map(lines[i].length(), 0, height, 0, 100);
    lines[i].setColor(color(0, alpha));
  }
  
  for (int time=0; time<100; time++) {
    for (VisualLine line : lines) {
      line.p1.rotate(line.p2, 0.01);
      line.display();
    }
  }
}
