class Graph {
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  ArrayList<Edge> edges = new ArrayList<Edge>();

  Graph() {
    for (int i=65; i<91; i++) {
      char c = char(i);
      float radian = map(i, 65, 91, 0, TAU);
      float x = width/2 + cos(radian) * 400;
      float y = height/2 + sin(radian) * 400;
      Vertex vertex = new Vertex(str(c), x, y);
      vertices.add(vertex);
    }

    String[] data = loadStrings("text.txt");
    String[] words = splitTokens(data[0].toUpperCase(), "012,. ");

    for (int i=0; i<words.length; i++) {
      String word = words[i];
      for (int j=0; j<word.length()-1; j++) {
        Vertex a = getVertex(str(word.charAt(j)));
        Vertex b = getVertex(str(word.charAt(j+1)));
        Edge edge = getEdge(a, b);
        if (edge == null) {
          edges.add(new Edge(a, b));
        } else {
          edge.weight++;
        }
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

  void display() {
    for (Edge edge : edges) edge.display();
    for (Vertex vertex : vertices) vertex.display();
  }
}
