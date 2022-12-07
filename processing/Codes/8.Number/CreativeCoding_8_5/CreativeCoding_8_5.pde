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
  String[] data = loadStrings("number.txt");
  String[] names = new String[data.length];
  float[] numbers = new float[data.length];
  for (int i=0; i<data.length; i++) {
    String[] line = split(data[i], TAB);
    names[i] = line[0];
    numbers[i] = float(line[1]);
  }
  float max = maxNumber(numbers);

  translate(width/2, height/2);
  noStroke();
  fill(0);
  textAlign(RIGHT, CENTER);
  
  float radius = 200;
  for (int i=0; i<data.length; i++) {
    float r1 = radius;
    float r2 = r1 + 10;
    float start = -HALF_PI;
    float end = map(numbers[i], 0, max, -HALF_PI, TAU-PI);
    ring(r1, r2, start, end);
    text(names[i], -10, -r1-8);

    radius += 15;
  }
}

void ring(float r1, float r2, float start, float end) {
  int n = int((end-start)/TAU * 1000);
  float radian = (end-start)/n;
  float x, y;
  beginShape();
  for (float i=0; i<=n; i++) {
    x = cos(start + i*radian) * r1;
    y = sin(start + i*radian) * r1;
    vertex(x, y);
  }
  for (float i=0; i<=n; i++) {
    x = cos(end - i*radian) * r2;
    y = sin(end - i*radian) * r2; 
    vertex(x, y);
  }
  endShape(CLOSE);
}

float maxNumber(float[] data) {
  float result = data[0];
  for (int i=1; i<data.length; i++) {
    if (data[i]>result) result = data[i];
  }
  return result;
}
