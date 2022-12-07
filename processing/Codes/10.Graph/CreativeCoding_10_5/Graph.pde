class Graph {
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  float G = 100;

  Graph() {
    JSONObject jsonObject = loadJSONObject("tree.json");
    String name = jsonObject.getString("name");
    float x = width/2;
    float y = height/2;
    Vertex root = new Vertex(name, x, y);
    vertices.add(root);
    
    create(root, jsonObject);
  }
  
  void create(Vertex parent, JSONObject jsonObject) {
    float margin = 150;
    JSONArray children = jsonObject.getJSONArray("children");
    for (int i=0; i<children.size(); i++) {
      JSONObject child = children.getJSONObject(i);
      String name = child.getString("name");
      float x = random(margin, width-margin);
      float y = random(margin, height-margin);
      Vertex vertex = new Vertex(name, x, y);
      vertices.add(vertex);

      Edge edge = new Edge(parent, vertex);
      edges.add(edge);

      if (!child.isNull("children"))create(vertex, child);
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
