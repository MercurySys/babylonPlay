PImage img;
int [][] save_color;
int radius;

void setup() {
  size(1024, 768);
  img = loadImage("dog.jpg");
  radius = 10;
save_color = new int [img.width][img.height];
}

void draw() {
  background(0);
  img.loadPixels();
for (int x = 0; x < img.width; x+=radius) {
  for (int y = 0; y < img.height; y+=radius) {
    save_color[x][y] = img.pixels[x + img.width * y];
      fill(save_color[x][y]);
    float distance = dist(mouseX, mouseY, x, y);
    if (distance < 50) {
      noStroke();
      img.pixels[x+img.width*y]=color(random(255), random(255), random(255));
      ellipse(x, y, distance/radius*2, distance/radius*2);
  } else {
       ellipse(x, y, radius, radius);
      }
    }
    img.updatePixels();
  }

if (keyPressed && key == ' ') {
  img = loadImage("dog.jpg");
  img.loadPixels();
 for (int x = 0; x < img.width; x+=radius) {
    for (int y = 0; y < img.height; y+=radius) {
      save_color[x][y] = img.pixels[x + img.width * y];
      fill(save_color[x][y]);
      ellipse(x, y, radius, radius);
      }
    }
    img.updatePixels();
  }
}
