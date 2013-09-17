/* AOJ 1101 A Simple Offline Text Editor */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* #define DEBUG */

#ifdef DEBUG
#define DEBUG_PRINT do {print_str(text, len, cursor);} while(0)
#else
#define DEBUG_PRINT (0)
#endif

void print_str(char *s, int len, int cursor);

int
main(void)
{
    int n_texts;
    char s[BUFSIZ];

    fgets(s, BUFSIZ, stdin);
    n_texts = atoi(s);

    while (n_texts--) {
        char text[BUFSIZ];
        int len;
        int cursor = 0;
        int n_commands;

        fgets(text, BUFSIZ, stdin);
        len = strlen(text);
        if (text[len - 1] == '\n') {
            text[len - 1] = '\0';
            len--;
        }
        if (strchr(text, '\r')) puts("BANG!");

        fgets(s, BUFSIZ, stdin);
        n_commands = atoi(s);
        while (n_commands--) {
            fgets(s, BUFSIZ, stdin);
            if (strstr(s, "forward char") == s) {
                if (cursor < len) cursor++;
                DEBUG_PRINT;
            } else if (strstr(s, "forward word") == s) {
                while (cursor < len && text[cursor] == ' ')
                    cursor++;
                while (cursor < len && text[cursor] != ' ')
                    cursor++;
                DEBUG_PRINT;
            } else if (strstr(s, "backward char") == s) {
                if (cursor > 0) cursor--;
                DEBUG_PRINT;
            } else if (strstr(s, "backward word") == s) {
                while (cursor > 0 && text[cursor - 1] == ' ')
                    cursor--;
                while (cursor > 0 && text[cursor - 1] != ' ')
                    cursor--;
                DEBUG_PRINT;
            } else if (strstr(s, "insert ") == s) {
                char temp[BUFSIZ];
                char *start = strchr(s, '"') + 1;
                char *end = strchr(start, '"');
                int len_arg = (int)(end - start);

                if (cursor == len) {
                    strncat(text, start, len_arg);
                } else {
                    strcpy(temp, text);

                    strncpy(text + cursor, start, len_arg);
                    text[cursor + len_arg] = '\0';
                    strcat(text, temp + cursor);
                }

                cursor += len_arg;
                len += len_arg;
                DEBUG_PRINT;
            } else if (strstr(s, "delete char") == s) {
                if (cursor < len) {
                    char temp[BUFSIZ];

                    strcpy(temp, text);

                    text[cursor] = '\0';
                    strcat(text, temp + cursor + 1);

                    len--;
                }
                DEBUG_PRINT;
            } else if (strstr(s, "delete word") == s) {
                if (cursor < len) {
                    char temp[BUFSIZ];
                    int word_end = cursor;
                    int len_word = 0;

                    while (word_end < len && text[word_end] == ' ') {
                        word_end++;
                        len_word++;
                    }

                    if (word_end == len) continue;

                    while (word_end < len && text[word_end] != ' ') {
                        word_end++;
                        len_word++;
                    }

                    strcpy(temp, text);
                    strcpy(text + cursor, temp + word_end);
                    len -= len_word;
                }
                DEBUG_PRINT;
            }
        }
        print_str(text, len, cursor);
    }

    return 0;
}

void
print_str(char *s, int len, int cursor)
{
    int i;

    if (len == 0) {
        putchar('^');
    } else {
        for (i = 0; i < len; i++) {
            if (i == cursor) putchar('^');
            putchar(s[i]);
        }

        if (cursor == len) putchar('^');
    }

    putchar('\n');
}
