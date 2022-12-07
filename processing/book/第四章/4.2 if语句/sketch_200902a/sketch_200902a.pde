float scores = random(50,101);
println("随机产生的分数为：" + scores);

if(scores >= 90){
  println("成绩为优秀");
}
if(scores >= 80 && scores <= 89){
  println("成绩为良");
}
if(scores >= 70 && scores <= 79){
  println("成绩为中");
}
if(scores >= 60 && scores <= 69){
  println("成绩为差");
}
if(scores < 60){
  println("成绩为不及格");
}
