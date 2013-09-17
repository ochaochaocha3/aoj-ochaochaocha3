/* AOJ 0070 Combination of Number Sequences */

#include <iostream>

using namespace std;

void set_count(int n, int sum, int used);

const int MAX_N = 10;
const int MAX_SUM = 330;

int count_s[MAX_N + 1][MAX_SUM + 1];

int
main()
{
    int n, s;

    set_count(1, 0, 0);

    while (cin) {
        cin >> n >> s;
        if (cin.eof()) break;

        if (1 <= n && n <= 10 && 0 <= s && s <= 330)
            cout << count_s[n][s] << endl;
        else
            cout << 0 << endl;
    }

    return 0;
}

void
set_count(int depth, int sum, int used)
{
    int new_sum;
    int i, used_i;

    for (i = 0; i < 10; i++) {
        used_i = 1 << i;
        if (used & used_i) continue;

        new_sum = sum + depth * i;
        count_s[depth][new_sum] += 1;

        if (depth < MAX_N)
            set_count(depth + 1, new_sum, used | used_i);
    }
}
