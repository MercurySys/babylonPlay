class Rectangle {
  
  float x_position;
  float y_position;
  color clr;
  color last_color;
  float widths;
  float angle;

  Rectangle(float x, float y, color _c, float r) {
    this.x_position = x;
    this.y_position = y;
    this.clr = _c;
    this.widths = r;
    this.last_color = color(255);
    angle = 0;
  }

  public void forCalculate() {
    float dist = dist(mouseX, mouseY, x_position, y_position);
    if (dist <= this.widths / 2 && mousePressed) {
      for (int i = 0; i<360; i++) {
        angle += sin(i) * 0.95;
      }
    } else {
      angle = 0;
    }
  }

  public void showRect() {
    float dist = dist(mouseX, mouseY, this.x_position, this.y_position);
    if (dist <= this.widths / 2 && mousePressed) {
      fill(clr);
      if (clr != last_color) {
        last_color = clr;
      }
    } else {
      fill(last_color);
    }
    pushMatrix();
    rectMode(CENTER);
    translate(x_position, y_position);
    rotateY(angle);
    strokeWeight(2);
    stroke(angle,angle*angle,angle * 2);
    rect(0, 0, widths, widths);
    popMatrix();
  }

  public void all_set() {
    showRect();
    forCalculate();
  }
}
