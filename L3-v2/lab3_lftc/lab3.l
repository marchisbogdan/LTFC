/* specificatie pentru atomii lexicali ai minilimbajului din lab1 */
%{
#include <string.h>
char* ts[500];
int lungime=0;
int i=0;
int exista;
int cauta(char* p);
%}

%option noyywrap 

CIFRA [0-9]
ID [A-Za-z]+

%%

program 					printf("%s %d (%s)\n",yytext,2,"Cuvant rezervat"); 
array_of 					printf("%s %d (%s)\n",yytext,3,"Cuvant rezervat");
var 						printf("%s %d (%s)\n",yytext,4,"Cuvant rezervat");
int 						printf("%s %d (%s)\n",yytext,5,"Cuvant rezervat");
real 						printf("%s %d (%s)\n",yytext,6,"Cuvant rezervat");
begin 						printf("%s %d (%s)\n",yytext,7,"Cuvant rezervat");
end 						printf("%s %d (%s)\n",yytext,8,"Cuvant rezervat");
read 						printf("%s %d (%s)\n",yytext,9,"Cuvant rezervat");
println 					printf("%s %d (%s)\n",yytext,10,"Cuvant rezervat");
for 						printf("%s %d (%s)\n",yytext,11,"Cuvant rezervat");
to 							printf("%s %d (%s)\n",yytext,12,"Cuvant rezervat");
do 							printf("%s %d (%s)\n",yytext,13,"Cuvant rezervat");
if 							printf("%s %d (%s)\n",yytext,14,"Cuvant rezervat");
then 						printf("%s %d (%s)\n",yytext,15,"Cuvant rezervat");
else 						printf("%s %d (%s)\n",yytext,16,"Cuvant rezervat");
and 						printf("%s %d (%s)\n",yytext,17,"Cuvant rezervat");
or							printf("%s %d (%s)\n",yytext,18,"Cuvant rezervat");
not                 		printf("%s %d (%s)\n",yytext,19,"Cuvant rezervat");
while               		printf("%s %d (%s)\n",yytext,20,"Cuvant rezervat");
is                  		printf("%s %d (%s)\n",yytext,21,"Cuvant rezervat");
"+" 						printf("%s %d (%s)\n",yytext,22,"Operator");
"-" 						printf("%s %d (%s)\n",yytext,23,"Operator");
"*" 						printf("%s %d (%s)\n",yytext,24,"Operator");
"<"							printf("%s %d (%s)\n",yytext,25,"Operator");
">"							printf("%s %d (%s)\n",yytext,26,"Operator");
":=" 						printf("%s %d (%s)\n",yytext,27,"Operator");
"="							printf("%s %d (%s)\n",yytext,28,"Operator");
"!="						printf("%s %d (%s)\n",yytext,29,"Operator");
"<>" 						printf("%s %d (%s)\n",yytext,30,"Operator");
":" 						printf("%s %d (%s)\n",yytext,31,"Delimitator");
";" 						printf("%s %d (%s)\n",yytext,32,"Delimitator");
"(" 						printf("%s %d (%s)\n",yytext,33,"Delimitator");
")" 						printf("%s %d (%s)\n",yytext,34,"Delimitator");
"[" 						printf("%s %d (%s)\n",yytext,35,"Delimitator");
"]" 						printf("%s %d (%s)\n",yytext,36,"Delimitator");
"." 						printf("%s %d (%s)\n",yytext,37,"Delimitator");
{CIFRA}+.{CIFRA}+ {
	exista=cauta(yytext);
	if (exista==-1){
		lungime++;
		ts[lungime-1]=malloc(strlen(yytext)+1);
		strcpy(ts[lungime-1],yytext);
		printf("%s %d Pozitia in TS: %d (%s)\n",yytext,1,lungime-1,"Constanta reala");
	}else printf("%s %d Pozitia in TS: %d (%s)\n",yytext,1,exista,"Constanta reala");
}
{CIFRA}+ {
	exista=cauta(yytext);
	if (exista==-1){
		lungime++;
		ts[lungime-1]=malloc(strlen(yytext)+1);
		strcpy(ts[lungime-1],yytext);
		printf("%s %d Pozitia in TS: %d (%s)\n",yytext,1,lungime-1,"Constanta naturala");
	}else printf("%s %d Pozitia in TS: %d (%s)\n",yytext,1,exista,"Constanta naturala");
}	
{ID}+{CIFRA}* {
	if (strlen(yytext)>8) 	
		printf("\n Incorect: Lungimea Identificatorului %s %s\n",yytext," > 8 !");
	else{
		exista=cauta(yytext);
		if (exista==-1){
			lungime++;
			ts[lungime-1]=malloc(strlen(yytext)+1);
			strcpy(ts[lungime-1],yytext);
			printf("%s %d Pozitia in TS: %d (%s)\n",yytext,0,lungime-1,"Identificator");
		}else printf("%s %d Pozitia in TS: %d (%s)\n",yytext,0,exista,"Identificator");
		}
}
[ \t\r]+ 				/* eat up whitespace */ 
.			 			printf( "!!Eroare!! caracter necunoscut: %s\n", yytext ); 


%% 

int cauta(char* p){
	if(lungime>0){
		for(i=0;i<lungime;i++){
			if( strcmp(ts[i], p)==0){
				return i;
			}
		}
	}
	return -1;
}

int main( argc, argv ) 
int argc; 
char **argv; 
{ 
    ++argv, --argc; /* skip over program name */ 
    printf("\n\nContinutul FIP este: \n");
    if ( argc > 0 ) 
    	yyin = fopen( argv[0], "r" ); 
    else 
     	yyin = stdin; 
    yylex(); 
    printf("\n\nContinutul TS este: \n");
	for(i=0;i<lungime;i++)
	{
		printf("%s %d \n",ts[i],i);
	}
    return 0;
} 

