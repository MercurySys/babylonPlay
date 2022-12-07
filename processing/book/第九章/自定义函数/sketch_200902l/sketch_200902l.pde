float [] xpos;
float [] ypos;
float [] radius;
boolean [] state;
color [] c;
int lengths;

void setup() {
  size(500, 500);
  lengths = 20;
  state = new boolean[lengths];
  c = new color[lengths];
  xpos = new float[lengths];
  ypos = new float[lengths];
  radius = new float[lengths];
for (int i = 0; i < 20; i++) {
  state [i] = random(0, 1)>0.5?true:false;
    c[i] = color(random(255), random(255), random(255));
    xpos[i] = random(0, width);
    ypos[i] = random(0, height);
    radius[i] = random(20, 50);
  }
}

void draw() {
  background(20);
  showInfo(lengths, xpos, ypos, state, radius, c);
}

void showInfo(int l, float[] x, float[] y, boolean[] b, float[] r, color[] c) {
  noStroke();
for (int i = 0; i < l; i++) {
  if (b[i] == true) {
      fill(c[i]);
      ellipse(x[i], y[i], r[i], r[i]);
  } else {
      fill(c[i]);
    rectMode(CENTER);
      rect(x[i], y[i], r[i], r[i]);
    }
  }
}
