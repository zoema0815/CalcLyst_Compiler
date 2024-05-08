int main () {
    Imaginary a;
    Imaginary b;
    a = 3.2i;
    b = 1.3i;
    printImaginary(a);
    printImaginary(b);
    printImaginary(a + b);
    printImaginary(a - b);
    printReal(a * b);
    printReal(a / b);
    return 0;
}