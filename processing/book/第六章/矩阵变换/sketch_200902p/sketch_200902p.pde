float angle;

void setup() {
  size(200, 200);
  angle = 0;
}

void draw() {
  background(0);
  rectMode(CENTER);
  rotate(angle);
  fill(255);
  rect(100, 100, 50, 50);
  angle += 0.1f;
  //新绘制的正方形
  translate(100, 100);  //改变新绘制正方形的原点坐标
  rotate(angle);
  fill(#16A5F0);
  rect(0, 0, 50, 50);
}
