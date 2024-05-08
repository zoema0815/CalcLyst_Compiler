int gcd(int a, int b) {
  while (a != b) {
    printInt(a + 3);
    if (b < a) a = a - b;
    else b = b - a;
  }
  return a;
}

int main () {
    int a;
    int b;
    int ans;
    a = 2;
    b = 3;
    ans = gcd(a, b);
    printInt(ans);
    return 0;
}