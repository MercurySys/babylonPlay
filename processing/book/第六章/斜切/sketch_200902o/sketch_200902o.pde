float angle = 0.01f;

void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  rectMode(CENTER);
  shearX(radians(angle));
  rect(50, 50, 50, 50);
  angle += 0.1;
}
