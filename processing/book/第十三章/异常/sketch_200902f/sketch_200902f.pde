 TestException e;

void setup() {
  e = new TestException();
  try {
    e.makeException();
  }
  catch(Exception e) {
    println(e);
    println("捕获到异常并解决，程序依旧可以运行！");
  }
}


void draw() {
  background(0);
  fill(255);
  ellipse(width/2, height/2, 50, 50);
}
