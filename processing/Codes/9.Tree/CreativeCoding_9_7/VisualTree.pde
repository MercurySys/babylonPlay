class VisualTree {
  Tree root;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    display(root, width/2, height, height/3, -HALF_PI);
  }

  Tree create(Tree parent, JSONObject object) {
    String name = object.getString("name");
    Tree node = new Tree(name);
    node.setParent(parent);
    if (!object.isNull("children")) {
      JSONArray array = object.getJSONArray("children");
      for (int i=0; i<array.size(); i++) {
        Tree child = create(node, array.getJSONObject(i));
        child.setParent(node);
        node.addChild(child);
      }
    }
    return node;
  }

  void display(Tree node, float px, float py, float r, float a) {
    float radian = a + random(-QUARTER_PI, QUARTER_PI);
    if (node.root()) radian = a;
    float x = px + cos(radian) * r;
    float y = py + sin(radian) * r;

    stroke(0);
    line(px, py, x, y);
    fill(0);
    textSize(10);
    textAlign(LEFT, CENTER);
    text(node.name, x, y);

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i), x, y, r*.7, radian);
      }
    }
  }
}
