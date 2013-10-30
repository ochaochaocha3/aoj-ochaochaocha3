/* AOJ 0056 Goldbach's Conjecture */

#include <iostream>

using namespace std;

void sieve_of_eratosthenes();

const int MAX_N = 50000;

bool is_prime[MAX_N + 1];

int
main()
{
    sieve_of_eratosthenes();

    for (;;) {
        int n, max;
        int n_combinations = 0;
        int i;

        cin >> n;
        if (n == 0) break;

        max = n / 2;
        for (i = 2; i <= max; i++) {
            if (is_prime[i] && is_prime[n - i]) n_combinations++;
        }

        cout << n_combinations << endl;
    }

    return 0;
}

// エラトステネスの篩
void
sieve_of_eratosthenes()
{
    int i;

    is_prime[0] = is_prime[1] = false;
    fill(is_prime, is_prime + MAX_N + 1, true);

    for (i = 2; i <= MAX_N; i++) {
        int j;

        if (!is_prime[i]) continue;

        j = 2 * i;
        while (j <= MAX_N) {
            is_prime[j] = false;
            j += i;
        }
    }
}
