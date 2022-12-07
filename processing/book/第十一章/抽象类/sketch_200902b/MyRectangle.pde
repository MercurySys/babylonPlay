class MyRectangle extends Graphic {

  public float xposition;
  public float yposition;
  public float xstep;
  public float ystep;
  public float radius;
  public color c;

  MyRectangle(float xpos, float ypos, float rad, color c) {
    this.xposition = xpos;
    this.yposition = ypos;
    this.radius = rad;
    this.xstep = random(0.1,1);
    this.ystep = random(0.1,1);
    this.c = c;
  }

  public void show() {
    fill(c);
    rect(xposition, yposition, radius, radius);
  }

  public void move() {
    xposition += xstep;
    yposition += ystep;
  }
}
