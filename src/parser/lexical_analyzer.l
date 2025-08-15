%option noyywrap
%{
/*****************声明和选项设置  begin*****************/
#include <stdio.h>
#include <stdlib.h>

#include "syntax_tree.h"
#include "syntax_analyzer.h"

int lines=1;
int pos_start=1;
int pos_end=1;

void pass_node(char *text){
     yylval.node = new_syntax_tree_node(text);
}

/*****************声明和选项设置  end*****************/

%}

Letter [a-zA-Z]
Digit [0-9]
Identifier {Letter}+
Integer {Digit}+
Float ({Digit}+\.|{Digit}*\.{Digit}+)
%x BlockComment

%%
 /* to do for students */
 /* two cases for you, pass_node will send flex's token to bison */
"+" 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
"-" 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return SUB;}
"*" 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return MUL;}
"/"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return DIV;}
"<"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LT;}
"<=" {pos_start = pos_end; pos_end += 2; pass_node(yytext); return LTE;}
">"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return GT;}
">=" {pos_start = pos_end; pos_end += 2; pass_node(yytext); return GTE;}
"==" {pos_start = pos_end; pos_end += 2; pass_node(yytext); return EQ;}
"!=" {pos_start = pos_end; pos_end += 2; pass_node(yytext); return NEQ;}
"="  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return ASSIGN;}
";"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return SEMICOLON;}
","  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return COMMA;}
"("  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LPARENTHESE;}
")"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RPARENTHESE;}
"["  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LBRACKET;}
"]"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RBRACKET;}
"{"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LBRACE;}
"}"  {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RBRACE;}
"else"  {pos_start = pos_end; pos_end += 4; pass_node(yytext); return ELSE;}
"if" {pos_start = pos_end; pos_end += 2; pass_node(yytext); return IF;}
"return" {pos_start = pos_end; pos_end += 6; pass_node(yytext); return RETURN;}
"while" {pos_start = pos_end; pos_end += 5; pass_node(yytext); return WHILE;}
"int" {pos_start = pos_end; pos_end += 3; pass_node(yytext); return INT;}
"float" {pos_start = pos_end; pos_end += 5; pass_node(yytext); return FLOAT;}
"void" {pos_start = pos_end; pos_end += 4; pass_node(yytext); return VOID;}
\n   {lines += 1; pos_start = 1; pos_end = 1;}
\r   {pos_start = 1; pos_end = 1;}
[ \t] {pos_start = pos_end; pos_end += 1;}
{Identifier} {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return IDENTIFIER;};
{Integer} {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTEGER;};
{Float} {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return FLOATPOINT;};
"/*"            { BEGIN(BlockComment); }
<BlockComment>"*/" { BEGIN(INITIAL); }    
<BlockComment>\n   { lines += 1; pos_start = 1; pos_end = 1;}
<BlockComment>.    { }

. { pos_start = pos_end; pos_end++; fprintf(stderr, "unknown lex:%c\n", yytext[0]); return ERROR; }

 /****请在此补全所有flex的模式与动作  end******/
%%
