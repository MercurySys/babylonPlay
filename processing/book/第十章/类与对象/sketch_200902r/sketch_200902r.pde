Check toggle=new Check();

void setup() {
  size(150, 150);
  smooth();
  toggle.x = 50;
  toggle.y = 50;
  toggle.size = 50;
  toggle.checked = false;
}

void draw() {
  background(180);
  toggle.display();
}

void mousePressed() {
  toggle.press(mouseX, mouseY);
}
