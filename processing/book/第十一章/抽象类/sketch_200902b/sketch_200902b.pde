int number = 50;
MyEllipse [] e_array;
MyRectangle [] r_array;

void setup() {
  size(500, 500);
  smooth();
  e_array = new MyEllipse[number];
  r_array = new MyRectangle[number];
  
  
    for (int i = 0; i < number; i++) {
    e_array[i] = new MyEllipse(random(width), random(height), random(5,20), color(random(255),random(255),random(255)));

    r_array[i] = new MyRectangle(random(width), random(height), random(5,20), color(random(255),random(255),random(255)));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < number; i++) {
    e_array[i].show();
    e_array[i].move();
    r_array[i].show();
    r_array[i].move();
  }
}
