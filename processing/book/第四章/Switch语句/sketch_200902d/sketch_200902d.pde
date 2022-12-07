void setup() {
size(500, 500);
}

void draw() {
background(0);

switch(key) {
//当键盘按下a的时候，在坐标（100,100）的位置绘制一个红色圆形
case 'a':
fill(255, 0, 0);
ellipse(100, 100, 50, 50);
//千万不要忘记break关键字
break;
case 'b':
fill(0, 255, 0);
ellipse(200, 200, 50, 50);
break;

case 'c':
fill(0, 0, 255);
ellipse(300, 300, 50, 50);
break;

default:
textAlign(CENTER);
textSize(48);
fill(255);
text("Welcome",width/2, height/2);
}
}
