float x = 50;

void setup(){
  size(500,100);
}

void draw(){
  background(0);
  fill(255,0,0);
  ellipse(x,50,50,50);
  x++;
  if(x > width){
    x = 0;
  }
}
