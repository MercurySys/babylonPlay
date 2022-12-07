float [][] scores;

void setup() {
  scores = new float [5][50];
  for (int i = 0; i < scores.length; i++) {
    for (int j = 0; j < scores[1].length; j++) {
      scores[i][j] = random(50, 101);
    }
  }
}

void draw() {
  for (int i = 0; i < scores.length; i++) {
    for (int j = 0; j < scores[1].length; j++) {
      println("第"+(i+1)+"个班级的第"+(j+1)+"名同学的成绩为："+scores[i][j]);
    }
  }
  noLoop();
}
