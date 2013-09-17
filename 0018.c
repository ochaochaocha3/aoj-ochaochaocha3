/* AOJ 0018 Sorting Five Numbers */

#include <stdio.h>

int
main(void)
{
    int n[5];
    int exchanges;
    int i, j, temp;

    for (i = 0; i < 5; i++)
        scanf("%d", n + i);

    for (i = 0; i < 4; i++) {
        exchanges = 0;

        for (j = 4; j > i; j--) {
            if (n[j - 1] < n[j]) {
                temp = n[j - 1];
                n[j - 1] = n[j];
                n[j] = temp;

                exchanges++;
            }
        }

        if (exchanges == 0) break;
    }

    printf("%d %d %d %d %d\n", n[0], n[1], n[2], n[3], n[4]);

    return 0;
}
