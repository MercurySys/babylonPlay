PImage img;

void setup() {
  size(535, 300);                        //与图片像素大小一致
  img = loadImage("swim.png");
  image(img, 0, 0,535,300);             //显示图片
  int [][] readValues = new int [img.width][img.height];
  for (int i = 0; i<img.width; i++) {
    for (int j = 0; j<img.height; j++) {
      readValues[i][j] = img.get(i, j);
//分离出各个像素点的R通道数值
      float red = red(readValues[i][j]);   
//分离出各个像素点的G通道数值        
      float green = green(readValues[i][j]); 
//分离出各个像素点的B通道数值
      float blue = blue(readValues[i][j]);  
//分离出各个像素点的A通道数值
      float alpha = alpha(readValues[i][j]); 
      println("正在打印第" + i + "列" + "第" + j + "行红色数值: " + red);
      println("正在打印第" + i + "列" + "第" + j + "行绿色数值: " + green);
      println("正在打印第" + i + "列" + "第" + j + "行蓝色数值: " + blue);
      println("正在打印第" + i + "列" + "第" + j + "行透明蓝色数值: " + alpha);
    }
  }
}

void draw() {
}
