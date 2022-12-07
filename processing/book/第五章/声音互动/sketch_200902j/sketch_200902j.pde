import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(512, 200, P3D);
  minim = new Minim(this);
  player = minim.loadFile("happy.mp3");
  player.play();
}

void draw() {
  background(0);
  for (int i = 0; i<player.bufferSize()-1; i++) {
    int x = (int)map(i,0,player.bufferSize(),0,width); 
    float size = player.left.get(i) * 80;
    float size_stroke = player.right.get(i) * 5;
    fill(255);
    strokeWeight(size_stroke);
    stroke(255,0,0,120);
    ellipse(x,height/2,size,size);
  }
}
