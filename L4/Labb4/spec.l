%{
	#include <stdlib.h>
	#include "fileb.tab.h"     /*referinta la executabilul de la bison*/
	extern int noLine; 		/*definit in fisier.y pentru a retine numarul liniei unde apare eroarea */ 
%}
%option noyywrap 

/*definitiile */

ZERO 0
DIGIT [1-9][0-9]* 				
IDENTIFICATOR [a-zA-Z][a-zA-Z0-9]* 	

/*reguli*/

%%
[\n]									noLine++;
{DIGIT}"."{DIGIT} | {ZERO}"."{ZERO} 	return REAL;
{ZERO}|{DIGIT}							return INTEGER;
"var"									return VAR;
"start"									return START;
"end"									return END;
"int"									return INT;
"real"									return REALTYPE;
"array"								    return ARRAY;
"of"									return OF;
"if"								    return IF;
"then" 									return THEN;
"else"								    return ELSE;
"while" 								return WHILE;
"do"									return DO;
"read"									return READ; 
"write"								    return WRITE;
"."										return DOT;
"&&"									return AND;
"||" 									return OR;
{IDENTIFICATOR}							return IDENTIFICATOR;
"+"										return PLUS;
"-"										return MINUS;
"*"										return MULTIPLICATION;
"/"									    return DIV;
"{"										return ACOLADADESCHISA;
"}"										return ACOLADAINCHISA;
"("										return PARANTEZADESCHISA;
")"										return PARANTEZAINCHISA;
"["                                     return PARANTEZADREAPTADESCHISA;
"]"                                     return PARANTEZADREAPTAINCHISA;
";" 									return PUNCTVIRGULA;
"<"										return LE;
">"										return GR;
"<="									return LEE;
">="									return GRE;
"<>"									return NOTEQUAL;
"=="									return EQUAL;
":="                                    return ATRIBUIRE;
":"                                     return DOUAPUNCTE;
"Rezultatul este:"						return REZULTAT;
								
[ \t\r]+			/*   ignore white spaces */
%%

