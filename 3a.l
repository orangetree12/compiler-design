%{
#include "yacc.tab.h"
%}

%option noyywrap

%%
[0-9]+          { return NUMBER; }
[\t ]+          ;  /* Ignore whitespaces */
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
\n              { return 0; } /* End of input */
.               { printf("Invalid character: %s\n", yytext); return 0; }

%%
