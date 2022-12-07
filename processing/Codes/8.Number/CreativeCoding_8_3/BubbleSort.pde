class BubbleSort extends Sort {
  BubbleSort(int[] data) {
    super(data);
  }

  void sort() {
    for (int i=1; i<data.length; i++) {
      for (int j=0; j<data.length-i; j++) {
        if (data[j]>data[j+1]) {
          swap(j, j+1);
        }
      }
    }
  }
}
