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
  
  Point[] intersect(Circle c) {
    float d = p.distance(c.p);
    if (d > r+c.r) return null;
    float k = (r*r+d*d-c.r*c.r)/(2*r*d);
    float angle = acos(k);
    
    Vector v1 = new Vector(c.p.x-p.x, c.p.y-p.y);
    v1 = v1.mag(r).rotate(angle).add(p.x, p.y);
    Vector v2 = new Vector(c.p.x-p.x, c.p.y-p.y);
    v2 = v2.mag(r).rotate(-angle).add(p.x, p.y);

    Point[] points = {new Point(v1.x, v1.y), new Point(v2.x, v2.y)};
    return points;
  }
}
