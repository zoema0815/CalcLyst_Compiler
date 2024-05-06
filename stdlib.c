
/*
 *  Standard library functions in C for YAGL language
 */

#include <stdio.h>
#include <fcntl.h>    /* For O_RDWR */
#include <unistd.h>   /* For open(), creat() */
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

int check_null(void *x) {
	int nullfd = open("/dev/random", O_WRONLY);
	if (!(write(nullfd, x, 1) < 0))
		return 1;
	return 0;
}

int permutation(int n, int c) {
    if (c > n) {
        return 0; 
    }
    int perm = 1;
    for (int i = 0; i < c; i++) {
        perm *= (n - i);
    }
    return perm;
}

int combination(int n, int r) {
    if (r > n) {
        return 0;
    }
    int comb = permutation(n, r);
    int fact = 1;
    for (int i = 1; i <= r; i++) {
        fact *= i;
    }
    return comb / fact;
}

int factorial(int n) {
    int fact = 1;
    for (int i = 1; i <= n; i++) {
        fact *= i;
    }
    return fact;
}

int fibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    int a = 0, b = 1, fib = 0;
    for (int i = 2; i <= n; i++) {
        fib = a + b;
        a = b;
        b = fib;
    }
    return fib;
}

char *sconcat(char *s1, char *s2) {
	char *s3 = malloc(strlen(s1) + strlen(s2) + 1);
	strcpy(s3, s1);
	strcat(s3, s2);
	return s3;
}

char *computeReal(char *s1, char *s2, char * op) {
	char *b1 = malloc(strlen(s1) - 1);
	strncpy(b1, s1, strlen(s1) - 1);
	char *b2 = malloc(strlen(s2) - 1);
	strncpy(b2, s2, strlen(s2) - 1);
	float c1 = atof(b1);
	float c2 = atof(b2);
	float result;
	if (strcmp(op, "Add") == 0) {
		result = c1 + c2;
	} else if (strcmp(op, "Sub") == 0) {
		result = c1 - c2;
	} else if (strcmp(op, "Mul") == 0) {
		result = c1 * c2;
	} else if (strcmp(op, "Div") == 0) {
		result = c1 / c2;
	}
	int len = snprintf(NULL, 0, "%f", result);
	char *r = malloc(len + 2);
	char *s = "r";
	snprintf(r, len + 1, "%f", result);
	strcat(r, s);
	return r;
}

char *computeImaginary(char *s1, char *s2, char * op) {
	char *b1 = malloc(strlen(s1) - 1);
	strncpy(b1, s1, strlen(s1) - 1);
	char *b2 = malloc(strlen(s2) - 1);
	strncpy(b2, s2, strlen(s2) - 1);
	float c1 = atof(b1);
	float c2 = atof(b2);
	float result;
	if (strcmp(op, "Add") == 0) {
		result = c1 + c2;
	} else if (strcmp(op, "Sub") == 0) {
		result = c1 - c2;
	} else if (strcmp(op, "Mul") == 0) {
		result = -c1 * c2;
	} else if (strcmp(op, "Div") == 0) {
		result = c1 / c2;
	}
	int len = snprintf(NULL, 0, "%f", result);
	if (strcmp(op, "Div") == 0 || strcmp(op, "Mul") == 0) {
		char *r = malloc(len + 2);
		snprintf(r, len + 1, "%f", result);
		char *s = "r";
		strcat(r, s);
		return r;
	}
	char *r = malloc(len + 2);
	char *s = "i";
	snprintf(r, len + 1, "%f", result);
	strcat(r, s);
	return r;
}

char *computeComplex(char *s1, char *s2, char * op) {//a+bi, c+di
	char *s1_copy = strdup(s1);
    char *s2_copy = strdup(s2);
	char *p1 = strtok(s1_copy, "@");
	char *b = strtok(NULL, "@");
	char *b1 = malloc(strlen(b) - 1);
    strncpy(b1, b, strlen(b) - 1);
	char *p2 = strtok(s2_copy, "@");
	b = strtok(NULL, "@");
	char *b2 = malloc(strlen(b) - 1);
	strncpy(b2, b, strlen(b) - 1);

	float c11 = atof(p1); //a
	float c21 = atof(p2); //c
	float c12 = atof(b1); //b
	float c22 = atof(b2); //d
	float result1, result2;

	if (strcmp(op, "Add") == 0) {
		result1 = c11 + c21;
		result2 = c12 + c22;
	} else if (strcmp(op, "Sub") == 0) {
		result1 = c11 - c21;
		result2 = c12 - c22;
	} else if (strcmp(op, "Mul") == 0) {
		result1 = c11 * c21 - c12 * c22;
		result2 = c11 * c22 - c21 * c12;
	} else if (strcmp(op, "Div") == 0) {
		result1 = (c11 * c21 + c12* c22)/(c21*c21 + c22*c22);
		result2 = (c12 * c21 - c11 * c22)/(c21*c21 + c22*c22);
	}
	int len1 = snprintf(NULL, 0, "%f", result1);
	int len2 = snprintf(NULL, 0, "%f", result2);
	char *r = malloc(len1 + len2 + 3);
	char *r2 = malloc(len2);
	char *s = "@";
	char *ss = "i";
	snprintf(r, len1, "%f", result1);
	strcat(r, s);
	snprintf(r2, len2, "%f", result2);
	strcat(r, r2);
	strcat(r, ss);
	return r;
}


char *compose(char *s1, char *s2) {
	char *s3 = malloc(strlen(s1) + strlen(s2) + 1);
	char *s = "@";
	strncpy(s3, s1, strlen(s1) - 1);
	strcat(s3, s);
	strcat(s3, s2);
	return s3;
}

#ifdef BUILD_TEST
int main()
{
	return 0;
}
#endif
