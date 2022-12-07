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
    textAlign(CENTER, CENTER);
    float radian = map(name.charAt(0), 65, 91, 0, TAU);
    float x = cos(radian) * 20;
    float y = sin(radian) * 20;
    text(name, position.x+x, position.y+y);
  }
}
