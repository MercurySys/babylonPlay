PImage img;
color temp_c;

void setup() {
  size(1000, 281);
  smooth();
  img = loadImage("back.jpg");
  background(0);
}

void draw() {
  image(img, 0, 0);
}

void mouseMoved() {
  img.loadPixels();
  if (mouseX >= 0 && mouseX <= 500) {
    if (mouseY >= 0 && mouseY <= 281) {
      temp_c = img.get(mouseX,mouseY);
    }
  }
  img.updatePixels();
  
  loadPixels();
  int new_PicX = int(map(mouseX,0,500,501,1000));
  pixels[new_PicX + width * mouseY] = temp_c;
  updatePixels();
}
