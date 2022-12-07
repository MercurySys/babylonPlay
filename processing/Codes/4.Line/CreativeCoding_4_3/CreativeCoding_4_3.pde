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
  float[] numbers = progression(30, 1.1);
  float min = min(numbers);
  float max = max(numbers);
  
  VisualLine[] lines = new VisualLine[numbers.length];

  for (int i=0; i<lines.length; i++) {
    float x = map(numbers[i], min, max, 0, width);
    Point p1 = new Point(x, 0);
    Point p2 = new Point(x, height);
    lines[i] = new VisualLine(p1, p2, 2, color(0));
  }
  
  for(VisualLine line : lines) line.display();
}


float[] progression(int n, float q) {
  float[] result = new float[n];
  result[0] = 1;
  for (int i=1; i<n; i++) {
    result[i] = result[i-1]*q;
  }
  return result;
}
