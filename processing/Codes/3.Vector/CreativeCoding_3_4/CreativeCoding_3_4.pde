// Creative Coding
// Ren Yuan

import processing.pdf.*;
void setup() {
  String filename = this.getClass().getName();
  beginRecord(PDF, filename + ".pdf");
  size(1000, 1000);
  ellipseMode(RADIUS);
  rectMode(CORNERS);
  background(255);
  stroke(0);
  noFill();
  render();
  endRecord();
  saveFrame(filename + ".jpg");
}

void render() {
  Particle[] particles = new Particle[1000];
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }

  Attractor[] attractors = new Attractor[4];
  for (int i=0; i<attractors.length; i++) {
    float x = random(width);
    float y = random(height);
    float magnitude = random(-1, 1);
    attractors[i] = new Attractor(x, y, magnitude);
  }

  for (int time=0; time<1000; time++) {
    for (Particle p : particles) {
      for (int i=0; i<attractors.length; i++) {
        Vector force = attractors[i].force(p.position);
        p.apply(force);
      }
      p.update();
      p.display();
    }
  }
}
