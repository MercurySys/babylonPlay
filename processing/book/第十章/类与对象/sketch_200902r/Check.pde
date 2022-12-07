class Check {
  int x, y;
  int size;
  boolean checked;

void press(float mx, float my) {
if ((mx >= x)&&(mx <= x+size) && (my >= y)&&(my <= y+size)) {
      checked=!checked;
      }
}

void display() {
stroke(0);
strokeWeight(5);
fill(125);
rect(x, y, size, size);
if (checked==true) {
line(x, y, x+size, y+size);
line(x+size, y, x, y+size);
}
 }
}
