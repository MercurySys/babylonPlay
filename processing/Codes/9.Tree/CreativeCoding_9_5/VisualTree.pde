class VisualTree {
  Tree root;
  float leafWidth;
  float leafHeight;
  float margin = 10;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    leafWidth = width/root.depth();
    leafHeight = (height-margin*2)/root.leafs();
    display(root, margin, height/2);
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
    float x = margin + leafWidth * (node.level()-1);
    float h = leafHeight * node.leafs();
    float y = margin + y(node, leafHeight) + h/2;

    stroke(0);
    line(px, py, x, y);
    fill(0);
    textSize(6);
    textAlign(LEFT, CENTER);
    text(node.name, x+5, y);

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i), x, y);
      }
    }
  }

  float y(Tree node, float leafHeight) {
    if (!node.root()) {
      float y = 0;
      for (int i=0; i<node.parent.children.size(); i++) {
        Tree child = node.parent.children.get(i);
        if (child == node) break;
        y += leafHeight*child.leafs();
      }
      return y + y(node.parent, leafHeight);
    } else {
      return 0;
    }
  }
}
