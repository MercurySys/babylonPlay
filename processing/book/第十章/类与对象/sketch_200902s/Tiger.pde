class Tiger {
  public String name;
  public String address;
  public String neckletColor;
  public String furColor;
  public String gender;
  public boolean isStrong;
  public String detailOfEyes;
  public String detailOfteeth;

  Tiger(String name, String address, String neck, String furColor, String gender, boolean isStrong, String eyes, String teeth) {
    this.name = name;
    this.address = address;
    this.neckletColor = neck;
    this.furColor = furColor;
    this.gender = gender;
    this.isStrong = isStrong;
    this.detailOfEyes = eyes;
    this.detailOfteeth = teeth;
  }
  
    Tiger(String name, String address, String neck) {
    this.name = name;
    this.address = address;
    this.neckletColor = neck;
    this.furColor = "黄黑色的毛";
    this.gender = "雄性";
    this.isStrong = true;
    this.detailOfEyes = "炯炯有神";
    this.detailOfteeth = "锋利异常";
  }

  public void showInfo() {
    println("东北虎的名字是 " + this.name);
    println("它住在" + this.address);
    println("它的项圈是" + this.neckletColor);
    println("它的毛色是" + this.furColor);
    println("它的性别是" + this.gender);
    if (isStrong) {
      println(this.name + "特别的强壮");
    } else {
      println(this.name + "一点也不强壮");
    }
    println("它有着" + this.detailOfEyes);
    println("它有着" + this.detailOfteeth);
  }
}
