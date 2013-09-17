/* AOJ 0022 Maximum Sum Sequence */

#include <iostream>
#include <algorithm>
#include <climits>

using namespace std;

void update(int i, int x);
void init();

const int MAX_N = 5000;
const int MIN_A = -100000;

int max_sum[MAX_N + 1];

int
main()
{
    for (;;) {
        int n, i;

        cin >> n;
        if (n == 0) break;

        init();
        for (i = 1; i <= n; i++) {
            int a;

            cin >> a;
            update(i, a);
        }

        cout << *max_element(max_sum + 1, max_sum + n + 1) << endl;
    }

    return 0;
}

void
update(int i, int a)
{
    max_sum[i] = max(max_sum[i - 1] + a, a);
}

void
init()
{
    max_sum[0] = 0;
}
