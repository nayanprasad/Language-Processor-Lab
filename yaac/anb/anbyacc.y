%{
#include<stdio.h>
int count = 0;  
%}

%token A B

%%

S: as B { if (count >= 5) printf("accepted\n"); else printf("rejected\n"); }
as: as A { count++; }
  | /* empty */
;

%%

int main() {
  yyparse();
  return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}