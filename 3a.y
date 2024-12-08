%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE
%token LPAREN RPAREN

%left PLUS MINUS
%left MULTIPLY DIVIDE
%right UMINUS /* Unary minus */

%%

expression:
    expression PLUS expression
  | expression MINUS expression
  | expression MULTIPLY expression
  | expression DIVIDE expression
  | LPAREN expression RPAREN
  | MINUS expression %prec UMINUS
  | NUMBER
  ;

%%

void yyerror(const char *s) {
    printf("Invalid expression: %s\n", s);
}

int main(void) {
    printf("Enter an expression: ");
    if (yyparse() == 0) {
        printf("The expression is valid.\n");
    } else {
        printf("The expression is invalid.\n");
    }
    return 0;
}
