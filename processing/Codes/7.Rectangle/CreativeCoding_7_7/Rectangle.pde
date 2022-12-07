class Rectangle {
  Point p1, p2;

  Rectangle(Point p1, Point p2) {
    this.p1 = new Point(min(p1.x, p2.x), min(p1.y, p2.y));
    this.p2 = new Point(max(p1.x, p2.x), max(p1.y, p2.y));
  }

  float area() {
    return abs(p2.x-p1.x) * abs(p2.y-p1.y);
  }

  Point[] vertexs() {
    Point[] points = new Point[4];
    points[0] = p1.copy();
    points[1] = new Point(p2.x, p1.y);
    points[2] = p2.copy();
    points[3] = new Point(p1.x, p2.y);
    return points;
  }

  Line[] edges() {
    Point p3 = new Point(p2.x, p1.y);
    Point p4 = new Point(p1.x, p2.y);
    Line[] lines = new Line[4];
    lines[0] = new Line(p1, p3);
    lines[1] = new Line(p3, p2);
    lines[2] = new Line(p2, p4);
    lines[3] = new Line(p4, p1);
    return lines;
  }

  Point contains(Point p) {
    if (p.x>p1.x && p.x<p2.x && p.y>p1.y && p.y<p2.y) {
      return p;
    } else {
      return null;
    }
  }
  
  ArrayList<Point> contains(Rectangle rect) {
    Point[] points1 = vertexs();
    Point[] points2 = rect.vertexs();
    ArrayList<Point> points = new ArrayList<Point>();
    for (int i=0; i<4; i++) {
      Point p = contains(points2[i]);
      if (p != null) points.add(p);
    }
    for (int i=0; i<4; i++) {
      Point p = rect.contains(points1[i]);
      if (p != null) points.add(p);
    }
    return points;
  }
  
  ArrayList<Point> intersectPoint(Rectangle rect) {
    Line[] edges1 = edges();
    Line[] edges2 = rect.edges();
    ArrayList<Point> points = new ArrayList<Point>();
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        Point p = edges1[i].intersect(edges2[j]);
        if (p != null) points.add(p);
      }
    }
    return points;
  }
  
  Rectangle intersectRect(Rectangle rect) {
    ArrayList<Point> points = intersectPoint(rect);
    points.addAll(contains(rect));
    if (points.size()==0) return null;
    Point p1 = points.get(0).copy();
    Point p2 = points.get(0).copy();
    for (int i=0; i<points.size(); i++) {
      Point p = points.get(i);
      if (p.x < p1.x) p1.x = p.x;
      if (p.x > p2.x) p2.x = p.x;
      if (p.y < p1.y) p1.y = p.y;
      if (p.y > p2.y) p2.y = p.y;
    }
    return new Rectangle(p1, p2);
  }
}
