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

int fibonacci(int n) {
    int g;
    int h;
    int i;
    int count;
    if (n <= 1) return n;
    else {}

    count = 2;
    g = 0;
    h = 1;
    i = 0;
    while (count <= n) {
      i = g + h; 
      g = h;     
      h = i; 
      count = count + 1;  
    }
    return h;
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
  Imaginary d;
  Imaginary g;
  Complex z;
  Complex w;
  c = 3.7r;
  f = 2.5r;
  d = 3.2i;
  g = 1.42i;
  z = d~c;
  w = 5.2@2.8i;
  x = 5;
  y = 3;
  b = x / y;
  permutation(1,2);
  printComplex(z);
  printReal(c/f);
  printReal(d*g);
  printComplex(z/w);
  printInt(permutation(6, 3));
  return 0;
}
