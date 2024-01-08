%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expr: expr '+' expr { printf("+ "); }
    | expr '-' expr { printf("- "); }
    | expr '*' expr { printf("* "); }
    | expr '/' expr { printf("/ "); }
    | NUMBER
    ;

%%

int main() {
    yyparse();
    printf("\n");
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
