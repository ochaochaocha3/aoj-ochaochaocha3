/* AOJ 0020 Capitalize */

#include <stdio.h>
#include <string.h>

int
main(void)
{
    char s[BUFSIZ];
    int len;
    int width = 'A' - 'a';
    int i;

    fgets(s, BUFSIZ, stdin);
    len = strlen(s);

    for (i = 0; i < len; i++) {
        if ('a' <= s[i] && s[i] <= 'z') s[i] += width;
    }

    fputs(s, stdout);

    return 0;
}
