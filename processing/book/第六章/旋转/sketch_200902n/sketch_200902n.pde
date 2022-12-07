float angle = 0.0f;

void setup() {
  size(200, 200);
}

void draw() {
  rectMode(CENTER);
  translate(100,100);
  rotate(angle);
  rect(0,0,50,50);
  angle += 1.0;
}
