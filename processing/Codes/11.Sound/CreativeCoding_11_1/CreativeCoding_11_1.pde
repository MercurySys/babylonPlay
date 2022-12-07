// Creative Coding
// Ren Yuan

String filename;
import processing.sound.*;
AudioIn audio;
Amplitude amp;

void setup() {
  filename = this.getClass().getName();
  
  size(1000, 1000);
  audio = new AudioIn(this, 0);
  audio.start();
  amp = new Amplitude(this);
  amp.input(audio);
  background(255);
}

void draw() {
  float rms = amp.analyze();
  float radius = map(rms, 0, 1, 0, 5000);
  noStroke();
  fill(0, 10);
  ellipse(width/2, height/2, radius, radius);
}

void keyPressed() {
  saveFrame(filename + ".jpg");
}
