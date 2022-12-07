import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(512, 200,P3D);
  minim = new Minim(this);
  player = minim.loadFile("happy.mp3");
  player.play();
}

void draw() {
}
