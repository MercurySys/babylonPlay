class VisualPoint extends Point {
  VisualPoint(float x, float y) {
    super(x, y);
  }
  
  void update() {
    y += 5;
  }
}
