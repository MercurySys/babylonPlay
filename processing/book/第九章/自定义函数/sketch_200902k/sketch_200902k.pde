void setup() {
  size(500, 500);
  background(255);
  setAllLine();         //跳转至第11行，自定义函数所在的位置
}

void draw() {
  
}

void setAllLine() {
  for (int i = 0; i < width; i+=10) {
    for (int j = 0; j < height; j+=10) {
      line(i, j+10, i+10, j);
    }
  }
}              
