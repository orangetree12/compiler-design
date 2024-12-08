%{ 
#include<stdio.h> 
#include<stdlib.h> 
#include<string.h> 
#define MAX_IDENTIFIER_LENGTH 50 
%} 
%option noyywrap 
%option yylineno 
void addtosymboltable(const char*) 
%% 
[\t] /*ignore whitespace*/ 
\n /*ignore newline*/ 
\/\*([^*]|\*+[^*/])*\*+\/ /*ignore comments*/ 
 [0-9]+ {printf("Constant:%s \n",yytext);} 
= {printf("%s is an Assignment Operator\n",yytext);} 
\* | 
\+ | 
\- {printf("%s is a Operator\n",yytext);} 
if|else|int|float|char|void {printf("%s is a keyword",yytext);} 
[a-zA-Z][a-zA-Z0-9]* {printf("identifier:%s\n",yytext);addtosymboltable(yytext);} 
. {printf("Invalid token:%s \n",yytext);} 
%% 
typedef struct 
{ 
char name[MAX_IDENTIFIER_LENGTH]; 
} Symbol; 

Symbol symbol_table[100];  
int symbol_count=0; 

void addtosymboltable(const char * identifier) 
{  
if(symbol_count < 100) 
{ 
strncpy(symbol_table[symbol_count].name,identifier,MAX_IDENTIFIER_LENGTH-1);  
symbol_table[symbol_count].name[MAX_IDENTIFIER_LENGTH-1]='\0'; 
symbol_count++; 
printf("Identifier %s is entered in the symbol table\n",identifier); 
}  
else 
{ 
printf("Symbol table is full.Cannot add more identifier.\n"); 
exit(0); 
} 
} 
int main() 
{ 
yylex(); return 1; 
} 
