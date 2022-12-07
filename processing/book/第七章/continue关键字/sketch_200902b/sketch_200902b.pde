int count;
count = 0;

while (count < 10) {
  count++;
  if (count == 5) {
    println("运行到了我们需要的数字,触发continue关键字");
    continue;
  }
  println(count);
}
