

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *c);
void buscanome(char *s);
int yylex(void);
%}

%union{
  char s[61];
  int num;
}
%token ABRE FECHA MUNICIPIO MUNICIPIO2 BARRA  NUMEROV EOL NOTHING PVAL
%token <s> NOME

%%
PROGRAMA:
PROGRAMA EXPRESSAO EOL{
  printf("\n");
}|;
EXPRESSAO:
ABRE MUNICIPIO FECHA NOME ABRE BARRA MUNICIPIO FECHA {
  buscanome($4);
}| ABRE MUNICIPIO2 FECHA NOME ABRE BARRA MUNICIPIO2 FECHA {
  buscanome($4);
};



%%
void buscanome(char *s){
  FILE *fp;
  char st[15];
  fp = fopen("CodigosMunicipios", "r");
  while((fscanf(fp,"%s",st)) != EOF){
    if(strcmp(st,s) == 0){
      break;
    }
  }
  fscanf(fp, "%s",s);
  printf("%s\n", s);
}

void yyerror(char *s) {
  printf("aqui\n");
}

int main() {

  yyparse();
    return 0;

}
