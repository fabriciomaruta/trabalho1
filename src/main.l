


%{

#include <stdlib.h>

void yyerror(char *);



#include "y.tab.h"



%}




%%

(CodigoMunicipio|ns3:CodigoMunicipio|descricaoMunicipio) {
  return MUNICIPIO;
}
(tsMunTmd|TOMADOR_CIDADE) {
  return TOMADOR;
}
(PRESTADOR_CIDADE|tsMunPtd) {
  return PRESTADOR;
}

(PrestadorServico) {
  return FLAGP;
}

(TomadorServico) {
  return FLAGT;
}

(ValorIss|VALOR_ISS|valorTotalISS) {
  return ISS;
}

(valorTotalServico|VALOR_SERVICO|ValorServicos) {
 return SERVICO;
}

"<" { return ABRE; }
">" { return FECHA; }

["Ç" "Í" "°" "/" "?" ":" "|" "\" "º" "–" "\t" "\n" " " "." \- "=" """ "%" "$" "Ã" "Á" "," \_ "ï""¿""½" ";" "&" "Ó" "ã" "á" "@" "(" ")" "À"]+ {
  return BARRA;
}


[a-zA-Z\" "0-9\"."\_","]+ {
  strcpy(yylval.s,yytext);
  return NOME;
}


[\0]+ {
  return EOL;
}


%%
int yywrap() {
  return 1;
}
