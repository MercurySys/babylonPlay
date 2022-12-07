class VisualTree {
  Tree root;

  VisualTree() {
    create();

    println("root: " + root.root()); //true
    println("leaf: " + root.leaf()); //true
    println("degree: " + root.degree()); //3
    println("leafs: " + root.leafs()); //6
    println("level: " + root.level()); //1
    println("depth: " + root.depth()); //4
    
    preorder(root);
  }

  void create() {
    root = null;
    ArrayList<Tree> nodes = new ArrayList<Tree>();
    String[] data = loadStrings("tree.txt");

    for (int i=0; i<data.length; i++) {
      String[] line = split(data[i], TAB);
      String name = line[0];
      int index = int(line[1]);
      Tree node = new Tree(name);
      if (index != -1) {
        Tree parent = nodes.get(index);
        node.setParent(parent);
        parent.addChild(node);
      }
      if (index == -1) root = node;
      nodes.add(node);
    }
  }

  void preorder(Tree node) {
    print(node.name);
    if (!node.leaf()) {
      for (int i=0; i<node.degree(); i++) {
        preorder(node.getChild(i));
      }
    }
  }
}
