%{
#include "y.tab.h"
%}

%%
a {return A;}
b {return B;}
\n {exit(0);}
. {yyerror("invalid input"); exit(0);}

%%

int yywrap() {
  return 1;
}