/* Ocamlyacc parser for CalcLyst 
*/

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE LBRAC RBRAC COMMA PLUS MINUS TIMES DIVIDE RDIVIDE ASSIGN COLON COMP
%token NOT EQ LT GT AND OR LEQ GEQ
%token RETURN IF ELSE ELIF FOR WHILE INT BOOL FLOAT VOID CHAR STRING NODE GRAPH EDGE POINT VECTOR REAL IMAGINARY
%token <int> LITERAL
%token <bool> BLIT
%token <char> CHRLIT
%token <string> STRLIT
%token <string> ID FLIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ COLON
%left LT GT LEQ GEQ
%left PLUS MINUS
%left COMP
%left TIMES DIVIDE RDIVIDE
%right NOT
%left COMMA
%%

program_rule:
  vdecl_list_rule stmt_list_rule EOF { {locals=$1; body=$2} }

vdecl_list_rule:
  /*nothing*/                   { []       }
  | vdecl_rule vdecl_list_rule  { $1 :: $2 }

vdecl_rule:
  typ_rule ID SEMI { ($1, $2) }

typ_rule:
    INT    { Int    }
  | FLOAT  { Float  }
  | STRING { String }
  | VOID   { Void   }
  | BOOL   { Bool   }
  | typ_rule LBRAC expr RBRAC { Array($1, $3) }
  | CHAR   { Char   }

stmt_list_rule:
    typ_rule ID                   { [($1,$2)]     }
  | NODE ID                  { [(Node, $2)]  }
  | GRAPH ID                 { [(Graph, $2)] }
  
stmt_list:
  /* nothing */    { [] }
  | stmt_list stmt { $2::$1 }

stmt:
    expr SEMI                               { Expr $1               }
  | RETURN expr_opt SEMI                    { Return $2             }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2)    }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | IF LPAREN expr RPAREN stmt ELIF LPAREN expr RPAREN stmt ELSE stmt    { ELIF($3, $5, $8, $10, $11)        }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)         }
  | graph_stmts                             { $1                    }
  | typ_rule ID SEMI                             { Binding($1, $2)       }

expr:
    LITERAL          { Literal($1)                       }
  | FLIT             { FLit($1)                          }
  | BLIT             { BoolLit($1)                       }
  | CHRLIT           { ChrLit($1)                        }
  | STRLIT           { StrLit($1)                        }
  | ID               { Id($1)                            }
  | expr PLUS   expr { Binop($1, Add,   $3)              }
  | expr MINUS  expr { Binop($1, Sub,   $3)              }
  | expr TIMES  expr { Binop($1, Mult,  $3)              }
  | expr DIVIDE expr { Binop($1, Div,   $3)              }
  | expr RDIVIDE expr { Binop($1, rDiv,   $3)            }
  | expr EQ     expr { Binop($1, Equal, $3)              }
  | expr LT     expr { Binop($1, Less,  $3)              }
  | expr GT     expr { Binop($1, Greater, $3)            }
  | expr LEQ     expr { Binop($1, Leq,  $3)              }
  | expr GEQ    expr { Binop($1, Geq, $3)                }
  | expr AND    expr { Binop($1, And,   $3)              }
  | expr OR     expr { Binop($1, Or,    $3)              }
  | expr COMP   expr { Binop($1, Comp, $3)               }
  | MINUS expr %prec NOT { Unop(Neg, $2)                 }
  | NOT expr         { Unop(Not, $2)                     }
  | ID ASSIGN expr   { Assign($1, $3)            }
  | ID LBRAC expr RBRAC { Access($1, $3)                 }
  | LPAREN expr RPAREN { $2                              }
  | ID COLON edge { EdgeList(Id($1), $3)}
