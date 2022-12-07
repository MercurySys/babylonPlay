int y_pos;
int x_pos;

void setup() {
  size(200, 200);
  y_pos = 10;
  x_pos = 10;
  background(0);
}

void draw() {
//控制生成纵轴的图形
  while (y_pos < 200) {
    fill(255);
    ellipse(height/2, y_pos, y_pos*0.1, y_pos*0.1);
    y_pos += 10;
  }//控制生成横轴的图形
  while (x_pos < 200) {
    fill(255);
    ellipse(x_pos, height/2, x_pos*0.1, x_pos*0.1);
    x_pos += 10;
  }
}
