void setup() {
  size(200, 200);
  background(0);
}

void draw() {
//让x坐标点实现“隔一个”的效果
  for (int x = 0; x < width; x+=2) {
//让y坐标点实现“隔一个”的效果
    for (int y = 0; y < height; y+=2) {
//把x,y的值送入坐标参数，同时也将它们的值当做颜色值传入
      set(x, y, color(x, y, x%(y+1)));
    }
  }
}
