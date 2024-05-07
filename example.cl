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
  float a;
  int b;
  Real c;
  Real f;
  Imaginary img;
  bool flag;
  String line;
  Complex  p;
  int[2] list;
  x = 2;
  y = 1;
  c = 1.0r;
  img = 2.0i;
  p = img~c;
  list[0] = 1;
  list[1] = 2;
  b = 3;
  a = 0.5;
  line = "------------------------------------";
  /*Library Fuction */
  printString(line);

  printString("             Array Test");
  printString(line);
  printString("Initializing Array of list = {1, 2}");
  printString("list[0] = ");
  printInt(list[0]);
  printString("list[] = ");
  printInt(list[1]);
  
  printString(line);
  printString("        Build-In Function Test");
  printString(line);
  printString("I. Permutation Test  -> P(2, 1) =");
  printInt(permutation(x, y)); /*P(2, 1) = 2*/
  printString("II. Combination Test  -> C(2, 1) =");
  printInt(combination(x, y)); /*C(2, 1) = 2*/
  printString("III. Power Test -> Power(1.5, 2) =");
  printFloat(power(a, x));
  printString("IV. Bionomial Prob Test -> P(n = 2, p = 0.5, r = 2): =");
  printFloat(binomial_probability(x, x, a));
  printString("Complex Number Calculation");
  printString("p = ");
  printComplex(p);
  printString("p + p = ");
  printComplex(p + p);
  printString("p - p = ");
  printComplex(p - p);
  printString("p * p = ");
  printComplex(p * p);
  printString("p / p = ");
  printComplex(p / p);

  
  


  return 0;
}
