class Particle {
  float px, x, y;
  float w;
  float speed;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    px = x;
    w = random(2, 10);
    speed = random(.1, 1);
  }
  
  void update(float level) {
    px = x;
    x += speed * level * 1000;
    border();
  }

  void border() {
    if (px>width) {
      y = random(height);
      x = 0;
      px = x;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(w);
    line(px, y, x, y);
  }
}
