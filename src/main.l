
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
  int a = 0;

%}
PALAVRA {NUMEROV PALAVRAV}+;

%%
"<" { return ABRE; }
">" { return FECHA; }


(Bairro) {
  return MUNICIPIO;
}
"/" {
  return BARRA;
}
[a-zA-Z]+ {
  strcpy(yylval.s,yytext);
  return NOME;
}
[0-9]+ {

return NUMEROV;
}

[\n]+ {
  return EOL;
}

. { }

%%

int yywrap() {
  return 1;
}
