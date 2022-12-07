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
    translate(width/2, height/2);
    stroke(0);
    strokeWeight(3);
    noFill();

    float radius = 200;
    for (int i=0; i<history.size(); i++) {
      int[] step = history.get(i);
      beginShape();
      for (int j=0; j<data.length+1; j++) {
        int k = j % data.length;
        float a = map(j, 0, data.length, 0, TAU);
        float r = radius + step[k]*20;
        float x = cos(a) * r;
        float y = sin(a) * r;
        vertex(x, y);
      }
      endShape();

      radius += 5;
    }
  }
}
