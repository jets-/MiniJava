package if688.lexer;

import if688.lexer.Identifier;
import if688.lexer.Float;
import if688.lexer.Int;
import if688.lexer.Keyword;
import if688.lexer.Delimiter;
import if688.lexer.Operator;


%%
%line
%column
%unicode
%standalone
%public
%class Lexer


letter          = [A-Z|a-z]
digit           = [0-9]
integer         = [1-9]{digit}+|{digit}
float			= [integer].{digit}+
alphanumeric    = {letter}|{digit}
identifier      = ( _|{letter})( _|{alphanumeric})*
whitespace      = [ \n\t]
comment 		= "/*" [^*] ~"*/"
%%


";"|"."|"="|"("|")"|"{"|"}"|"["|"]" 
	{ System.out.println("Token Delimiter:"+new Delimiter(yytext().toString())); }
"||"| "&&"| "=="| "!="|"<"| "<="|">"| ">="|"+"|"-"|"*"|"/"|"%"| "!" 
	{ System.out.println("Token Operator:"+new Operator(yytext().toString())); }
"class"| "public"| "extends"| "static"| "void"| "int"| "boolean"| 
"while"| "if"| "else"| "return"| "false"| "true"| "this"| "new" 
	{ System.out.println("Token KeyWord:"+new Keyword(yytext().toString())); }
{identifier}    { System.out.println("Token ID:"+new Identifier(yytext().toString())); }
{integer}       { System.out.println("Token Int:"+new Int(yytext()).toString()); }
{float}			{ System.out.println("Token Double:"+new Float(yytext()).toString()); }
{whitespace}    { /* Ignorar whitespace. */ }
{comment}		{}
"//"              { System.out.println("Illegal Token: '" + yytext() +
                    "' line: " + yyline + ", column: " + yycolumn); }