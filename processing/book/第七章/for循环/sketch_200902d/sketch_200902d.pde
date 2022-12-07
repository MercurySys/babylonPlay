void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  for (int x = 10; x<width; x+=10) {
    for (int y = 10; y<width; y+=10) {
      ellipse(x, y, 10, 10);
    }
  }
}
