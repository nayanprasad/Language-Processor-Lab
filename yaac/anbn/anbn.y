%{
#include <stdio.h>
int count = 0;
%}

%token A B

%%

S: as bs { if (count == 0) printf("accepted\n"); else printf("rejected\n"); }
as: A as { count++; }
  | 
;
bs: B bs { count--; }
  | 
;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    //printf("Error: %s\n", s);
    return 0;
}
