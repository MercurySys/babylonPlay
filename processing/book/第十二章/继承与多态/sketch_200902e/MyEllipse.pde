class Ellipse extends Graphic {
//声明属性
  float xposition;
  float yposition;
  float widths;
  float xstep;
  float ystep;
  color colors;

//构造函数赋值
  Ellipse(float x, float y, float w, float xs, float ys, color c) {
    this.xposition = x;
    this.yposition = y;
    this.widths = w;
    this.xstep = xs;
    this.ystep = ys;
    this.colors = c;
  }

//show方法的重写，用于绘制图形
  public void show() {
    fill(colors);
    ellipse(xposition, yposition, widths, widths);
  }
//move方法的重写，用于控制图形运动
  public void move() {
    xposition += xstep;
    yposition += ystep;

  if (xposition > width - widths/2 || xposition < widths/2) {
//当图形碰壁后进行反向运动
      xstep = -xstep;
    }

 if (yposition > height - widths/2 || yposition < widths/2) {
//当图形碰壁后进行反向运动
      ystep = -ystep;
    }
  }
}
