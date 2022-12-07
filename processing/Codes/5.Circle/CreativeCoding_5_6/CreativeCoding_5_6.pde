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
  textAlign(CENTER, CENTER);
  textSize(24);

  String data = "141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117068";

  VisualCircle[] circles = new VisualCircle[data.length()];
  for (int i=0; i<circles.length; i++) {
    int number = int(str(data.charAt(i)));
    float r = map(number, 0, 10, 20, 50);
    Point p = new Point(width/2, height/2);
    VisualCircle a = new VisualCircle(p, r, color(0));
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

    fill(0);
    text(number, p.x, p.y);
  }

  for (VisualCircle circle : circles) circle.displayStroke();
}
