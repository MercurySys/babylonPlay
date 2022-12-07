class VisualRectangle extends Rectangle {
  float w;
  color c;

  VisualRectangle(Point p1, Point p2, float w, color c) {
    super(p1, p2);
    this.w = w;
    this.c = c;
  }

  VisualRectangle(Point p1, Point p2) {
    super(p1, p2);
    w = 1;
    c = color(0);
  }

  void setWeight(float w) {
    this.w = w;
  }

  void setColor(color c) {
    this.c = c;
  }

  void displayStroke() {
    stroke(c);
    strokeWeight(w);
    noFill();
    rect(p1.x, p1.y, p2.x, p2.y);
  }

  void displayFill() {
    noStroke();
    fill(c);
    rect(p1.x, p1.y, p2.x, p2.y);
  }

  VisualRectangle[] subdivide(float u, float v) {
    VisualRectangle[] rectangles = new VisualRectangle[4];

    float x = map(u, 0, 1, p1.x, p2.x);
    float y = map(v, 0, 1, p1.y, p2.y);
    Point p = new Point(x, y);

    Point p3 = new Point(p2.x, p1.y);
    Point p4 = new Point(p1.x, p2.y);
    Point a = p1.lerp(p3, u);
    Point b = p3.lerp(p2, v);
    Point c = p1.lerp(p4, u);
    Point d = p4.lerp(p2, v);

    rectangles[0] = new VisualRectangle(p1, p);
    rectangles[1] = new VisualRectangle(a, b);
    rectangles[2] = new VisualRectangle(p, p2);
    rectangles[3] = new VisualRectangle(d, c);
    return rectangles;
  }
}
