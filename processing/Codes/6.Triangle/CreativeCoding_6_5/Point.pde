class Point {
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Point() {
    x = 0;
    y = 0;
  }

  Point copy() {
    return new Point(x, y);
  }

  float distance(Point p) {
    float dx = x - p.x;
    float dy = y - p.y;
    return sqrt(dx*dx+dy*dy);
  }

  void rotate(Point p, float a) {
    float dx = x - p.x;
    float dy = y - p.y;
    x = p.x + cos(a)*dx - sin(a)*dy;
    y = p.y + sin(a)*dx + cos(a)*dy;
  }
  
  Point lerp(Point p, float t) {
    return new Point(x+(p.x-x)*t, y+(p.y-y)*t);
  }
}
