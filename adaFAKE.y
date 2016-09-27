%{
	/* Alex Voitik          */
	/* adaFake.y            */
	/* Last Edit: 9/21/2016 */
%}

%token IS BEG END PROCEDURE ID NUMBER TYPE ARRAY RAISE OTHERS
%token RECORD IN OUT RANGE CONSTANT ASSIGN EXCEPTION NULLWORD LOOP IF
%token THEN ELSEIF ELSE EXIT WHEN AND OR EQ NEQ LT GT GTE LTE TICK
%token NOT EXP ARROW OF DOTDOT ENDIF ENDREC ENDLOOP EXITWHEN
%type <integer> NUMBER
%type <var> ID
%union {
    int integer;
    char *var;
}
%%

program     : IS main_body END {printf ("\n*****\nDone.\n*****\n");}
;
main_body   : body ';' main_body | body ';'
;
body        : NUMBER           {printf("Saw a number %d \n", $1); }
            	| ID           {printf("Saw an identifier %s \n", $1); } 
            	| GTE          {printf("Saw operator >= \n"); }
           	| ENDIF        {printf("Saw the token end if\n"); }
	    	| ENDREC       {printf("Saw the token end record\n"); }
		| ENDLOOP      {printf("Saw the token end loop\n"); }
		| EXITWHEN     {printf("Saw the token exit when\n"); }
		| IS           {printf("Saw the token is\n"); }
		| OF           {printf("Saw the token of\n"); }
		| BEG          {printf("Saw the token begin\n"); }
		| DOTDOT       {printf("Saw the token dotdot\n"); }
		| TICK         {printf("Saw the token '\n"); }
		| PROCEDURE    {printf("Saw the token procedure\n"); }
		| TYPE         {printf("Saw the token type\n"); }
		| ARRAY        {printf("Saw the token array\n"); }
		| RECORD       {printf("Saw the token record\n"); }
		| IN           {printf("Saw the token in\n"); }
		| OUT          {printf("Saw the token out\n"); }
		| RANGE        {printf("Saw the token range\n"); }
		| CONSTANT     {printf("Saw the token constant\n"); }
		| ASSIGN       {printf("Saw operator :=\n"); }
		| EXCEPTION    {printf("Saw the token exception\n"); }
		| NULLWORD     {printf("Saw the token null\n"); }
		| LOOP         {printf("Saw the token loop\n"); }
		| IF           {printf("Saw the token if\n"); }
		| THEN         {printf("Saw the token then\n"); }
		| ELSEIF       {printf("Saw the token else if\n"); }
		| ELSE         {printf("Saw the token else\n"); }
		| EXIT         {printf("Saw the token exit\n"); }
		| WHEN         {printf("Saw the token when\n"); }
		| AND          {printf("Saw the token and\n"); }
		| OR           {printf("Saw the token or\n"); }
		| NOT          {printf("Saw the token not\n"); }
		| EQ           {printf("Saw operator =\n"); }
		| NEQ          {printf("Saw operator /=\n"); }
		| GT           {printf("Saw operator > \n"); }
		| LT           {printf("Saw operator < \n"); }
		| LTE          {printf("Saw operator <= \n"); }
		| EXP          {printf("Saw the token **\n"); }
		| RAISE        {printf("Saw the token raise\n"); }
		| OTHERS       {printf("Saw the token others\n"); }
		| ARROW        {printf("Saw the token =>\n"); }
;

%%
#include <stdio.h>
#include <string.h>
main()
{
    printf("About to scan. . . . . .\n");
    yyparse();
}
