/* AOJ 0056 Goldbach's Conjecture */

#include <stdio.h>

void sieve_of_eratosthenes();

#define MAX_N 50000

char is_prime[MAX_N + 1];

int
main()
{
    sieve_of_eratosthenes();

    for (;;) {
        int n, max;
        int n_combinations = 0;
        int i;

        scanf("%d", &n);
        if (n == 0) break;

        max = n / 2;
        for (i = 2; i <= max; i++) {
            if (is_prime[i] && is_prime[n - i]) n_combinations++;
        }

        printf("%d\n", n_combinations);
    }

    return 0;
}

// エラトステネスの篩
void
sieve_of_eratosthenes()
{
    int i;

    is_prime[0] = is_prime[1] = 0;
    for (i = 2; i <= MAX_N; i++)
        is_prime[i] = 1;

    for (i = 2; i <= MAX_N; i++) {
        int j;

        if (!is_prime[i]) continue;

        for (j = 2 * i; j <= MAX_N; j += i)
            is_prime[j] = 0;
    }
}
