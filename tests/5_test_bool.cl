int main () {
    bool true_flag;
    bool false_flag;
    true_flag = true;
    false_flag = false;
    if (true_flag) {
        printString("True flag correctly set.");
    } else {
        printString("True flag incorrectly set.");
    }
    if (false_flag) {
        printString("False flag incorrectly set.");
    } else {
        printString("False flag correctly set.");
    }
    printString("All flags are correctly set.");
    return 0;

}