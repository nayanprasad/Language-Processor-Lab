%{
#include<stdio.h>

int is_keyword(char *str) {
    char *keywords[] = {
        "auto", "break", "case", "char", "const", "continue", "default",
        "do", "double", "else", "enum", "extern", "float", "for", "goto",
        "if", "int", "long", "register", "return", "short", "signed",
        "sizeof", "static", "struct", "switch", "typedef", "union",
        "unsigned", "void", "volatile", "while"
    };

    for (int i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1; 
        }
    }

    return 0;
}

%}

%%

^[a-zA-Z_][a-zA-Z0-9_]*$ {
  if(isKeyword(yytext)) {
    printf("invalid: keyword\n");
  } else {
    printf("valid\n");
  }
}
. {printf("invalid .\n"); exit(0); }

%%

int main() {
  yylex();
  return 0;
}
