class VisualTriangle extends Triangle {
  color c;

  VisualTriangle(Point p1, Point p2, Point p3, color c) {
    super(p1, p2, p3);
    this.c = c;
  }

  VisualTriangle(Point p1, Point p2, Point p3) {
    super(p1, p2, p3);
    c = color(0);
  }

  void setColor(color c) {
    this.c = c;
  }

  void displayStroke() {
    stroke(c);
    noFill();
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }

  void displayFill() {
    noStroke();
    fill(c);
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
}
