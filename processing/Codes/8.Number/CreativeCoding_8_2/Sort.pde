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
}
