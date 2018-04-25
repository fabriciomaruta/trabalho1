

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
%token ABRE FECHA MUNICIPIO  BARRA  NUMEROV EOL PVAL FIM PRESTADOR TOMADOR ISS
%token <s> NOME

%%
PROGRAMA:
PROGRAMA EXPRESSAO EOL{
  printf("\n");
}|;
EXPRESSAO:
ABRE MUNICIPIO FECHA NOME ABRE BARRA MUNICIPIO FECHA EXPRESSAO{
  buscanome($4);
}|ABRE TOMADOR FECHA NOME ABRE BARRA TOMADOR FECHA EXPRESSAO{
  printf("Tomador:");
  buscanome($4);
}|ABRE ISS FECHA NOME ABRE BARRA ISS FECHA EXPRESSAO{
  printf("Valor ISS:%f\n", atof($4));
}|ABRE PRESTADOR FECHA NOME ABRE BARRA PRESTADOR FECHA EXPRESSAO{
  printf("Prestador:");
  buscanome($4);
}|ABRE NOME FECHA EXPRESSAO{
}|ABRE BARRA NOME FECHA EXPRESSAO{
}|NOME EXPRESSAO{
}|BARRA EXPRESSAO{
}|ABRE EXPRESSAO FECHA EXPRESSAO{
}|EOL{
}|;


%%
void buscanome(char *s){
  FILE *fp;
  char st[15];
  char p = 48;
  if(atoi(s) != 0){
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
    fclose(fp);
  }else{
    printf("%s", s);
  }

  printf("\n");

}

void yyerror(char *s) {
}

int main() {

  yyparse();
    return 0;

}
