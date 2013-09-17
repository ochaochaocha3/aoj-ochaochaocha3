/* AOJ 0019 Factorial */

#include <iostream>

using namespace std;

int
main()
{
    int n, i;
    long factorial = 1;

    cin >> n;

    for (i = 1; i <= n; i++)
        factorial *= i;

    cout << factorial << endl;

    return 0;
}
