class VisualTree {
  Tree root;
  float leafWidth;
  float leafHeight;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    leafWidth = float(width-1)/root.leafs();
    leafHeight = float(height-1)/root.depth();
    display(root);
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

  void display(Tree node) {
    float x = x(node, leafWidth);
    float y = leafHeight * (node.level()-1);
    float w = leafWidth * node.leafs();
    float h = leafHeight;

    stroke(0);
    noFill();
    if (node.leaf()) fill(0);
    rectMode(CORNER);
    rect(x, y, w, h);
    if (w>20) {
      fill(0);
      textSize(10);
      textAlign(LEFT, TOP);
      pushMatrix();
      translate(x+w, y);
      rotate(HALF_PI);
      text(node.name, 5, 5);
      popMatrix();
    }

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i));
      }
    }
  }

  float x(Tree node, float leafWidth) {
    if (!node.root()) {
      float tx = 0;
      for (int i=0; i<node.parent.children.size(); i++) {
        Tree child = node.parent.children.get(i);
        if (child == node) break;
        tx += leafWidth*child.leafs();
      }
      return tx + x(node.parent, leafWidth);
    } else {
      return 0;
    }
  }
}
