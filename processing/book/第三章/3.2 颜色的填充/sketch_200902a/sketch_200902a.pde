int backColor = 0;

void setup() {
  size(100, 100);
}

void draw() {
  background(backColor);
  backColor += 1;
  if (backColor >= 255) {
    backColor = 0;
  }
}
