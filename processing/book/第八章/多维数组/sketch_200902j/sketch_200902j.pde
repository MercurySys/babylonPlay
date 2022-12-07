int [][][][] four= new int [2][3][4][5];
for (int i = 0; i < four.length; i++) {
  for (int j = 0; j < four[1].length; j++) {
    for (int k = 0; k < four[1].length; k++) {
      for (int l = 0; l < four[1].length; l++) {
        four[i][j][k][l] = (int)random(50, 101);
        println("第一维度的第"+(i+1)+"组");
        println("第二维度的第"+(j+1)+"组");
        println("第三维度的第"+(k+1)+"组");
        println("第四维度的第"+(l+1)+"组");
        println("产生的随机值为："+four[i][j][k][l]);
      }
    }
  }
}
