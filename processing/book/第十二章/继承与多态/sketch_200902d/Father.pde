class Father {
  private int age;

  Father(int age) {
    this.age = age;
    println("调用了父类的构造函数！");
  }

  protected void setAge(int age) {
    this.age = age;
println("父亲的年龄设定完毕！");
println("父亲的年龄为：" + this.age);
  }

  public int getAge() {
    return this.age;
  }
}
