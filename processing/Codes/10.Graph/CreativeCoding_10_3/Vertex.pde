class Vertex {
  String name;
  Vector position;

  Vertex(String name, float x, float y) {
    this.name = name;
    position = new Vector(x, y);
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(position.x, position.y, 5, 5);

    textSize(12);
    textAlign(LEFT, CENTER);
    text(name, position.x+15, position.y);
  }
}
