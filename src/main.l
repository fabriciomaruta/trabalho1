
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"


%}
PALAVRA {NUMEROV PALAVRAV}+;

%%
"<" { return ABRE; }
">" { return FECHA; }


(***) {
  return MUNICIPIO;
}
"/" {
  return BARRA;
}
[a-zA-Z\" "]+ {
  strcpy(yylval.s,yytext);
  return NOME;
}

[0-9]+ {
return NUMEROV;
}

[\n]+ {
  return EOL;
}

. {
  return PVAL;
} ;

%%

int yywrap() {
  return 1;
}
