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
  VisualCircle[] circles = new VisualCircle[200];
  for (int i=0; i<circles.length; i++) {
    VisualCircle a = new VisualCircle(
      new Point(width/2, height/2), 
      random(10, 40), 
      color(0)
      );
    circles[i] = a;
    float radian = 0;
    float radius = 0;
    while (true) {
      boolean intersect = false;
      for (int j=i-1; j>=0; j--) {
        Circle b = circles[j];
        float d = a.p.distance(b.p);
        if (d < a.r+b.r) {
          intersect = true;
          break;
        }
      }
      if (!intersect) break;
      radian += .1;
      if (radian > TAU) {
        radian = 0;
        radius += 1;
      }
      a.p.x = width/2 + cos(radian) * radius;
      a.p.y = height/2 + sin(radian) * radius;
    }
  }

  for (VisualCircle circle : circles) circle.displayStroke();
}
