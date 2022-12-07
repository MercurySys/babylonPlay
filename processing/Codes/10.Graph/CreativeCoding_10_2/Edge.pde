class Edge {
  Vertex a, b;
  float weight;

  Edge(Vertex a, Vertex b) {
    this.a = a;
    this.b = b;
    weight = 1;
  }

  void display() {
    stroke(0);
    strokeWeight(weight);
    float x = (a.position.x + b.position.x)/2;
    float r = abs(a.position.x - b.position.x)/2;
    if (a.name.charAt(0) < b.name.charAt(0)) {
      arc(x, a.position.y, r, r, PI, TAU);
    } else {
      arc(x, a.position.y, r, r, 0, PI);
    }
  }
}
