class Particle {
  float preRadian, radian, radius;
  float w;
  float speed;
  
  Particle(float radian, float radius) {
    this.radian = radian;
    this.radius = radius;
    preRadian = radian;
    w = random(2, 10);
    speed = random(.01, .1);
  }
  
  void update(float rms) {
    preRadian = radian;
    radian += speed * rms * 10;
  }

  void display() {
    stroke(0);
    strokeWeight(w);
    noFill();
    arc(width/2, height/2, radius, radius, preRadian, radian);
  }
}
