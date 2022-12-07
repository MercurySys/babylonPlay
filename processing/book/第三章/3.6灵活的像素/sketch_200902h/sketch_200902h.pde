PImage img;
void setup() {
  size(1280, 854);
  img = loadImage("view.jpg");  
  background(0);
}

void draw() {
  img.loadPixels();
  for (int x = 0; x< img.width; x+=10) {
    for (int y = 0; y< img.height; y+=10) {
      color c = img.pixels[x+y*img.width];
      fill(c);
      rectMode(CENTER);
      rect(x,y,20,20);
    }
  }
  img.updatePixels();
}
