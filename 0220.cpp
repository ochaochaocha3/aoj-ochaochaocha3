/* AOJ 0220 Binary Digit A Doctor Loved */

#include <iostream>

using namespace std;

void print_binary_digits(double x);

int
main()
{
    for (;;) {
        double x;

        cin >> x;
        if (x < 0) break;

        print_binary_digits(x);
    }

    return 0;
}

void
print_binary_digits(double x)
{
    int x_i = (int)x;
    double x_f = x - x_i;
    int digits[12] = {0};
    double b = 0.5;
    int i;

    try {
        // 整数部分
        for (i = 0; i < 8 && x_i > 0; i++) {
            digits[7 - i] = x_i & 1;
            x_i >>= 1;
        }
        if (x_i) throw 0;

        // 小数部分
        for (i = 0; i < 4 && x_f > 0; i++) {
            if (x_f >= b) {
                digits[8 + i] = 1;
                x_f -= b;
            }

            b /= 2;
        }
        if (x_f) throw 0;

        for (i = 0; i < 8; i++)
            cout << digits[i];
        cout << '.';
        for (i = 8; i < 12; i++)
            cout << digits[i];

        cout << endl;
    } catch (...) {
        cout << "NA" << endl;
    }
}
