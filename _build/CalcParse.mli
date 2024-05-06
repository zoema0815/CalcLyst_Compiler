type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRAC
  | RBRAC
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | RDIVIDE
  | ASSIGN
  | COLON
  | COMP
  | NOT
  | EQ
  | LT
  | GT
  | AND
  | OR
  | LEQ
  | GEQ
  | NEQ
  | RETURN
  | IF
  | ELSE
  | ELIF
  | FOR
  | WHILE
  | INT
  | BOOL
  | FLOAT
  | VOID
  | CHAR
  | STRING
  | REAL
  | IMAGINARY
  | COMPLEX
  | LITERAL of (int)
  | BLIT of (bool)
  | CHRLIT of (char)
  | STRLIT of (string)
  | ID of (string)
  | FLIT of (string)
  | RLIT of (string)
  | ILIT of (string)
  | CLIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
