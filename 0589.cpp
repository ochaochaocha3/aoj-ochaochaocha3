/* AOJ 0589 Production */

#include <iostream>
#include <string>
#include <algorithm>
#include <map>
#include <vector>

using namespace std;

bool compare_product_name(string a, string b);
void map_test();

typedef bool (*pname_comparator)(string, string);
typedef map<string, int, pname_comparator> mapp;

int
main()
{
    int n;
    mapp production(compare_product_name);
    mapp::iterator it;

    cin >> n;
    cin.ignore();
    while (n--) {
        string line, name;
        int p;
        int delim_pos;

        getline(cin, line);

        delim_pos = line.find_first_of(' ');
        name = line.substr(0, delim_pos);
        p = atoi(line.substr(delim_pos + 1).data());

        if (production.find(name) == production.end())
            production[name] = p;
        else
            production[name] += p;
    }

    for (it = production.begin(); it != production.end(); ++it)
        cout << it->first << ' ' << it->second << endl;

    return 0;
}

bool
compare_product_name(string a, string b)
{
    size_t len_a = a.size();
    size_t len_b = b.size();
    size_t min_len = min(len_a, len_b);
    size_t i;

    if (len_a != len_b)
        return len_a < len_b;

    for (i = 0; i < min_len; i++) {
        if (a[i] != b[i])
            return a[i] < b[i];
    }

    // a == b なので a < b ではない
    return false;
}
