void show(){
  println("我是show函数");
}

void show(int i){
  println("我是show函数的重载函数,并且带有参数，值为：" + i);
}

void show(float i,int j){
  println("我是show函数的重载函数,带有两个参数，和为：" + (i+j));
}

void show(int i,float j){
  println("我是show函数的重载函数,参数顺序不同，和为：" + (i+j));
}
