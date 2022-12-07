class Line {
  Point p1, p2;

  Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  float length() {
    return p1.distance(p2);
  }
  
  void rotate(Point p, float a) {
    p1.rotate(p, a);
    p2.rotate(p, a);
  }
}
