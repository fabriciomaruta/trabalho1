

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
%token ABRE FECHA MUNICIPIO  BARRA  NUMEROV EOL PVAL
%token <s> NOME

%%
PROGRAMA:
PROGRAMA EXPRESSAO EOL{
  printf("\n");
}|;
EXPRESSAO:
ABRE MUNICIPIO FECHA NOME ABRE BARRA MUNICIPIO FECHA {
  buscanome($4);
}| ABRE NOME FECHA NOME ABRE BARRA NOME FECHA{
  printf("cruzes\n");
}| ABRE BARRA NOME FECHA NOME ABRE BARRA NOME FECHA{
  printf("ai caraio\n");
}| ABRE EXPRESSAO FECHA{

}|NOME EXPRESSAO{

}|BARRA EXPRESSAO{

}|EXPRESSAO ABRE EXPRESSAO FECHA EXPRESSAO{

}|;




%%
void buscanome(char *s){
  FILE *fp;
  char st[15];
  char p = 48;
  fp = fopen("CodigosMunicipios", "r");
  while((fscanf(fp,"%s",st)) != EOF){
    if(strcmp(st,s) == 0){
      break;
    }
  }
  while(p != '\n'){
    fscanf(fp, "%c",&p);
    printf("%c", p);
  }
  printf("\n");
  fclose(fp);
}

void yyerror(char *s) {
  printf("CARACTERE INVALIDO %s\n",s);
}

int main() {

  yyparse();
    return 0;

}
