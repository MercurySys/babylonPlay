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
}
