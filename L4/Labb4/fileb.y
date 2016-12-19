%{
	#include<stdio.h>
	int noLine=1; /*number of current Line*/
	extern char *yytext; /* last token, defined in lex.l  */
	extern FILE *yyin;/*voi lua un fisier extern,ca si sursa pt parsare*/
	
%}
%token REAL;
%token INTEGER;
%token VAR;
%token START;
%token END;
%token INT;
%token REALTYPE;
%token ARRAY;
%token OF;
%token IF;
%token THEN;
%token ELSE;
%token WHILE;
%token DO;
%token READ; 
%token WRITE;
%token DOT;
%token AND;
%token OR;
%token IDENTIFICATOR;
%token PLUS;
%token MINUS;
%token MULTIPLICATION;
%token DIV;
%token ACOLADADESCHISA;
%token ACOLADAINCHISA;
%token PARANTEZADESCHISA;
%token PARANTEZAINCHISA;
%token PARANTEZADREAPTADESCHISA;
%token PARANTEZADREAPTAINCHISA;
%token PUNCTVIRGULA;
%token LE;
%token GR;
%token LEE;
%token GRE;
%token NOTEQUAL;
%token EQUAL;
%token ATRIBUIRE;
%token DOUAPUNCTE;
%token REZULTAT;
%%

program:			VAR list_declaratii START list_instructiuni END;
					
			
list_instructiuni:	instructiune|instructiune list_instructiuni; 	

instructiune:		assignstmt | instmt | inelementarraystmt | outstmt | ifstmt| elsestmt| whilestmt | whilemultiplestmt;

list_declaratii:    declaratie| declaratie list_declaratii;
declaratie:			IDENTIFICATOR DOUAPUNCTE type PUNCTVIRGULA;
type:				INT|REALTYPE|vector;
vector:             ARRAY PARANTEZADREAPTADESCHISA INTEGER PARANTEZADREAPTAINCHISA OF REALTYPE;

assignstmt:			IDENTIFICATOR ATRIBUIRE expresie1;
expresie1:			IDENTIFICATOR|INTEGER|REAL|expresie;
expresie:			termen op termen | termen op expresie;
termen:				IDENTIFICATOR|INTEGER|REAL| IDENTIFICATOR PARANTEZADREAPTADESCHISA IDENTIFICATOR PARANTEZADREAPTAINCHISA;
op:					PLUS|MINUS|MULTIPLICATION|DIV;

ifstmt:             IF IDENTIFICATOR operator id THEN list_instructiuni;
elsestmt:           ELSE list_instructiuni;
whilestmt:          WHILE IDENTIFICATOR operator id DO list_instructiuni;
whilemultiplestmt:  WHILE IDENTIFICATOR operator id DO START list_instructiuni END;
instmt:				READ PARANTEZADESCHISA IDENTIFICATOR PARANTEZAINCHISA;
inelementarraystmt: READ PARANTEZADESCHISA IDENTIFICATOR PARANTEZADREAPTADESCHISA IDENTIFICATOR PARANTEZADREAPTAINCHISA PARANTEZAINCHISA;
outstmt:		    WRITE PARANTEZADESCHISA IDENTIFICATOR PARANTEZAINCHISA;

operator:			EQUAL|GR|GRE|LE|LEE|NOTEQUAL;
id:					IDENTIFICATOR|INTEGER|REAL;
%%

yyerror(){
	printf("Sintax error on line #%d\n",noLine);
	printf( "Last token was \"%s\"\n", yytext);
}
main(int arc, char **argv){
	FILE *fis=fopen(argv[1],"r");
	if (!fis) {
		printf("Dati un fisier valid ca parametru!");
		return -1;
	}
	yyin = fis;
	do {
	/*yyparse() returns a value of 
					-0 if the input it parses is valid according to the given grammar rules. 
					- 1 if the input is incorrect 
					-error recovery is impossible.*/
		printf("MY: yyparse returns %d \n", yyparse());
	} while (!feof(yyin));

}
		




