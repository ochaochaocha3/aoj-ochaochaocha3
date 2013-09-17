/* AOJ 0002 Digit Number */

#include <stdio.h>

int
main(void)
{
    int a, b, sum;
    int n_digits;

    while (scanf("%d %d", &a, &b) == 2) {
        sum = a + b;
        n_digits = 0;

        while (sum > 0) {
            n_digits++;
            sum /= 10;
        }

        printf("%d\n", n_digits);
    }

    return 0;
}
