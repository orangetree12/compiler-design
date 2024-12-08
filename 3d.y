%{
#include <stdio.h>
int flag = 0;
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%left '%'
%left '(' ')'

%%

// Grammar rules
ArithmeticExpression: E {
    printf("Result = %d\n", $1);
    return 0;
};

E: E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | E '/' E { $$ = $1 / $3; }
 | E '%' E { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | NUMBER { $$ = $1; }
;

%%

// Main function
int main() {
    printf("\nEnter an arithmetic expression that can have operations Addition, Subtraction, Multiplication, Division, Modulus, and Round brackets: ");
    yyparse();
    if (flag == 0) {
        printf("\nEntered arithmetic expression is Valid\n");
    }
    return 0;
}

// Error handling function
void yyerror(const char* s) {
    printf("\nEntered arithmetic expression is Invalid\n");
    flag = 1;
}
