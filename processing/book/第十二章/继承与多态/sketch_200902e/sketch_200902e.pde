Graphic rect;
Graphic ellipse;

void setup() {
  size(500,500);
  rect = new Rectangle(width/2, height/2, 50, random(0.5, 1), random(0.5, 1), color(255, 0, 0));
  ellipse = new Ellipse(50, 50, 50, random(0.5, 1), random(0.5, 1), color(0, 255, 0));
}


void draw() {
  rect.show();
  rect.move();
  ellipse.show();
  ellipse.move();
}
