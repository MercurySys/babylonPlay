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
  VisualRectangle rect = new VisualRectangle(
    new Point(0, 0), 
    new Point(width-1, height-1));
  subdivide(rect);
}


void subdivide(VisualRectangle rectangle) {
  if (rectangle.area()<500) return;
  float u = random(.1, .9);
  float v = random(.1, .9);
  VisualRectangle[] rectangles = rectangle.subdivide(u, v);
  for (int i=0; i<rectangles.length; i++) {
    rectangles[i].displayStroke();
    if (random(1)<.9) {
      subdivide(rectangles[i]);
    } else {
      if (random(1)<.2) {
        rectangles[i].displayFill();
      }
    }
  }
}
