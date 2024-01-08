%{
#include <stdio.h>
int charCount = 0;
int wordCount = 0;
int lineCount = 0;
int spaceCount = 0;
%}

%%
\n { lineCount++; }
[ \t] { spaceCount++; }
[a-zA-Z]+ { wordCount++; charCount += yyleng; }
. { charCount++; }

%%	

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Unable to open file: %s\n", argv[1]);
        return 1;
    }

    yyin = file;  // yyin is a global variable defined and used by lex to read from a file
    yylex();

    fclose(file);

    printf("Number of characters: %d\n", charCount);
    printf("Number of words: %d\n", wordCount);
    printf("Number of lines: %d\n", lineCount);
		printf("Number of spaces: %d\n", spaceCount);

    return 0;
}
