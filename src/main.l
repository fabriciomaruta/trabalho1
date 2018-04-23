


%{

#include <stdlib.h>

void yyerror(char *);



#include "y.tab.h"



%}

PALAVRA {NUMEROV PALAVRAV}+;



%%

(CodigoMunicipio) {
  return MUNICIPIO;

}

(ns3:CodigoMunicipio) {
  return MUNICIPIO2;

}



"<" { return ABRE; }

">" { return FECHA; }







"/" {

  return BARRA;

}

[a-zA-Z\" "0-9]+ {

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
