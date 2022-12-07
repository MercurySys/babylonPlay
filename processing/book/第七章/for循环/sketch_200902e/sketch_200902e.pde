PImage source;
int all_round;
float []radius;
float temp_radius;

void setup() {
  source = loadImage("tiger.jpg");
  println("The Width of the Picture is :" + source.width);
  println("The Height of the Picture is :" + source.height);
  size(1920, 1080);
  all_round = source.width * source.height;
  radius = new float[all_round];

  for (int r = 0; r < radius.length; r++) {
    radius[r] = random(5, 35);
  }
  temp_radius = 0;
}

void draw() {
  show_canvas();
}

void show_canvas() {
  source.loadPixels();
  color c;
  colorMode(HSB, 255, 100, 100);
  for (int x = 0; x < source.width; x+=20) {
    for (int y = 0; y < source.height; y+=20) {
      c = source.pixels[x + y*source.width ];
      fill(c, 130);
      noStroke();
      //stroke(255);
      ellipseMode(CENTER);
      ellipse(x, y, temp_radius, random(temp_radius));
    }
  }
  source.updatePixels();
}

void mousePressed() {
  for (int r = 0; r < radius.length; r++) {
    radius[r] = random(20, 50);
  }

  for (int r = 0; r < radius.length; r++) {
    temp_radius = radius[r];
  }
}
