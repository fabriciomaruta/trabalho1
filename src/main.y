

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *c);
void buscanome(char *s);
void modiprint(char *s);
void floprint(float s);
void chaprint(char s);
int yylex(void);
int balancot();
int balancop();
int contadorp = 0;
int contadort = 0;
%}

%union{
  char s[61];
  int num;
}
%token ABRE FECHA MUNICIPIO  BARRA  NUMEROV EOL PVAL FIM PRESTADOR TOMADOR ISS SERVICO FLAGP FLAGT

%token <s> NOME

%%
PROGRAMA:
PROGRAMA EXPRESSAO EOL{
  printf("\n");
}|;

EXPRESSAO:
ABRE MUNICIPIO FECHA NOME ABRE BARRA MUNICIPIO FECHA EXPRESSAO{
  if((balancot()%2 == 1) && (balancot() < 4) || (balancop()%2 == 1) && (balancop() < 4)){
    buscanome($4);
  }
}|ABRE TOMADOR FECHA NOME ABRE BARRA TOMADOR FECHA EXPRESSAO{
  printf("Tomador:");
  buscanome($4);
}|ABRE SERVICO FECHA NOME ABRE BARRA SERVICO FECHA EXPRESSAO{
  floprint(atof($4));
}|ABRE ISS FECHA NOME ABRE BARRA ISS FECHA EXPRESSAO{
  floprint(atof($4));
}|ABRE PRESTADOR FECHA NOME ABRE BARRA PRESTADOR FECHA EXPRESSAO{
  printf("Prestador:");
  buscanome($4);
}|ABRE FLAGT FECHA EXPRESSAO{

}|ABRE BARRA FLAGT FECHA EXPRESSAO{

}|ABRE FLAGP FECHA EXPRESSAO{

}|ABRE BARRA FLAGP FECHA EXPRESSAO{

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
      chaprint(p);
    }
    chaprint('\0');
    fclose(fp);
  }else{
    modiprint(s);
  }

}

void yyerror(char *s) {
}
void modiprint(char *s){
  FILE *fp;
  fp = fopen("saida.csv", "a+");
  fprintf(fp,"%s\t",s);
  fclose(fp);
}
void chaprint(char s){
  FILE *fp;
  fp = fopen("saida.csv", "a+");
  if(s == '\0'){
  fprintf(fp,"\t");
  }else{
    fprintf(fp,"%c",s);
    fclose(fp);
  }

}
void floprint(float s){
  FILE *fp;
  fp = fopen("saida.csv", "a+");
  fprintf(fp,"%f\t",s);
  fclose(fp);
}

int balancop (){
  contadorp++;
  return contadorp;
}
int balancot(){
  contadort++;
  return contadort;
}
int main() {

  yyparse();
    return 0;

}
