%{
  int charCount = 0, wordCount = 0, lineCount = 0, spaceCount = 0;
%}

%%

[\n] {lineCount++;}
[ \t] {spaceCount++;}
[a-zA-Z] {wordCount++; charCount += yyleng;}
. {charCount++;}

%%

int main() {
  extern FILE *yyin;

  yyin = fopen("count_file.txt", "r");
  yylex();

  printf("Number of characters: %d\n", charCount);
  printf("Number of words: %d\n", wordCount);
  printf("Number of lines: %d\n", lineCount);
}