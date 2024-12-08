%{
#include <stdio.h>
int valid = 1;
%}

%token letter
%token digit

%%

start: letter S
    ;

S: letter S
  | digit S
  |
  ;

%% 

int yyerror() {
    printf("\nIt's not an identifier\n");
    valid = 0;
    return 0;
}

int main() {
    printf("Enter a name: ");
    yyparse();

    if (valid) {
        printf("\nIt's an identifier!\n");
    }

    return 0;
}
