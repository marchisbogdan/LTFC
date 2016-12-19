/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     REAL = 258,
     INTEGER = 259,
     VAR = 260,
     START = 261,
     END = 262,
     INT = 263,
     REALTYPE = 264,
     ARRAY = 265,
     OF = 266,
     IF = 267,
     THEN = 268,
     ELSE = 269,
     WHILE = 270,
     DO = 271,
     READ = 272,
     WRITE = 273,
     DOT = 274,
     AND = 275,
     OR = 276,
     IDENTIFICATOR = 277,
     PLUS = 278,
     MINUS = 279,
     MULTIPLICATION = 280,
     DIV = 281,
     ACOLADADESCHISA = 282,
     ACOLADAINCHISA = 283,
     PARANTEZADESCHISA = 284,
     PARANTEZAINCHISA = 285,
     PARANTEZADREAPTADESCHISA = 286,
     PARANTEZADREAPTAINCHISA = 287,
     PUNCTVIRGULA = 288,
     LE = 289,
     GR = 290,
     LEE = 291,
     GRE = 292,
     NOTEQUAL = 293,
     EQUAL = 294,
     ATRIBUIRE = 295,
     DOUAPUNCTE = 296,
     REZULTAT = 297
   };
#endif
/* Tokens.  */
#define REAL 258
#define INTEGER 259
#define VAR 260
#define START 261
#define END 262
#define INT 263
#define REALTYPE 264
#define ARRAY 265
#define OF 266
#define IF 267
#define THEN 268
#define ELSE 269
#define WHILE 270
#define DO 271
#define READ 272
#define WRITE 273
#define DOT 274
#define AND 275
#define OR 276
#define IDENTIFICATOR 277
#define PLUS 278
#define MINUS 279
#define MULTIPLICATION 280
#define DIV 281
#define ACOLADADESCHISA 282
#define ACOLADAINCHISA 283
#define PARANTEZADESCHISA 284
#define PARANTEZAINCHISA 285
#define PARANTEZADREAPTADESCHISA 286
#define PARANTEZADREAPTAINCHISA 287
#define PUNCTVIRGULA 288
#define LE 289
#define GR 290
#define LEE 291
#define GRE 292
#define NOTEQUAL 293
#define EQUAL 294
#define ATRIBUIRE 295
#define DOUAPUNCTE 296
#define REZULTAT 297



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
