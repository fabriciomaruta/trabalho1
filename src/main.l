


%{

#include <stdlib.h>

void yyerror(char *);



#include "y.tab.h"



%}

PALAVRA {NUMEROV PALAVRAV}+;



%%

(CodigoMunicipio|ns3:CodigoMunicipio) {
  return MUNICIPIO;
}





"<" { return ABRE; }

">" { return FECHA; }





["/" "?" ":" "|" "\" "º" "\t" "\n" " " "." \"-" "=" """ "%" "$" "Ã" "Á" ","]+ {

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

[\0]+ {
  return FIM;
}


[.]+ {

  return PVAL;

} ;



%%



int yywrap() {

  return 1;

}
