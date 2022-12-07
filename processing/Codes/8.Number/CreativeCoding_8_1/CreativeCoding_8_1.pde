// Creative Coding
// Ren Yuan

void setup() {
  float[] data = {7, 3, 9, 4, 5, 8, 2, 1, 0, 6};
  println("max: " + maxNumber(data)); //9
  println("min: " + minNumber(data)); //0
  println("range: " + range(data)); //9
  println("sum: " + sum(data)); //45
  println("average: " + average(data)); //4.5
  println("variance: " + variance(data)); //8.25
  println("standard deviation: " + standardDeviation(data)); //2.8722813

  float[] data1 = {7, 3, 8, 8, 5, 8, 2, 1, 0, 6};
  println("mode: " + mode(data1)); //8
  float[] data2 = {7, 3, 2, 8, 5, 8, 2, 1, 0, 6};
  println("mode: " + mode(data2)); //8, 2
  float[] data3 = {7, 3, 9, 4, 5, 8, 2, 1, 0, 6};
  println("mode: " + mode(data3)); //null
  String[] data4 = {"A", "B", "O", "AB", "O", "B"};
  println("mode: " + mode(data4)); //"O", "B"

  println("median: " + median(data)); //4.5
  float[] data6 = {3, 4, 5, 2, 1, 0, 6};
  println("median: " + median(data6)); //3
}

float maxNumber(float[] data) {
  float result = data[0];
  for (int i=1; i<data.length; i++) {
    if (data[i]>result) result = data[i];
  }
  return result;
}

float minNumber(float[] data) {
  float result = data[0];
  for (int i=1; i<data.length; i++) {
    if (data[i]<result) result = data[i];
  }
  return result;
}

float range(float[] data) {
  return maxNumber(data) - minNumber(data);
}

float sum(float[] data) {
  float result = 0;
  for (int i=0; i<data.length; i++) {
    result += data[i];
  }
  return result;
}

float average(float[] data) {
  return sum(data)/data.length;
}

float variance(float[] data) {
  float average = average(data);
  float sum = 0;
  for (int i=0; i<data.length; i++) {
    sum += pow(data[i]-average, 2);
  }
  return sum/data.length;
}

float standardDeviation(float[] data) {
  return sqrt(variance(data));
}

FloatList mode(float[] data) {
  FloatList list = new FloatList();
  IntDict dict = new IntDict();
  for (int i=0; i<data.length; i++) {
    dict.add(str(data[i]), 1);
  }
  dict.sortValuesReverse();
  String[] keys = dict.keyArray();
  if (dict.get(keys[0])==dict.get(keys[keys.length-1])) return null;

  list.append(parseFloat(keys[0]));
  int max = dict.get(keys[0]);
  for (int i=1; i<keys.length; i++) {
    if (max==dict.get(keys[i]))list.append(parseFloat(keys[i]));
  }

  return list;
}

StringList mode(String[] data) {
  StringList list = new StringList();
  IntDict dict = new IntDict();
  for (int i=0; i<data.length; i++) {
    dict.add(data[i], 1);
  }
  dict.sortValuesReverse();
  String[] keys = dict.keyArray();
  if (dict.get(keys[0])==dict.get(keys[keys.length-1])) return null;

  list.append(keys[0]);
  int max = dict.get(keys[0]);
  for (int i=1; i<keys.length; i++) {
    if (max==dict.get(keys[i]))list.append(keys[i]);
  }

  return list;
}

float[] bubbleSort(float[] data) {
  float[] result = new float[data.length];
  arrayCopy(data, result);
  for (int i=1; i<result.length; i++) {   
    for (int j=0; j<result.length-i; j++) {   
      if (result[j]>result[j+1]) {
        float temp = result[j];
        result[j] = result[j+1];   
        result[j+1] = temp;
      }
    }
  }
  return result;
}

float median(float[] data) {
  float result = 0;
  float[] array = bubbleSort(data);
  if (array.length%2==0) {
    int i = array.length/2;
    result = (array[i-1]+array[i])/2;
  } else {
    result = array[data.length/2];
  }
  return result;
}
