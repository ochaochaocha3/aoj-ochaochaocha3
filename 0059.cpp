/* AOJ 0059 Intersection of Rectangles */

#include <iostream>
#include <algorithm>

using namespace std;

typedef pair<double, double> pdd;

pdd make_sorted_pair(double x, double y);
bool is_overlapped(pdd p1, pdd p2);

int
main()
{
    double xa1, ya1, xa2, ya2, xb1, yb1, xb2, yb2;
    pdd xa, ya, xb, yb;

    for (;;) {
        cin >> xa1 >> ya1 >> xa2 >> ya2 >> xb1 >> yb1 >> xb2 >> yb2;
        if (cin.eof()) break;

        xa = make_sorted_pair(xa1, xa2);
        ya = make_sorted_pair(ya1, ya2);
        xb = make_sorted_pair(xb1, xb2);
        yb = make_sorted_pair(yb1, yb2);

        if (is_overlapped(xa, xb) && is_overlapped(ya, yb))
            cout << "YES" << endl;
        else
            cout << "NO" << endl;
    }

    return 0;
}

pdd
make_sorted_pair(double a, double b)
{
    if (a > b) swap(a, b);
    return pdd(a, b);
}

bool
is_overlapped(pdd p1, pdd p2)
{
    if (p1 > p2) swap(p1, p2);
    return p1.second >= p2.first;
}
