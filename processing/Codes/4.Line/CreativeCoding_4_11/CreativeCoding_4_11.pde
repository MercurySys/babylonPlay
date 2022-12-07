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
  VisualPoint[] points = new VisualPoint[100];
  VisualLine[] lines = new VisualLine[10];

  for (int i=0; i<points.length; i++) {
    float x = random(width);
    float y = random(height);
    points[i] = new VisualPoint(x, y, 5, color(0));
    points[i].display();
  }

  for (int i=0; i<lines.length; i++) {
    float x = map(i, -1, lines.length, 0, width);
    Point p1 = new Point(x, random(height));
    Point p2 = new Point(x, random(height));
    lines[i] = new VisualLine(p1, p2);
    lines[i].display();
  }
  
  for (int i=0; i<points.length; i++) {
    for (int j=0; j<lines.length; j++) {
      Point p = lines[j].perpendicular(points[i]);
      if (p!=null) {
        float d = p.distance(points[i]);
        float alpha = map(d, 0, width, 255, 0);
        float weight = map(d, 0, width, 2, 0);
        stroke(0, alpha);
        strokeWeight(weight);
        line(points[i].x, points[i].y, p.x, p.y);
      }
    }
  }
}
