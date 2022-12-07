int number = 1000;
float [] x_position;
float [] y_position;
float [] rectWdith;
float [] rectHeight;
color [] colors;
float [] angle;

void setup() {
  size(800, 800);
  x_position = new float [number];
  y_position = new float [number];
  rectWdith = new float [number];
  rectHeight= new float [number];
  colors = new color [number];
  angle = new float [number];

  for (int i = 0; i < number; i++) {
    x_position[i] = random(width);
    y_position[i] = random(height);
    rectWdith[i] = random(20);
    rectHeight[i] = random(20);
    colors[i] = color(random(255), random(255), random(255));
    angle[i] = random(2);
  }
  println("各项参数均已随机初始化完毕！");
}

void draw() {
  background(0);
  noStroke();
  rectMode(CENTER);
  for (int i = 0; i < number; i++) {
    pushMatrix();
    translate(x_position[i], y_position[i]);
    fill(colors[i]);
    rotate(angle[i]);
    rect(0,0,rectWdith[i], rectHeight[i]);
    popMatrix();
    angle[i] += random(0.1);
  }
}
