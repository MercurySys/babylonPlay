class Circle {
  Point p;
  float r;

  Circle(Point p, float r) {
    this.p = p;
    this.r = r;
  }

  float area() {
    return PI*r*r;
  }
}
