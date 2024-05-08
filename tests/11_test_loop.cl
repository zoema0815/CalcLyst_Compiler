int main () {
    int a;
    int b;
    a = 2;
    b = 3;
    while (a != b) {
        printInt(a + 3);
        if (b < a) a = a - b;
        else b = b - a;
        printInt(a + 1);
    }
    printInt(a);
    return 0;
}