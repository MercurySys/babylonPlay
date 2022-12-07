// Creative Coding
// Ren Yuan

String filename;
import processing.sound.*;
AudioIn audio;
FFT fft;
float[] spectrum = new float[256];
Particle[] particles;

void setup() {
  filename = this.getClass().getName();
  
  size(1000, 1000);
  audio = new AudioIn(this, 0);
  audio.start();
  fft = new FFT(this, spectrum.length);
  fft.input(audio);
  background(255);
  
  particles = new Particle[spectrum.length];
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  
  fft.analyze(spectrum);

  for (int i=0; i<particles.length; i++) {
    particles[i].update(spectrum[i]);
    particles[i].display();
  }
}

void keyPressed() {
  saveFrame(filename + ".jpg");
}
