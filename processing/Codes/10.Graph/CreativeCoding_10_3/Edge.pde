class Edge {
  Vertex a, b;

  Edge(Vertex a, Vertex b) {
    this.a = a;
    this.b = b;
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    line(a.position.x, a.position.y, 
      b.position.x, b.position.y);
  }
}
