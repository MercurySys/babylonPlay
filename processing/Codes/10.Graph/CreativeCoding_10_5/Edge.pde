class Edge {
  Vertex a, b;
  float k = .1;
  float l = 80;

  Edge(Vertex a, Vertex b) {
    this.a = a;
    this.b = b;
  }
  
  void update() {
    Vector force = a.position.sub(b.position);
    float d = force.mag();
    force = force.normalize();
    force = force.mult(-k*(d-l));

    a.apply(force);
    force = force.mult(-1);
    b.apply(force);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    line(a.position.x, a.position.y, 
      b.position.x, b.position.y);
  }
}
