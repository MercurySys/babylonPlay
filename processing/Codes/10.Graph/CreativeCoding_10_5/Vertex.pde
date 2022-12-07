class Vertex {
  String name;
  Vector position;
  Vector velocity;
  Vector acceleration;
  float friction = .9;
  float mass;

  Vertex(String name, float x, float y) {
    this.name = name;
    position = new Vector(x, y);
    velocity = new Vector();
    acceleration = new Vector();
    mass = 1;
  }
  
  void apply(Vector force) {
    acceleration = acceleration.add(force.div(mass));
  }
  
  void update() {
    velocity = velocity.add(acceleration);
    velocity = velocity.mult(friction);
    position = position.add(velocity);
    acceleration = acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(position.x, position.y, 5, 5);

    textSize(12);
    textAlign(LEFT, CENTER);
    text(name, position.x+10, position.y);
  }
}
