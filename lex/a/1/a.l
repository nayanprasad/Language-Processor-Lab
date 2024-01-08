%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>

int wordCount = 0, isFind = 0, isValidEmail = 0;;
char searchKey[50];

int search(char *a, char *b) {
  int n1 = strlen(a);
  int n2 = strlen(b);

  if(n1 != n2) return 0;

  for(int i = 0; i < n1; i++) {
    if(a[i] != b[i]) return 0;
  }
  return 1;
}

%}

%%


^\"[a-z]+\"  {printf("%s\n", yytext);}



^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$ { printf("Valid date found: %s\n", yytext); }


^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+$ {
    printf("Valid email: %s\n", yytext);
    isValidEmail = 1;
}


[a-zA-Z]+ {if(yyleng > 5 && yyleng < 10) wordCount++;
  if(strcmp(searchKey, yytext) == 0) isFind = 1;
}



. 

%%

int main() {

  printf("Enter the search key: ");
  scanf("%s", searchKey);

  int isAllDigits = 1;
  for (int i = 0; searchKey[i] != '\0'; i++) {
      if (!isdigit(searchKey[i])) {
          isAllDigits = 0;
          break;
      }
  }
  if (isAllDigits) printf("key is digit");
  else printf("key is not digit");


  extern FILE *yyin;

  yyin = fopen("a.txt", "r");
  yylex();

  printf("wordCount :%d\n", wordCount);
  if(isFind) printf("key found\n");
  else printf("key not found\n");

  if(isValidEmail) printf("email is valid \n");

  return 0;
}