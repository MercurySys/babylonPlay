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
  VisualRectangle[] rectangles = new VisualRectangle[20];
  for (int i=0; i<rectangles.length; i++) {
    rectangles[i] = new VisualRectangle(
      new Point(random(width), random(height)), 
      new Point(random(width), random(height)));
    float area = rectangles[i].area();
    float w = map(area, 0, width*height, 1, 10);
    rectangles[i].setWeight(w);
  }

  for (VisualRectangle rect : rectangles) rect.displayStroke();
}
