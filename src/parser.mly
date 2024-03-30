%{
open Ast
%}

%token <int> INT_LIT
%token <string> STRING_LIT
%token <string> IDENT
%token INT STRING IF ELSE FOR WHILE EQUALS LBRACE RBRACE SEMICOLON ASSIGN EOF
%token PRINT LPAREN RPAREN

%start program
%type <program> program
%type <statement> statement
%type <expression> expression

%%

program:
| statements EOF { Program(statements) }

statements:
| statement { [statement] }
| statement statements { statement :: statements }

statement:
| INT IDENT ASSIGN expression SEMICOLON { Declaration($2, Int($4)) }
| STRING IDENT ASSIGN expression SEMICOLON { Declaration($2, String($4)) }
| PRINT LPAREN expression RPAREN SEMICOLON { Print($3) }
| FOR LPAREN IDENT ASSIGN expression SEMICOLON expression SEMICOLON expression RPAREN LBRACE statements RBRACE { ForLoop($3, $5, $7, $9, $12) }
| WHILE LPAREN expression RPAREN LBRACE statements RBRACE { WhileLoop($3, $6) }
| IF LPAREN expression RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE { IfElse($3, $6, $10) }

expression:
| INT_LIT { Val(Int($1)) }
| STRING_LIT { Val(String($1)) }
| IDENT { Var($1) }
| expression EQUALS expression { Equals($1, $3) }