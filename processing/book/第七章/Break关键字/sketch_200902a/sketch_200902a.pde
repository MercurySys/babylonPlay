int number;

void setup() {
  number = 0;
}

void draw() {
  while (number < 1000) {
    println(number);
    if (number == 50) {
      noLoop();     //停止draw函数执行
      break;
    }
    number++;
  }
}
