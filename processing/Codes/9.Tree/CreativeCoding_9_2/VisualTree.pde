class VisualTree {
  Tree root;
  float leafWidth;
  float leafHeight;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    leafWidth = float(width-1)/root.depth();
    leafHeight = float(height-1)/root.leafs();
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
    float x = leafWidth * (node.level()-1);
    float y = y(node, leafHeight);
    float w = leafWidth;
    float h = leafHeight * node.leafs();

    stroke(0);
    noFill();
    if (node.leaf()) fill(0);
    rectMode(CORNER);
    rect(x, y, w, h);
    if (h>20) {
      fill(0);
      textSize(10);
      textAlign(LEFT, TOP);
      text(node.name, x+5, y+5);
    }

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i));
      }
    }
  }

  float y(Tree node, float leafHeight) {
    if (!node.root()) {
      float ty = 0;
      for (int i=0; i<node.parent.children.size(); i++) {
        Tree child = node.parent.children.get(i);
        if (child == node) break;
        ty += leafHeight*child.leafs();
      }
      return ty + y(node.parent, leafHeight);
    } else {
      return 0;
    }
  }
}
