/* AOJ 0515 School Road */

#include <iostream>
#include <cstring>

using namespace std;

const int MAX_A = 16;
const int MAX_B = 16;

int n_routes[MAX_A + 1][MAX_B + 1];
bool closed[MAX_A + 1][MAX_B + 1];

int a, b;

void setup();
void solve();

int
main()
{
    for (;;) {
        cin >> a >> b;
        if (a == 0 && b == 0) break;

        setup();
        solve();
    }

    return 0;
}

void
setup()
{
    int n_closed;

    memset(n_routes, 0, sizeof n_routes);
    memset(closed, 0, sizeof closed);

    cin >> n_closed;
    while (n_closed--) {
        int i, j;

        cin >> i >> j;
        closed[i][j] = true;
    }
}

void
solve()
{
    int i, j;

    for (i = 1; i <= a; i++) {
        for (j = 1; j <= b; j++) {
            if (i == 1 && j == 1) {
                n_routes[i][j] = 1;
                continue;
            }

            if (closed[i][j]) continue;

            n_routes[i][j] = n_routes[i - 1][j] + n_routes[i][j - 1];
        }
    }

    cout << n_routes[a][b] << endl;
}
