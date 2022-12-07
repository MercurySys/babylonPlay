PImage img;

void setup() {
  size(535, 300);
  img = loadImage("swim.png");
  //tint(255,0,0,127);
//tint(0,255,0,127);
tint(0,0,255,127);       //填充蓝色，半透明
  image(img,0,0);
}

void draw() {
}
