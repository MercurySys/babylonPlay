class Triangle {
  Point p1, p2, p3;

  Triangle(Point p1, Point p2, Point p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }

  float area() {
    float a = p1.distance(p2);
    float b = p2.distance(p3);
    float c = p3.distance(p1);
    float p = (a+b+c)/2;
    return sqrt(p*(p-a)*(p-b)*(p-c));
  }

  Point circumcenter() {
    Vector a = new Vector(p2.x-p1.x, p2.y-p1.y);
    Vector b = new Vector(p3.x-p2.x, p3.y-p2.y);
    Vector c = new Vector(p1.x-p3.x, p1.y-p3.y);
    Vector n = a.perpendicular();
    Vector d = n.mult(b.dot(c)/n.dot(c));
    Vector p = a.add(d).mult(.5).add(new Vector(p1.x, p1.y));
    return new Point(p.x, p.y);
  }

  Circle circumcircle() {
    Point p = circumcenter();
    float r = p1.distance(p);
    return new Circle(p, r);
  }
}
