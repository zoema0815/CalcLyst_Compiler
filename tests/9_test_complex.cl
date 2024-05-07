int main () {
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
    printComplex(z);
    printComplex(z/w);
    printComplex(z*w);
    printComplex(z+w);
    printComplex(z-w);
    return 0;
}