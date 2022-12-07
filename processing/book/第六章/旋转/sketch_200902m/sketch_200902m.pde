float angle = 0.0f; //定义旋转的角度

void setup() {
  size(200, 200);
}

void draw() {
  rectMode(CENTER);
  rotate(angle);    //旋转角度赋值
  rect(100,100,50,50);
  angle += 1.0;     //旋转角度自加
}
