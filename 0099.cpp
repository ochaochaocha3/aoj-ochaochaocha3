/* AOJ 0099 Surf Smelt Fishing Contest II */

#include <iostream>
#include <climits>

using namespace std;

const int MAX_N = 1 << 20;
int dat[2 * MAX_N - 1]; // 各節点に最大値を持つセグメント木
int n, n_dat, q;

void dat_init();
void dat_set(int i, int x);
void dat_add(int i, int x);
bool dat_is_leaf(int i);
pair<int, int> dat_max();

int
main()
{
    cin >> n >> q;
    dat_init();

    while (q--) {
        int a, v;
        pair<int, int> m;

        cin >> a >> v;
        // 0-indexed にする
        a--;

        dat_add(a, v);

        // 獲得数が最も多い参加者の番号とその獲得数を出力する
        m = dat_max();
        cout << m.first + 1 << " " << m.second << endl;
    }

    return 0;
}

// セグメント木の初期化
void
dat_init()
{
    int i;

    // 簡単のため、要素数を 2 の冪乗にする
    n_dat = 1;
    while (n_dat < n) n_dat *= 2;

    // 値の初期化
    for (i = 0; i < 2 * n_dat - 1; i++) dat[i] = INT_MIN;
    for (i = 0; i < n; i++) dat_set(i, 0);
}

// i 番目の値を x にする
void
dat_set(int i, int x)
{
    // 葉の節点
    i += n_dat - 1;
    dat[i] = x;

    // 登りながら更新
    while (i > 0) {
        i = (i - 1) / 2;
        dat[i] = max(dat[2 * i + 1], dat[2 * i + 2]);
    }
}

// i 番目の値に x を加算する
void
dat_add(int i, int x)
{
    // 葉の節点
    i += n_dat - 1;
    dat[i] += x;

    // 登りながら更新
    while (i > 0) {
        i = (i - 1) / 2;
        dat[i] = max(dat[2 * i + 1], dat[2 * i + 2]);
    }
}

// 最大値とそれに対応する番号のペアを返す。
// 複数の i が同じ最大値に対応するならば、最小の i を返す。
pair<int, int>
dat_max()
{
    int i = 1;
    int j = 2;

    for (;;) {
        if (dat[i] >= dat[j]) {
            // 最大値が左に存在するか、左右で同じ
            if (dat_is_leaf(i)) return pair<int, int>(i - n_dat + 1, dat[i]);
            i = 2 * i + 1;
        } else {
            // 最大値が右に存在する
            if (dat_is_leaf(i)) return pair<int, int>(j - n_dat + 1 , dat[j]);
            i = 2 * j + 1;
        }
        j = i + 1;
    }
}

// 要素 i が葉かどうかを返す
bool
dat_is_leaf(int i)
{
    return i >= n_dat - 1;
}
