#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(){
  char s[50];
  FILE *f;
  FILE *fin;
  f = fopen("model.txt", "r+");
  fin = fopen("main.l", "w");
  fpos_t posi;
  /*Opera no arquivo*/

  while(fgets(s,50, f)){

    if(strcmp(s,"(***) {\n") == 0){
      strcpy(s,"(Prestador2) {");
      /*Chama funcao pra trocar *** pela palavra desejada*/
    }
    fprintf(fin, "\n");
    fprintf(fin,"%s",s);
  }
  fclose(f);
  fclose(fin);
}
