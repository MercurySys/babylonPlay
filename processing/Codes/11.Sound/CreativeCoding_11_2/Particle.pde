class Particle {
  float py, x, y;
  float w;
  float speed;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    py = y;
    w = random(2, 10);
    speed = random(.1, 1);
  }
  
  void update(float rms) {
    py = y;
    y += speed * rms * 100;
    border();
  }

  void border() {
    if (py>height) {
      x = random(width);
      y = 0;
      py = y;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(w);
    line(x, py, x, y);
  }
}
