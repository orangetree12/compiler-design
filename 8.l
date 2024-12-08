%{

#include <stdio.h>

int vowels = 0, consonants = 0;

%}



%%



[aAeEiIoOuU]  { vowels++; } 

[a-zA-Z]       { consonants++; } 



[ \t]        ; 

[ \n]   {return 0;}; 

.              ; 



%%



int main() {

    printf("Enter a string: ");

    yylex(); 

    printf("\nTotal Vowels: %d\n", vowels);

    printf("Total Consonants: %d\n", consonants);

    return 0;

}



int yywrap() {

    return 1; 

}
