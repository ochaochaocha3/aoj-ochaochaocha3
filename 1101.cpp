/* AOJ 1101 A Simple Offline Text Editor */

#include <iostream>
#include <string>

using namespace std;

int
main()
{
    int n_lines;

    cin >> n_lines;
    cin.ignore();

    while (n_lines--) {
        string text;
        int cursor = 0;
        int n_commands;

        getline(cin, text);
        cin >> n_commands;
        cin.ignore();

        while (n_commands--) {
            string command;
            getline(cin, command);

            if (command == "forward char") {
                if (cursor < text.size()) cursor++;
            } else if (command == "forward word") {
                while (cursor < text.size() && text[cursor] == ' ') cursor++;
                while (cursor < text.size() && text[cursor] != ' ') cursor++;
            } else if (command == "backward char") {
                if (cursor > 0) cursor--;
            } else if (command == "backward word") {
                while (cursor > 0 && text[cursor - 1] == ' ') cursor--;
                while (cursor > 0 && text[cursor - 1] != ' ') cursor--;
            } else if (command.find("insert ") == 0) {
                size_t start = command.find_first_of('"') + 1;
                size_t end = command.find_first_of('"', start);
                string arg = command.substr(start, end - start);

                text = text.substr(0, cursor) + arg + text.substr(cursor);
                cursor += arg.size();
            } else if (command == "delete char") {
                if (cursor < text.size()) {
                    text.erase(cursor, 1);
                }
            } else if (command == "delete word") {
                if (cursor < text.size()) {
                    size_t word_end = cursor;

                    while (word_end < text.size() && text[word_end] == ' ')
                        word_end++;
                    if (word_end == text.size()) continue;

                    while (word_end < text.size() && text[word_end] != ' ')
                        word_end++;

                    text = text.substr(0, cursor) + text.substr(word_end);
                }
            }
        }

        cout << text.substr(0, cursor) << '^' << text.substr(cursor) << endl;
    }
}
