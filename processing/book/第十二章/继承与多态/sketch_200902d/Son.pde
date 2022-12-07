class Son extends Father {
  public int age;

  Son(int age) {
    super(age);       //向父类构造函数传递参数
    println("调用了子类的构造函数！");
  }

  protected void setAge(int age) {
    this.age = age;
    println("儿子的年龄设定完毕！");
    println("儿子的年龄为：" + age);
//设置儿子的年龄时候，给父亲的年龄重新设置为78
    super.setAge(78);    
}

  public int getAge() {
    int fatherAge = super.getAge();
    return fatherAge;
  }
}
