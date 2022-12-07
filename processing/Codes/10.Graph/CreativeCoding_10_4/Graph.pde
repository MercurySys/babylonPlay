class Graph {
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  float G = 10;

  Graph() {
    String[] vertex_data = loadStrings("vertex.txt");
    
    float margin = 100;
    for (int i=0; i<vertex_data.length; i++) {
      float x = random(margin, width-margin);
      float y = random(margin, height-margin);
      Vertex vertex = new Vertex(vertex_data[i], x, y);
      vertices.add(vertex);
    }

    String[] edge_data = loadStrings("edge.txt");
    for (int i=0; i<edge_data.length; i++) {
      String[] names = split(edge_data[i], TAB);
      Vertex a = getVertex(names[0]);
      Vertex b = getVertex(names[1]);

      if (a!=null && b!=null)
      {      
        Edge edge = new Edge(a, b);
        edges.add(edge);
      }
    }
  }
  
  Vertex getVertex(String name) {
    for (int i=0; i<vertices.size(); i++) {
      Vertex vertex = vertices.get(i);
      if (vertex.name.equals(name)) return vertex;
    }
    return null;
  }

  Edge getEdge(String a, String b) {
    for (int i=0; i<edges.size(); i++) {
      Edge edge = edges.get(i);
      if (a.equals(edge.a.name) && b.equals(edge.b.name)) return edge;
      if (a.equals(edge.b.name) && b.equals(edge.a.name)) return edge;
    }
    return null;
  }

  Edge getEdge(Vertex a, Vertex b) {
    for (int i=0; i<edges.size(); i++) {
      Edge edge = edges.get(i);
      if (a.name.equals(edge.a.name) && b.name.equals(edge.b.name)) return edge;
      if (a.name.equals(edge.b.name) && b.name.equals(edge.a.name)) return edge;
    }
    return null;
  }
  
  Edge getDirectedEdge(String a, String b) {
    for (int i=0; i<edges.size(); i++) {
      Edge edge = edges.get(i);
      if (a.equals(edge.a.name) && b.equals(edge.b.name)) return edge;
    }
    return null;
  }

  Edge getDirectedEdge(Vertex a, Vertex b) {
    for (int i=0; i<edges.size(); i++) {
      Edge edge = edges.get(i);
      if (a.name.equals(edge.a.name) && b.name.equals(edge.b.name)) return edge;
    }
    return null;
  }
  
  void repulsion() {
    for (int i=0; i<vertices.size(); i++) {
      Vertex a = vertices.get(i);
      for (int j=i+1; j<vertices.size(); j++) {
        Vertex b = vertices.get(j);

        Vector force = a.position.sub(b.position);
        float d = force.mag();
        d = max(d, 1);
        force = force.normalize();
        force = force.mult(G*a.mass*b.mass/(d*d));

        a.apply(force);
        force = force.mult(-1);
        b.apply(force);
      }
    }
  }
  
  void update() {
    repulsion();
    for (Edge edge : edges) edge.update();
    for (Vertex vertex : vertices) vertex.update();
  }

  void display() {
    for (Edge edge : edges) edge.display();
    for (Vertex vertex : vertices) vertex.display();
  }
}
