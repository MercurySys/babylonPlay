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
  translate(width/2, height/2);
  VisualCircle[] circles = new VisualCircle[1000];
  for (int i=0; i<circles.length; i++) {
    float radian = random(TAU);
    float radius = random(450);
    float x = cos(radian) *  radius;
    float y = sin(radian) *  radius;
    Point p = new Point(x, y);
    VisualCircle a = new VisualCircle(p, 100, color(0));
    circles[i] = a;

    boolean include = false;
    for (int j=i-1; j>=0; j--) {
      Circle b = circles[j];
      float d = a.p.distance(b.p);
      if (d<b.r) include = true;
      if (d<a.r+b.r) a.r = d-b.r;
    }
    
    float d = a.p.distance(new Point(0, 0));
    if (d+a.r>450) a.r = 450-d;
    
    if (!include) {
      a.displayStroke();
    } else {
      i--;
    }
  }
}
