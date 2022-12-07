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

  Point lerp(float t) {
    return p1.lerp(p2, t);
  }

  Point intersect(Line l) {
    Vector a = new Vector(p2.x-p1.x, p2.y-p1.y);
    Vector b = new Vector(l.p2.x-l.p1.x, l.p2.y-l.p1.y);
    Vector c = new Vector(l.p1.x-p1.x, l.p1.y-p1.y);
    Vector v1 = a.perpendicular();
    Vector v2 = b.perpendicular();

    float t = c.dot(v2)/a.dot(v2);
    float u = -c.dot(v1)/b.dot(v1);

    if (t>0 && t<1 && u>0 && u<1) {
      Vector v = new Vector(p1.x, p1.y);
      v = v.add(a.mult(t));
      return new Point(v.x, v.y);
    } else {
      return null;
    }
  }
}
