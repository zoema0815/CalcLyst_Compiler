int main() {
    int[2] int_list;
    float[2] flt_list;
    int_list[0] = 4;
    int_list[1] = 2;
    flt_list[0] = 2.3;
    flt_list[1] = 4.67;
    printInt(int_list[0]);
    printInt(int_list[1]);
    printInt(int_list[0] + int_list[1]);
    printInt(int_list[0] - int_list[1]);
    printInt(int_list[0] * int_list[1]);
    printInt(int_list[0] / int_list[1]);
    printFloat(flt_list[0]);
    printFloat(flt_list[1]);
    printFloat(flt_list[0] + flt_list[1]);
    printFloat(flt_list[0] + flt_list[1]);
    printFloat(flt_list[0] * flt_list[1]);
    printFloat(flt_list[0] / flt_list[1]);
    return 0;
}