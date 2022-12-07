void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill(255, 0, 0);
      ellipse(width/2, height/2, 100, 100);
    } else if (mouseButton == CENTER) {
      fill(255, 124, 0);
      rectMode(CENTER);
      rect(width/2, height/2, 100, 100);
    } else if (mouseButton == RIGHT) {
      fill(0, 124, 255);
      triangle(width/2,height/2-50,width/2+50,height/2+50, width/2-50, height/2+50);
    }
  }
}
