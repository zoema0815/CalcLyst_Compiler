int main () {
    Real c;
    Imaginary d;
    Complex z;
    Real test_real;
    c = 3.7r;
    d = 3.2i;
    z = d~c;
    test_real = z; /* Invalid to assign a real as a complex number */
    return 0;
}