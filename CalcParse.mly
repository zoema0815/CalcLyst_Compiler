/* Ocamlyacc parser for CalcLyst 
*/

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE LBRAC RBRAC COMMA PLUS MINUS TIMES DIVIDE RDIVIDE ASSIGN COLON COMP
%token NOT EQ LT GT AND OR LEQ GEQ NEQ
%token RETURN IF ELSE ELIF FOR WHILE INT BOOL FLOAT VOID CHAR STRING REAL IMAGINARY COMPLEX
%token <int> LITERAL
%token <bool> BLIT
%token <char> CHRLIT
%token <string> STRLIT
%token <string> ID FLIT RLIT ILIT CLIT
%token EOF


%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ COLON NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS COMP
%left TIMES DIVIDE RDIVIDE
%right NOT
%left COMMA
%%

/* add function declarations*/
program:
  decls EOF { $1}

decls:
   /* nothing */ { ([], [])               }
 | vdecl SEMI decls { (($1 :: fst $3), snd $3) }
 | fdecl decls { (fst $2, ($1 :: snd $2)) }

vdecl_list:
  /*nothing*/ { [] }
  | vdecl SEMI vdecl_list  {  $1 :: $3 }

/* int x */
vdecl:
  typ_rule ID { ($1, $2) }

/* fdecl */
fdecl:
  vdecl LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
  {
    {
      rtyp=fst $1;
      fname=snd $1;
      formals=$3;
      locals=$6;
      body=$7
    }
  }

  /* formals_opt */
formals_opt:
  /*nothing*/ { [] }
  | formals_list { $1 }

formals_list:
  vdecl { [$1] }
  | vdecl COMMA formals_list { $1::$3 }

typ_rule:
    INT    { Int    }
  | FLOAT  { Float  }
  | STRING { String }
  | VOID   { Void   }
  | BOOL   { Bool   }
  | typ_rule LBRAC expr RBRAC { Array($1, $3) }
  | CHAR   { Char   }
  | REAL   { Real   }
  | COMPLEX {Complex}
  | IMAGINARY {Imaginary}


  
stmt_list:
  /* nothing */ { [] }
  | stmt stmt_list  { $1::$2 }

stmt:
    expr SEMI                               { Expr $1               }
  | RETURN expr_opt SEMI                    { Return $2             }
  | LBRACE stmt_list RBRACE                 { Block($2)    }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | IF LPAREN expr RPAREN stmt ELIF LPAREN expr RPAREN stmt ELSE stmt    { Elif($3, $5, $8, $10, $12)        }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)         }


expr_opt: /* can be expr or nothing */
        /* epsilon/nothing */   { Noexpr }
      | expr                    { $1     }
expr:
    LITERAL          { Literal($1)                       }
  | FLIT             { FLit($1)                          }
  | BLIT             { BoolLit($1)                       }
  | CHRLIT           { ChrLit($1)                        }
  | STRLIT           { StrLit($1)                        }
  | RLIT             { RLit($1)                          }
  | ILIT             { ILit($1)                          }
  | CLIT             { CLit($1)                          }    
  | ID               { Id($1)                            }
  | expr PLUS   expr { Binop($1, Add,   $3)              }
  | expr MINUS  expr { Binop($1, Sub,   $3)              }
  | expr TIMES  expr { Binop($1, Mul,  $3)               }
  | expr DIVIDE expr { Binop($1, Div,   $3)              }
  | expr RDIVIDE expr { Binop($1, Rdiv,   $3)            }
  | expr EQ     expr { Binop($1, Equal, $3)              }
  | expr LT     expr { Binop($1, Less,  $3)              }
  | expr GT     expr { Binop($1, Greater, $3)            }
  | expr LEQ     expr { Binop($1, Leq,  $3)              }
  | expr GEQ    expr { Binop($1, Geq, $3)                }
  | expr NEQ    expr { Binop($1, Neq, $3)                }
  | expr AND    expr { Binop($1, And,   $3)              }
  | expr OR     expr { Binop($1, Or,    $3)              }
  | expr COMP     expr { Binop($1, Comp,    $3)          }
  | MINUS expr %prec NOT { Unop(Neg, $2)                 }
  | NOT expr         { Unop(Not, $2)                     }
  | ID ASSIGN expr   { Assign($1, $3)            }
  | ID LBRAC expr RBRAC { Access($1, $3)                 }
  | LPAREN expr RPAREN { $2                              }
  | ID LPAREN args_opt RPAREN { Call ($1, $3)  }

  /* args_opt*/
args_opt:
  /*nothing*/ { [] }
  | args { $1 }

args:
  expr  { [$1] }
  | expr COMMA args { $1::$3 }

