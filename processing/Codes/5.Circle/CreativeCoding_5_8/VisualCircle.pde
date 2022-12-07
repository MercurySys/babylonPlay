class VisualCircle extends Circle {
  color c;

  VisualCircle(Point p, float r, color c) {
    super(p, r);
    this.c = c;
  }

  VisualCircle(Point p, float r) {
    super(p, r);
    c = color(0);
  }

  void setColor(color c) {
    this.c = c;
  }

  void displayStroke() {
    stroke(c);
    noFill();
    ellipse(p.x, p.y, r, r);
  }

  void displayFill() {
    noStroke();
    fill(c);
    ellipse(p.x, p.y, r, r);
  }
  
  void update() {
    r += noise(r/1000)*20;
  }
}
