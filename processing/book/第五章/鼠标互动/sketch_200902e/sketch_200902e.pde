void setup() {
size(500, 500);
    smooth();   //抗锯齿
}

void draw() {
  stroke(mouseX,mouseY,abs(mouseX - mouseY));
  strokeWeight(abs(pmouseX - mouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
