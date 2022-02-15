package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
int {lexeme=yytext(); return Int;}
double {lexeme=yytext(); return Double;}
float {lexeme=yytext(); return Float;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
boolean {lexeme=yytext(); return Boolean;}
break {lexeme=yytext(); return Break;}
default {lexeme=yytext(); return Default;}
do {lexeme=yytext(); return Do;}
switch {lexeme=yytext(); return Switch;}
try {lexeme=yytext(); return Try;}
void {lexeme=yytext(); return Void;}
char {lexeme=yytext(); return Char;}
String {lexeme=yytext(); return String;}
catch {lexeme=yytext(); return Catch;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
"\"" {lexeme=yytext(); return Comillas;}
"\'" {lexeme=yytext(); return Comilla;}
">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" {lexeme=yytext(); return Op_relacional;}
"&&" | "||" | "!" | "&" | "|" {lexeme=yytext(); return Op_logico;}
"main" {lexeme=yytext(); return Main;}
";" {lexeme=yytext(); return P_coma;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 {DD} {lexeme=yytext(); return Numero;}
 . {return ERROR;}
