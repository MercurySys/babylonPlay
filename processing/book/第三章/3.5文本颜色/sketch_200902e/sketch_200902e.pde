PFont font;

void setup() {
  size(200, 200);
  font = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font);
  textSize(32);
  textAlign(CENTER);
  fill(255,0,0);
  text("I Love Processing",0,80,200,200);
}

void draw() {
}
