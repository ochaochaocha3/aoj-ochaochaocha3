/* AOJ 0099 Surf Smelt Fishing Contest II */

#include <iostream>
#include <queue> // プライオリティキューを使う

using namespace std;

typedef pair<int, int> pii;

const int MAX_N = 1000000;
// 釣った匹数
int surf_smelts[MAX_N + 1];

int
main()
{
    int n, q, i;
    // 最大要素から出てくるプライオリティキュー。
    // ペアの比較の場合は first -> second の順で比較。
    priority_queue<pii> pque;

    cin >> n >> q;

    // 釣った匹数が負になる場合を考慮し、各参加者の初期状態を追加。
    // second が小さいものから出るよう、second は符号を逆にする。
    for (i = 1; i <= n; i++) pque.push(pii(0, -i));

    while (q--) {
        int a, v;

        cin >> a >> v;

        surf_smelts[a] += v;
        pque.push(pii(surf_smelts[a], -a));

        for (;;) {
            int a_max = -(pque.top().second);
            int v_max = pque.top().first;

            if (surf_smelts[a_max] == v_max) {
                cout << a_max << " " << v_max << endl;
                break;
            }

            pque.pop();
        }
    }

    return 0;
}
