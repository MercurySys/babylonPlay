class Particle {
  Vector position;
  Vector velocity;
  Vector acceleration;
  float mass = 1;
  float maxSpeed = 1;

  Particle(float x, float y) {
    position = new Vector(x, y);
    velocity = new Vector();
    acceleration = new Vector();
  }

  void apply(Vector force) {
    acceleration = acceleration.add(force.copy().div(mass));
  }

  void update() {
    velocity = velocity.add(acceleration);
    velocity = velocity.limit(maxSpeed);
    position = position.add(velocity);
    acceleration = acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    point(position.x, position.y);
  }
}
