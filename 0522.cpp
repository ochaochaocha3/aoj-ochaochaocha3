/* AOJ 0522 JOI and IOI */

#include <iostream>
#include <string>

using namespace std;

int
main() {
    for (;;) {
        string s;
        int len;
        int n_joi = 0;
        int n_ioi = 0;
        int i;

        getline(cin, s);
        if (cin.eof()) break;

        len = s.size();

        for (i = 0; i < len - 2; i++) {
            if (s[i] == 'J' && s[i + 1] == 'O' && s[i + 2] == 'I') {
                n_joi++;
                i++;
            } else if (s[i] == 'I' && s[i + 1] == 'O' && s[i + 2] == 'I') {
                n_ioi++;
                i++;
            }
        }

        cout << n_joi << '\n' << n_ioi << endl;
    }

    return 0;
}
