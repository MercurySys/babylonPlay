class Sort {
  int[] data;
  ArrayList<int[]> history = new ArrayList<int[]>();

  Sort(int[] data) {
    this.data = data;
    sort();
  }

  void sort() {
  }

  void swap(int i, int j) {
    int temp = data[i];
    data[i] = data[j];
    data[j] = temp;
    step();
  }

  void step() {
    int[] step = new int[data.length];
    arrayCopy(data, step);
    history.add(step);
  }
  
  void print() {
    for (int i=0; i<history.size(); i++) {
      int[] step = history.get(i);
      String result = nf(i+1, 2) + ": ";
      for (int j=0; j<step.length; j++) {
        result += step[j] + " ";
      }
      println(result);
    }
  }

  void display() {
    int m = 5;
    int n = 6;
    float tx = 0;
    float ty = 0;
    float w = width/m;
    float h = height/n;

    for (int i=0; i<history.size(); i++) {
      fill(0);
      textAlign(LEFT, TOP);
      text(i+1, tx+5, ty+5);
      
      stroke(0);
      strokeWeight(3);
      noFill();
      int[] step = history.get(i);
      for (int j=0; j<step.length; j++) {
        float x = map(j, -1, step.length, tx, tx+w);
        float y = ty + h/2;
        float h2 = map(step[j], 0, step.length, 0, h/2);
        line(x, y-h2, x, y+h2);
      }
      tx += w;
      if (tx>=width) {
        tx = 0;
        ty += h;
      }
    }
  }
}
