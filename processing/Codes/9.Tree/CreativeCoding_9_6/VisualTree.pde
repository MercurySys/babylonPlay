class VisualTree {
  Tree root;
  float leafRadius;
  float leafRadain;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    leafRadius = 550/root.depth();
    leafRadain = TAU/root.leafs();
    translate(width/2, height/2);
    display(root, 0, 0);
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

  void display(Tree node, float px, float py) {
    float radius = leafRadius * (node.level()-1);
    float start = radian(node, leafRadain);
    float end = start + leafRadain * node.leafs();
    float radian = (start+end)/2;
    float x = cos(radian) * radius;
    float y = sin(radian) * radius;

    stroke(0);
    line(px, py, x, y);
    fill(0);
    textSize(8);
    textAlign(LEFT, CENTER);
    pushMatrix();
    if (!node.root())rotate(radian);
    translate(radius, 0);
    text(node.name, 5, 0);
    popMatrix();

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i), x, y);
      }
    }
  }

  float radian(Tree node, float leafRadian) {
    if (!node.root()) {
      float radian = 0;
      for (int i=0; i<node.parent.children.size(); i++) {
        Tree child = node.parent.children.get(i);
        if (child == node) break;
        radian += leafRadian*child.leafs();
      }
      return radian + radian(node.parent, leafRadian);
    } else {
      return 0;
    }
  }
}
