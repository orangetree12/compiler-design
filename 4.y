%{
#include <stdio.h>
#include <stdlib.h>

int temp_count = 0;  // Counter for temporary variables

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token NUM EOL
%left '+' '-'
%left '*' '/'

%%
program: lines
;

lines: lines line
     | line
;

line: expr EOL {
    printf("Result: t%d\n", $1);
}
;

expr: NUM {
    $$ = ++temp_count;
    printf("t%d = %d\n", $$, $1);  // Assigns a temporary for literals
}
| '(' expr ')' {
    $$ = $2;
}
| expr '+' expr {
    $$ = ++temp_count;
    printf("t%d = t%d + t%d\n", $$, $1, $3);  // Create temp for addition
}
| expr '-' expr {
    $$ = ++temp_count;
    printf("t%d = t%d - t%d\n", $$, $1, $3);  // Create temp for subtraction
}
| expr '*' expr {
    $$ = ++temp_count;
    printf("t%d = t%d * t%d\n", $$, $1, $3);  // Create temp for multiplication
}
| expr '/' expr {
    if ($3 == 0) {
        yyerror("Division by zero");
        $$ = 0;
    } else {
        $$ = ++temp_count;
        printf("t%d = t%d / t%d\n", $$, $1, $3);  // Create temp for division
    }
}
;

%%

int main() {
    yyparse();
    return 0;
}
