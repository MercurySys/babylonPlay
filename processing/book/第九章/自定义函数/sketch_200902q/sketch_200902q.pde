MyClass t;
PFont f;

void setup() {
  size(200, 200);
t = new MyClass();
  t = haveATry(t);
  println("MyClass类的对象t的id属性的值被修改为:" + t.id);
println("MyClass类的对象t的name属性的值被修改为" + t.name);
  f = loadFont("AgencyFB-Reg-48.vlw");
}

void draw() {
  textFont(f);
textAlign(CENTER,TOP);
  fill(#3E5CFF);
  text("id：" + str(t.id), 50, 75, 100, 100);
text(t.name, 50, 0, 100, 100);
}

class MyClass {
  public int id = 10;
public String name = "Tony";
}

MyClass haveATry(MyClass t) {
    t.id+=1;
t.name = "Disney";
return t;
}
