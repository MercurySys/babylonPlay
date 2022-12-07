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
    line(a.position.x, a.position.y, 
      b.position.x, b.position.y);
  }
}
