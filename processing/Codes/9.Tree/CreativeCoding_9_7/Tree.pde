class Tree {
  String name;
  Tree parent;
  ArrayList<Tree> children;

  Tree(String name) {
    this.name = name;
    this.parent = null;
    children = new ArrayList<Tree>();
  }
  
  void setParent(Tree parent) {
    this.parent = parent;
  }

  void addChild(Tree child) {
    children.add(child);
  }

  Tree getChild(int index) {
    return children.get(index);
  }
  
  boolean root() {
    return parent == null;
  }
  
  boolean leaf() {
    return degree() == 0;
  }
  
  int degree() {
    return children.size();
  }
  
  int leafs() {
    if (!leaf()) {
      int count = 0;
      for (int i=0; i<children.size(); i++) {
        count += children.get(i).leafs();
      }
      return count;
    } else {
      return 1;
    }
  }
  
  int level() {
    if (parent != null) {
      return 1 + parent.level();
    } else {
      return 1;
    }
  }

  int depth() {
    if (!leaf()) {
      int max = 0;
      for (int i=0; i<children.size(); i++) {
        max = max(max, 1+children.get(i).depth());
      }
      return max;
    } else {
      return 1;
    }
  }
}
