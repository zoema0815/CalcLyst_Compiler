#include <stdio.h>

int permutation(int n, int r) {
    int perm = 1;
    for (int i = 0; i < r; i++) {
        perm *= n - i;
    }
    return perm;
}

int combination(int n, int r) {
    int perm = permutation(n, r);
    int factorial = 1;
    for (int i = 1; i <= r; i++) {
        factorial *= i;
    }
    return perm / factorial;
}

double power(double base, int exponent) {
    double result = 1.0;
    if (exponent < 0) {
        base = 1.0 / base;
        exponent = -exponent;
    }
    while (exponent > 0) {
        if (exponent % 2 == 1) {
            result *= base;
        }
        base *= base;
        exponent /= 2;
    }
    return result;
}

double binomial_probability(int n, int k, double p) {
    double q = 1 - p;
    int comb = combination(n, k);
    double prob = comb * power(p, k) * power(q, n - k);
    return prob;
}

int main() {
    int n = 10;  // Number of trials
    int k = 3;   // Number of successes
    double p = 0.5; // Probability of success on a single trial

    double prob = binomial_probability(n, k, p);
    printf("Probability of 3 successes in 10 trials: %f\n", prob);

    return 0;
}


