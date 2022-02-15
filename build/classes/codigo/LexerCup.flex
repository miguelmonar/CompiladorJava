package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
int {return new Symbol (sym.Int, yychar, yyline, yytext());}
double {return new Symbol (sym.Double, yychar, yyline, yytext());}
float {return new Symbol (sym.Float, yychar, yyline, yytext());}
if {return new Symbol (sym.If, yychar, yyline, yytext());}
else {return new Symbol (sym.Else, yychar, yyline, yytext());}
while {return new Symbol (sym.While, yychar, yyline, yytext());}
boolean {return new Symbol (sym.Boolean, yychar, yyline, yytext());}
break {return new Symbol (sym.Break, yychar, yyline, yytext());}
default {return new Symbol (sym.Default, yychar, yyline, yytext());}
do {return new Symbol (sym.Do, yychar, yyline, yytext());}
switch {return new Symbol (sym.Switch, yychar, yyline, yytext());}
try {return new Symbol (sym.Try, yychar, yyline, yytext());}
void {return new Symbol (sym.Void, yychar, yyline, yytext());}
char {return new Symbol (sym.Char, yychar, yyline, yytext());}
String {return new Symbol (sym.String, yychar, yyline, yytext());}
catch {return new Symbol (sym.Catch, yychar, yyline, yytext());}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return new Symbol (sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol (sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol (sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol (sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol (sym.Division, yychar, yyline, yytext());}
"(" {return new Symbol (sym.Parentesis_a, yychar, yyline, yytext());}
")" {return new Symbol (sym.Parentesis_c, yychar, yyline, yytext());}
"{" {return new Symbol (sym.Llave_a, yychar, yyline, yytext());}
"}" {return new Symbol (sym.Llave_c, yychar, yyline, yytext());}
"\"" {return new Symbol (sym.Comillas, yychar, yyline, yytext());}
"\'" {return new Symbol (sym.Comilla, yychar, yyline, yytext());}
">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}
"&&" | "||" | "!" | "&" | "|" {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}
"main" {return new Symbol (sym.Main, yychar, yyline, yytext());}
";" {return new Symbol (sym.P_coma, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol (sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol (sym.Numero, yychar, yyline, yytext());}
{DD} {return new Symbol (sym.NumeroFlotante, yychar, yyline, yytext());}
 . {return new Symbol (sym.ERROR, yychar, yyline, yytext());}

