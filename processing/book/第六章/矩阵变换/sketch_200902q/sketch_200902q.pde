float angle;

void setup() {
  size(200, 200);
  angle = 0;
}

void draw() {
  background(0);
  rectMode(CENTER);
  //将第一个正方形推入矩阵
pushMatrix();
  translate(50,50);
  rotate(angle);
  fill(255);
  rect(0, 0, 50, 50);
//将第一个正方形推出矩阵
  popMatrix();
  //新绘制的正方形，将第二个正方形推入矩阵
  pushMatrix();
  translate(100, 100);  //改变新绘制正方形的原点坐标
  rotate(angle);
  fill(#16A5F0);
  rect(0, 0, 50, 50);
//将第二个正方形推出矩阵
  popMatrix();
  angle += 0.01f;
}
