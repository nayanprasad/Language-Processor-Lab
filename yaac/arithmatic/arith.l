%{
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       { /* ignore whitespace */ }
\n          { return '\n'; }
.           { printf("Invalid character\n"); }

%%

int yywrap() {
    return 1;
}
