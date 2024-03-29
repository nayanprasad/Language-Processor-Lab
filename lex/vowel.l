%{
  int vc = 0;
  int cc = 0;
%}

%%
[aeiouAEIOU] {vc++;}
[a-zA-Z] {cc++;}
.
%%

int main() {
  char input[1000];
  fgets(input, sizeof(input), stdin);

  yy_scan_string(input); // yy_scan_string() is a function generated by flex. set input as the input stream
  yylex();

  printf("Vowels: %d\n", vc);
  printf("Consonants: %d\n", cc);

  return 0;
}