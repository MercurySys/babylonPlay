class Attractor {
  Vector position;
  float magnitude;

  Attractor(float x, float y, float magnitude) {
    position = new Vector(x, y);
    this.magnitude = magnitude;
  }

  Vector force(Vector position) {
    Vector force = this.position.sub(position);
    force = force.normalize();
    force = force.mult(magnitude);
    return force;
  }
}
