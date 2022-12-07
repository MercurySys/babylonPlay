int [] id;

void setup() {
id = new int[5];
  id[0] = 15;
  id[1] = 52;
  id[2] = 37;
  id[3] = 40;
  id[4] = 88;
int [] result = getArray(id);
  println(result);
}

void draw() {
}

int [] getArray(int [] s) {
for (int i = 0;i < s.length;i++) {
    s[i] += 1;
  }
  return s;
}
