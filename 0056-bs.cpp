/* AOJ 0056 Goldbach's Conjecture */

#include <iostream>
#include <algorithm>
#include <cmath>
#include <vector>

using namespace std;

void init_primes();
int goldbach_partition(int n);
vector<int>::iterator get_prime_nearest_to(int n);
vector<int>::iterator get_biggest_prime_less_than(int n);

const int MAX_N = 50000;
// n = 10000 での PI(x) / (x / log x) の値
const double APPROX_RATIO = 1.132;

bool is_prime[MAX_N + 1];
vector<int> primes;

int
main()
{
    init_primes();

    for (;;) {
        int n;

        cin >> n;
        if (n == 0) break;

        cout << goldbach_partition(n) << endl;
    }

    return 0;
}

// 素数配列の初期化を行う
void
init_primes()
{
    int capacity;
    int i;

    is_prime[0] = is_prime[1] = false;
    fill(is_prime, is_prime + MAX_N + 1, true);

    // エラトステネスの篩
    for (i = 2; i <= MAX_N; i++) {
        int j;

        if (!is_prime[i]) continue;

        j = 2 * i;
        while (j <= MAX_N) {
            is_prime[j] = false;
            j += i;
        }
    }

    // 素数定理で素数の個数を予想し、vector の領域を予め確保する
    capacity = (int)(APPROX_RATIO * MAX_N / log(MAX_N));
    primes.reserve(capacity);

    for (i = 2; i <= MAX_N; i++) {
        if (is_prime[i]) primes.push_back(i);
    }
}

// ゴールドバッハ分割の個数を返す
int
goldbach_partition(int n)
{
    int result;

    if (n > 50000) {
        cerr << "n is too big" << endl;
        result = 0;
    } else if (n < 4) {
        result = 0;
    } else if (n % 2 == 1) {
        // n が奇数の場合、n = 2 + (素数 n - 2) と表せるかどうか
        result = is_prime[n - 2] ? 1 : 0;
    } else {
        result = 0;
        vector<int>::iterator mid_it = get_prime_nearest_to(n / 2);
        vector<int>::iterator end_it = get_biggest_prime_less_than(n) + 1;
        vector<int>::iterator it;

        for (it = mid_it; it != end_it; ++it) {
            int p1 = *it;
            int p2 = n - p1;

            if (binary_search(primes.begin(), end_it, p2)) result++;
        }
    }

    return result;
}

// n 以上の n に最も近い素数を表すイテレータを返す。
// 二分探索。
vector<int>::iterator
get_prime_nearest_to(int n)
{
    int head = 0;
    int tail = primes.size() - 1;
    vector<int>::iterator it;

    if (n > primes.back()) {
        it = primes.end() - 1;
    } else {
        for (;;) {
            int pos = (head + tail) / 2;

            if (primes[pos] == n) {
                it = primes.begin() + pos;
                break;
            } else if (primes[pos] > n && primes[pos - 1] < n) {
                it = primes.begin() + pos;
                break;
            } else if (primes[pos] > n) {
                tail = pos - 1;
            } else {
                head = pos + 1;
            }
        }
    }

    return it;
}

// n 未満の最大の素数を表すイテレータを返す。
// 二分探索。
vector<int>::iterator
get_biggest_prime_less_than(int n)
{
    int head = 0;
    int tail = primes.size() - 1;
    vector<int>::iterator it;

    if (n > primes.back()) {
        it = primes.end() - 1;
    } else {
        for (;;) {
            int pos = (head + tail) / 2;

            if (primes[pos] == n) {
                it = primes.begin() + pos - 1;
                break;
            } else if (primes[pos] > n && primes[pos - 1] < n) {
                it = primes.begin() + pos - 1;
                break;
            } else if (primes[pos] > n) {
                tail = pos - 1;
            } else {
                head = pos + 1;
            }
        }
    }

    return it;
}
