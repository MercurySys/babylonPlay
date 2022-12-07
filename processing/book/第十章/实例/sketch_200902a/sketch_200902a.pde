Rectangle [][] r_array;
int [] x_pos;
int [] y_pos;
int array_leng_x, array_leng_y;
int radius;
int x_step;
int y_step;
PImage img;
int img_leng_x, img_leng_y;


void setup() {
  size(1080, 720, P3D);
  radius = 20;
  array_leng_x = 1080 / radius;
  array_leng_y = 720 / radius;
  x_step = radius/2;
  y_step = radius/2;
  r_array  = new Rectangle[array_leng_x][array_leng_y];
  x_pos = new int[array_leng_x];
  y_pos = new int[array_leng_y];
  
  initialize();
  img = loadImage("mnls.jpg");
  img_leng_x = img.width;
  img_leng_y = img.height;
  println("图片或视频像素比为：" + img.width + ":" + img.height);
}

void draw() {
  process_pixels();
  for (int x = 0; x < x_pos.length; x++) {
    for (int y= 0; y < y_pos.length; y++) {
      r_array[x][y].all_set();
    }
  }
}

void process_pixels() {
  try {
    img.loadPixels();
    color c_ = img.pixels[mouseX/radius + mouseY/radius * img.width];
    for (int x = 0; x < x_pos.length; x++) {
      for (int y= 0; y < y_pos.length; y++) {
        r_array[x][y].clr = c_;
      }
    }
    img.updatePixels();
  }
  catch(ArrayIndexOutOfBoundsException e) {
    println(e);
    println("请把鼠标移至对话框内！");
  }
}

void initialize() {
  for (int ix = 0; ix < x_pos.length; ix++) {
    x_pos[ix] = x_step;
    x_step += radius;
    //println("x_pos [" + ix + "] :" + x_pos[ix]);
  }

  println("X轴向数据已经生成完毕！");
  for (int iy = 0; iy < y_pos.length; iy++) {
    y_pos[iy] = y_step;
    y_step += radius;
    //println("y_pos [" + iy + "] :" + y_pos[iy]);
  }

  println("Y轴向数据已经生成完毕！");
  println("开始将参数注入方形对象数组矩阵....");

  for (int x = 0; x < x_pos.length; x++) {
    for (int y= 0; y < y_pos.length; y++) {
      r_array[x][y] = new Rectangle(x_pos[x], y_pos[y], color(255), radius);
    }
  }
  println("数据注入成功！");
}
