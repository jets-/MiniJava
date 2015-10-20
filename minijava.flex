package if688;

import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;

 
%%

%line
%column
%unicode
%standalone
%public
%class Lexer
%implements sym
%cup

%{	
    public Lexer(ComplexSymbolFactory sf, java.io.InputStream is){
		this(is);
        symbolFactory = sf;
    }
	public Lexer(ComplexSymbolFactory sf, java.io.Reader reader){
		this(reader);
        symbolFactory = sf;
    }
    
    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
		return symbolFactory.newSymbol(name, code,
						new Location(yyline+1,yycolumn+1, yychar), // -yylength()
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength())
				);
    }
    public Symbol symbol(String name, int code, String lexem){
	return symbolFactory.newSymbol(name, code, 
						new Location(yyline+1, yycolumn +1, yychar), 
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength()), lexem);
    }
    
    protected void emit_warning(String message){
    	System.out.println("scanner warning: " + message + " at : 2 "+ 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
    
    protected void emit_error(String message){
    	System.out.println("scanner error: " + message + " at : 2" + 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
%}
/*
%eofval{ return symbolFactory.newSymbol("EOF",sym.EOF); %eofval} 
*/
letter          = [A-Z|a-z]
digit           = [0-9]
/*number    = ({integer}+)("."{digit}*)?*/
integer         = [1-9]{digit}+|{digit}
float           = {integer}"."{digit}+
alphanumeric    = {letter}|{digit}
identifier      = ( _|{letter})( _|{alphanumeric})*
whitespace      = [ \n\t]
comment         = "/*" [^*] ~"*/"
ignore          = "//" [^*] ~[\n]
%%
/**
 * DELIMITERS
 */
    ";"         { return symbolFactory.newSymbol("SEMI", SEMI); }
    "("         { return symbolFactory.newSymbol("LPAREN", LPAREN); }
    ")"         { return symbolFactory.newSymbol("RPAREN", RPAREN); }
    "{"         { return symbolFactory.newSymbol("BEGIN", BEGIN); }
    "}"         { return symbolFactory.newSymbol("END", END); }
    "["         { return symbolFactory.newSymbol("LBRA", LBRA); }
    "]"         { return symbolFactory.newSymbol("RBRA", RBRA); }
    "="         { return symbolFactory.newSymbol("ASSIGN", ASSIGN); }
    "."         { return symbolFactory.newSymbol("DOT", DOT); }
    ","			{ return symbolFactory.newSymbol("COMMA", COMMA); }
/**
 * OPERATORS   
 */
    "*"         { return symbolFactory.newSymbol("TIMES", TIMES); }
    "+"         { return symbolFactory.newSymbol("PLUS", PLUS); }
    "-"         { return symbolFactory.newSymbol("MINUS", MINUS); }
    "/"         { return symbolFactory.newSymbol("DIVIDE", DIVIDE); }
    "%"         { return symbolFactory.newSymbol("MOD", MOD); }
    "<="        { return symbolFactory.newSymbol("LEQ", COMP); }
    ">="        { return symbolFactory.newSymbol("GTD", COMP); }
    "=="        { return symbolFactory.newSymbol("EQ", COMP); }
    "!="        { return symbolFactory.newSymbol("NEQ", COMP); }
    "<"         { return symbolFactory.newSymbol("LE", COMP); }
    ">"         { return symbolFactory.newSymbol("GT", COMP); }
    "&&"        { return symbolFactory.newSymbol("AND", BBINOP); }
    "||"        { return symbolFactory.newSymbol("OR", BBINOP); }
    "!"         { return symbolFactory.newSymbol("NOT", BUNOP); }
/**
 * KEYWORDS
 */
    "class"     { return symbolFactory.newSymbol("CLASS", CLASS); }
    "public"    { return symbolFactory.newSymbol("PUBLIC", PUBLIC); }
    "extends"   { return symbolFactory.newSymbol("EXTENDS", EXTENDS); }
    "static"    { return symbolFactory.newSymbol("STATIC", STATIC); }
    "void"      { return symbolFactory.newSymbol("VOID", VOID); }
    "int"       { return symbolFactory.newSymbol("INT", INT); }
    "boolean"   { return symbolFactory.newSymbol("BOOLEAN", BOOLEAN); }
    "while"     { return symbolFactory.newSymbol("WHILE", WHILE); }
    "if"        { return symbolFactory.newSymbol("IF", IF); }
    "else"      { return symbolFactory.newSymbol("ELSE", ELSE); }
    "return"    { return symbolFactory.newSymbol("RETURN", RETURN); }
    "false"     { return symbolFactory.newSymbol("FALSE", BOOLCONST); }
    "true"      { return symbolFactory.newSymbol("TRUE", BOOLCONST); }
    "this"      { return symbolFactory.newSymbol("THIS", THIS); }
    "new"       { return symbolFactory.newSymbol("NEW", NEW); }
    "main"		{ return symbolFactory.newSymbol("MAIN", MAIN); }
    "String"	{ return symbolFactory.newSymbol("STRING", STRING); }
    "System.out.println" { return symbolFactory.newSymbol("PRINT", PRINT); }
    "length"	{ return symbolFactory.newSymbol("LEN", LEN); }
/**
 * etc
 */
{identifier}    { return symbolFactory.newSymbol("ID", ID); }
{integer}       { return symbolFactory.newSymbol("NUMBER", NUMBER, Integer.parseInt(yytext())); }
{float}         { return symbolFactory.newSymbol("DOUBLE", DOUBLE, Double.parseDouble(yytext())); }
{whitespace}    { /* Ignorar whitespace. */ }
{comment}       { /* Ignorar Comment */ }
.               { throw new Error("Caractere ilegal <"+yytext()+">"); }
{ignore}        { System.out.println("Illegal Token '" + yytext() 
                    + "' line: " + yyline + ", column: " + yycolumn); }