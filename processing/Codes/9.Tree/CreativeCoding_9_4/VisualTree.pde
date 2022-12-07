class VisualTree {
  Tree root;
  float leafRadius;
  float leafRadain;

  VisualTree() {
    root = create(null, loadJSONObject("tree.json"));
    leafRadius = 450/root.depth();
    leafRadain = TAU/root.leafs();
    translate(width/2, height/2);
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
    float r1 = leafRadius * (node.level()-1);
    float r2 = leafRadius * node.level();
    float start = radian(node, leafRadain);
    float end = start + leafRadain * node.leafs();

    stroke(0);
    noFill();
    if (node.leaf()) fill(0);
    ring(r1, r2, start, end);
    if ((end-start)>.1) {
      fill(0);
      textSize(10);
      textAlign(LEFT, TOP);
      pushMatrix();
      rotate(start);
      translate(r1, 0);
      text(node.name, 5, 5);
      popMatrix();
    }

    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        display(node.getChild(i));
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

  void ring(float r1, float r2, float start, float end) {
    int n = int((end-start)/TAU * 1000);
    float radian = (end-start)/n;
    float x, y;
    beginShape();
    for (float i=0; i<=n; i++) {
      x = cos(start + i*radian) * r1;
      y = sin(start + i*radian) * r1;
      vertex(x, y);
    }
    for (float i=0; i<=n; i++) {
      x = cos(end - i*radian) * r2;
      y = sin(end - i*radian) * r2; 
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}
