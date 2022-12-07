int x=0;

void setup() {
  size(300, 100);
  smooth();
  background(0);
}

void draw() {
  if (keyPressed==true) {
    x=key-3;
    fill(255);
    rect(x, 1, 20, 101);
  }
}

//也可以通过以下形式实现：
/*
int x=0;

void setup() {
  size(300, 100);
  smooth();
  background(0);
}

void draw() {
}

void keyPressed(){
    x=key-3;
    fill(255);
    rect(x, 1, 20, 101);
}*/
