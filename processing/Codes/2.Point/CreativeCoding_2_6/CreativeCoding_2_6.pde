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
  int col = 49;
  int row = 49;
  VisualPoint[] points = new VisualPoint[col*row];

  float margin = 50;
  int index = 0;
  for (int i=0; i<row; i++) {
    for (int j=0; j<col; j++) {
      float x = map(j, 0, col-1, margin, width-margin);
      float y = map(i, 0, row-1, margin, height-margin);
      float w = 5;
      color c = color(150);
      if (index%2==0) {
        w = 10;
        c = color(0);
      }
      points[index] = new VisualPoint(x, y, w, c);
      index++;
    }
  }

  for (VisualPoint p : points) p.display();
}
