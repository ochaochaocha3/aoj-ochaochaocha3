/* AOJ 0006 Reverse Sequence */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 21

int
main(void)
{
    char s[32];
    int len, i;

    if (!fgets(s, MAX_LEN, stdin)) exit(EXIT_FAILURE);

    len = strnlen(s, MAX_LEN);
    for (i = len - 1; i >= 0; i--)
        putchar(s[i]);
    putchar('\n');

    exit(EXIT_SUCCESS);
}
