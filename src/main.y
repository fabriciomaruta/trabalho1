

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%union{
  char s[61];
  int num;
}
%token ABRE FECHA MUNICIPIO BARRA NOME NUMEROV EOL
%token <s> NOME

%%
PROGRAMA:
PROGRAMA EXPRESSAO EOL{
  printf("\n");
}|;
EXPRESSAO:
ABRE MUNICIPIO FECHA NOME ABRE BARRA MUNICIPIO FECHA {
  printf("%s", $4);
}|NOME{
  printf("nao cai\n");
}|;


%%

void yyerror(char *s) {
  printf("aqui\n");
}

int main() {
  yyparse();
    return 0;

}
