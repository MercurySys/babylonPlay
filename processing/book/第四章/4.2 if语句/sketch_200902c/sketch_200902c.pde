float x = 50;
float y = 50;

void setup(){
  size(500,300);
}

void draw(){
  background(0);
  fill(255,0,0);
  ellipse(x,y,50,50);
  x++;
  if(x > width){
    x = 0;
    y+=100;
  }else if(y > height){  
//当小球在纵向运动上超出画布范围时，将其纵向坐标重新设置为50  
    y = 50;
  }
}
