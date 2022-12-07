// Creative Coding
// Ren Yuan

String filename;
import processing.sound.*;
AudioIn audio;
FFT fft;
float[] spectrum = new float[32];
VisualLine[] lines;

void setup() {
  filename = this.getClass().getName();
  size(1000, 1000);
  audio = new AudioIn(this, 0);
  audio.start();
  fft = new FFT(this, spectrum.length);
  fft.input(audio);
  background(255);

  lines = new VisualLine[spectrum.length];
  for (int i=0; i<lines.length; i++) {
    Point p1 = new Point(random(width), random(height));
    Point p2 = new Point(random(width), random(height));
    lines[i] = new VisualLine(p1, p2, 1, color(0, 10));
  }
}

void draw() {
  fft.analyze(spectrum);

  for (int i=0; i<lines.length; i++) {
    VisualLine l1 = lines[i];
    VisualLine l2 = lines[(i+1)%lines.length];
    float radian = spectrum[i];
    l1.p1.rotate(l1.p2, radian);
    l1.p2.rotate(l2.p1, radian);
    if(spectrum[i]>.001) lines[i].display();
  }
}

void keyPressed() {
  saveFrame(filename + ".jpg");
}
