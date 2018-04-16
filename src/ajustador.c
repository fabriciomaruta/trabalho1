#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(){
  char s[20];
  FILE *f;
  f = fopen("main.l", "r+");
  /*Opera no arquivo*/
  for(int i = 0; fscanf(f,"%s", &s) != EOF;i++){
    if(strcmp(s,"(***)") == 0){
      printf("achei");
      /*Chama funcao pra trocar *** pela palavra desejada*/
    }
  }
  fclose(f);
}
