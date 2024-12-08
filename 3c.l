%{
#include<stdio.h>
#include "3c.tab.h"
%}
%%
"if" { return IF; }
"else" { return ELSE; }
"while" { return WHILE; }
"for" { return FOR; }
"switch" { return SWITCH; }
"case" { return CASE; }
"default" { return DEFAULT; }
"break" { return BREAK; }
"(" { return OPEN_BRACKET; }
")" { return CLOSE_BRACKET; }
"{" { return OPEN_BRACE; }
"}" { return CLOSE_BRACE; }
";" { return SEMICOLON; }
[\t\n] ;
. ;
%%
int yywrap()
{
return 1;
}