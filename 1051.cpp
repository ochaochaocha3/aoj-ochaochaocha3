/* AOJ 1051 Citation Format */

#include <iostream>

using namespace std;

typedef pair<int, int> pii;

void citation_format(int n_pages);
void print_range(pii range);

const int MAX_N = 50;

int
main()
{
    for (;;) {
        int n_pages;

        cin >> n_pages;
        if (n_pages == 0) break;

        citation_format(n_pages);
    }

    return 0;
}

void
citation_format(int n_pages)
{
    pii ranges[MAX_N + 1];
    int n_ranges = 0;
    int i;

    ranges[0] = pii(-1, -1);

    while (n_pages--) {
        int page;

        cin >> page;

        if (page > ranges[n_ranges].second + 1) {
            n_ranges++;
            ranges[n_ranges] = pii(page, page);
        } else {
            ranges[n_ranges].second = page;
        }
    }

    print_range(ranges[1]);
    for (i = 2; i <= n_ranges; i++) {
        cout << ' ';
        print_range(ranges[i]);
    }
    cout << endl;
}

void
print_range(pii range)
{
    if (range.first == range.second)
        cout << range.first;
    else
        cout << range.first << '-' << range.second;
}
