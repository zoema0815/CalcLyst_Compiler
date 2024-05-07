/* The GCD algorithm in MicroC */


int n;
int count;
int gcd(int a, int b) {
  while (a != b) {
    printInt(a + 3);
    if (b < a) a = a - b;
    else b = b - a;
    printInt(a + 1);
  }
  return a;
}

String elseif(int n) {
  String result;
  if (n == 1) {
    result = "I am If";
    return result;
  } elif (n == 2) {
    result = "I am elif";
    return result;
  } else {
    result = "I am else";
    return result;
  }
  return "";
}

int main() {
  int x;
  int y;
  int b;
  Real c;
  Real f;
  bool flag;
  int[2] list;
  list[0] = 1;
  b = 3;
  printInt(list[0]);
  printInt(b);


  return 0;
}
