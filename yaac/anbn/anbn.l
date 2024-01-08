%{
#include "y.tab.h"
%}

%%

a        { return A; }
b        { return B; }
\n       { return '\n'; exit(0);}
.        { yyerror("invalid"); }

%%

int yywrap() {
    return 1;
}
