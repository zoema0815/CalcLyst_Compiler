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

open Parsing;;
let _ = parse_error;;
# 5 "CalcParse.mly"
open Ast
# 58 "CalcParse.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* LBRAC *);
  263 (* RBRAC *);
  264 (* COMMA *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* TIMES *);
  268 (* DIVIDE *);
  269 (* RDIVIDE *);
  270 (* ASSIGN *);
  271 (* COLON *);
  272 (* COMP *);
  273 (* NOT *);
  274 (* EQ *);
  275 (* LT *);
  276 (* GT *);
  277 (* AND *);
  278 (* OR *);
  279 (* LEQ *);
  280 (* GEQ *);
  281 (* NEQ *);
  282 (* RETURN *);
  283 (* IF *);
  284 (* ELSE *);
  285 (* ELIF *);
  286 (* FOR *);
  287 (* WHILE *);
  288 (* INT *);
  289 (* BOOL *);
  290 (* FLOAT *);
  291 (* VOID *);
  292 (* CHAR *);
  293 (* STRING *);
  294 (* REAL *);
  295 (* IMAGINARY *);
  296 (* COMPLEX *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  297 (* LITERAL *);
  298 (* BLIT *);
  299 (* CHRLIT *);
  300 (* STRLIT *);
  301 (* ID *);
  302 (* FLIT *);
  303 (* RLIT *);
  304 (* ILIT *);
  305 (* CLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\005\000\005\000\003\000\004\000\
\007\000\007\000\009\000\009\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\006\000\006\000\008\000\008\000\
\011\000\011\000\011\000\011\000\011\000\011\000\012\000\012\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\013\000\013\000\
\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\003\000\002\000\000\000\003\000\002\000\008\000\
\000\000\001\000\001\000\003\000\001\000\001\000\001\000\001\000\
\001\000\004\000\001\000\001\000\001\000\001\000\000\000\002\000\
\002\000\003\000\003\000\007\000\012\000\005\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\002\000\
\002\000\003\000\006\000\004\000\003\000\004\000\000\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\013\000\017\000\014\000\016\000\019\000\015\000\
\020\000\022\000\021\000\067\000\000\000\000\000\000\000\000\000\
\001\000\000\000\000\000\004\000\000\000\007\000\003\000\000\000\
\000\000\010\000\000\000\000\000\000\000\033\000\035\000\036\000\
\037\000\000\000\034\000\038\000\039\000\040\000\000\000\000\000\
\000\000\000\000\056\000\057\000\000\000\000\000\000\000\018\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\012\000\000\000\
\061\000\000\000\000\000\064\000\000\000\000\000\000\000\000\000\
\044\000\045\000\046\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\062\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\066\000\000\000\006\000\000\000\000\000\000\000\000\000\
\000\000\008\000\025\000\024\000\000\000\027\000\026\000\000\000\
\000\000\000\000\000\000\000\000\030\000\000\000\000\000\028\000\
\000\000\000\000\000\000\000\000\000\000\029\000"

let yydgoto = "\002\000\
\012\000\013\000\014\000\015\000\086\000\016\000\025\000\095\000\
\026\000\096\000\097\000\103\000\067\000\068\000"

let yysindex = "\003\000\
\062\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\002\000\046\255\062\001\253\254\
\000\000\062\001\062\001\000\000\108\255\000\000\000\000\007\255\
\017\255\000\000\108\255\108\255\108\255\000\000\000\000\000\000\
\000\000\003\255\000\000\000\000\000\000\000\000\220\000\062\001\
\019\255\132\000\000\000\000\000\108\255\108\255\108\255\000\000\
\108\255\108\255\108\255\108\255\108\255\108\255\108\255\108\255\
\108\255\108\255\108\255\108\255\108\255\108\255\000\000\062\001\
\000\000\001\001\024\255\000\000\239\000\018\001\032\255\032\255\
\000\000\000\000\000\000\032\255\069\001\093\255\093\255\052\001\
\035\001\093\255\093\255\069\001\050\255\097\255\108\255\000\000\
\035\255\062\001\097\255\108\255\054\255\055\255\057\255\207\255\
\097\255\000\000\108\255\000\000\059\255\018\001\058\255\108\255\
\108\255\000\000\000\000\000\000\018\001\000\000\000\000\155\000\
\178\000\097\255\097\255\026\255\000\000\097\255\067\255\000\000\
\108\255\201\000\097\255\042\255\097\255\000\000"

let yyrindex = "\000\000\
\060\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\060\000\000\000\
\000\000\060\000\070\255\000\000\000\000\000\000\000\000\073\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\157\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\074\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\048\255\
\000\000\077\255\000\000\000\000\000\000\066\001\232\255\001\000\
\000\000\000\000\000\000\026\000\092\000\112\255\051\000\060\255\
\124\000\059\000\084\000\115\000\000\000\080\255\000\000\000\000\
\182\255\048\255\080\255\085\255\000\000\000\000\000\000\000\000\
\080\255\000\000\000\000\000\000\000\000\086\255\000\000\000\000\
\000\000\000\000\000\000\000\000\083\001\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\254\255\238\255\000\000\008\000\000\000\000\000\177\255\
\048\000\235\255\152\255\000\000\000\000\021\000"

let yytablesize = 614
let yytable = "\039\000\
\024\000\017\000\021\000\001\000\045\000\042\000\043\000\044\000\
\046\000\116\000\117\000\101\000\020\000\120\000\040\000\023\000\
\047\000\108\000\124\000\041\000\126\000\024\000\064\000\066\000\
\069\000\070\000\088\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\084\000\022\000\051\000\052\000\053\000\085\000\018\000\019\000\
\099\000\005\000\090\000\005\000\005\000\118\000\119\000\104\000\
\105\000\005\000\111\000\002\000\053\000\106\000\053\000\110\000\
\005\000\066\000\053\000\053\000\121\000\125\000\102\000\085\000\
\009\000\005\000\005\000\011\000\063\000\109\000\005\000\065\000\
\053\000\053\000\112\000\113\000\023\000\031\000\032\000\063\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\100\000\027\000\122\000\091\000\049\000\050\000\051\000\
\052\000\053\000\028\000\098\000\054\000\027\000\000\000\000\000\
\048\000\029\000\048\000\000\000\000\000\028\000\048\000\048\000\
\000\000\000\000\092\000\093\000\029\000\000\000\000\000\094\000\
\000\000\048\000\048\000\048\000\048\000\048\000\048\000\048\000\
\048\000\030\000\031\000\032\000\033\000\034\000\035\000\036\000\
\037\000\038\000\000\000\000\000\030\000\031\000\032\000\033\000\
\034\000\035\000\036\000\037\000\038\000\041\000\000\000\041\000\
\000\000\000\000\000\000\041\000\041\000\041\000\041\000\041\000\
\041\000\041\000\000\000\000\000\041\000\000\000\041\000\041\000\
\041\000\041\000\041\000\041\000\041\000\041\000\060\000\000\000\
\060\000\000\000\000\000\000\000\060\000\060\000\060\000\060\000\
\060\000\060\000\060\000\000\000\000\000\060\000\000\000\060\000\
\060\000\060\000\060\000\060\000\060\000\060\000\060\000\107\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\049\000\
\050\000\051\000\052\000\053\000\000\000\000\000\054\000\000\000\
\055\000\056\000\057\000\058\000\059\000\060\000\061\000\062\000\
\042\000\000\000\042\000\000\000\000\000\000\000\042\000\042\000\
\042\000\042\000\000\000\000\000\000\000\000\000\000\000\042\000\
\000\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
\042\000\043\000\000\000\043\000\000\000\000\000\000\000\043\000\
\043\000\043\000\043\000\000\000\000\000\000\000\000\000\000\000\
\043\000\000\000\043\000\043\000\043\000\043\000\043\000\043\000\
\043\000\043\000\055\000\000\000\055\000\000\000\000\000\000\000\
\055\000\055\000\055\000\055\000\000\000\000\000\000\000\000\000\
\000\000\055\000\000\000\055\000\055\000\055\000\055\000\055\000\
\055\000\055\000\055\000\049\000\000\000\049\000\000\000\000\000\
\000\000\049\000\049\000\050\000\000\000\050\000\000\000\000\000\
\000\000\050\000\050\000\000\000\049\000\049\000\049\000\049\000\
\049\000\049\000\049\000\049\000\050\000\050\000\050\000\050\000\
\050\000\050\000\050\000\050\000\051\000\000\000\051\000\000\000\
\000\000\000\000\051\000\051\000\047\000\000\000\047\000\000\000\
\000\000\000\000\047\000\047\000\000\000\051\000\051\000\051\000\
\051\000\051\000\051\000\051\000\051\000\047\000\000\000\000\000\
\047\000\047\000\000\000\052\000\047\000\052\000\000\000\000\000\
\000\000\052\000\052\000\000\000\054\000\000\000\054\000\000\000\
\000\000\000\000\054\000\054\000\052\000\000\000\065\000\052\000\
\052\000\000\000\000\000\052\000\049\000\050\000\051\000\052\000\
\053\000\054\000\000\000\054\000\000\000\055\000\056\000\057\000\
\058\000\059\000\060\000\061\000\062\000\114\000\000\000\000\000\
\000\000\000\000\000\000\049\000\050\000\051\000\052\000\053\000\
\000\000\000\000\054\000\000\000\055\000\056\000\057\000\058\000\
\059\000\060\000\061\000\062\000\115\000\000\000\000\000\000\000\
\000\000\000\000\049\000\050\000\051\000\052\000\053\000\000\000\
\000\000\054\000\000\000\055\000\056\000\057\000\058\000\059\000\
\060\000\061\000\062\000\123\000\000\000\000\000\000\000\000\000\
\000\000\049\000\050\000\051\000\052\000\053\000\000\000\000\000\
\054\000\000\000\055\000\056\000\057\000\058\000\059\000\060\000\
\061\000\062\000\048\000\000\000\049\000\050\000\051\000\052\000\
\053\000\000\000\000\000\054\000\000\000\055\000\056\000\057\000\
\058\000\059\000\060\000\061\000\062\000\089\000\000\000\049\000\
\050\000\051\000\052\000\053\000\000\000\000\000\054\000\000\000\
\055\000\056\000\057\000\058\000\059\000\060\000\061\000\062\000\
\087\000\049\000\050\000\051\000\052\000\053\000\000\000\000\000\
\054\000\000\000\055\000\056\000\057\000\058\000\059\000\060\000\
\061\000\062\000\049\000\050\000\051\000\052\000\053\000\000\000\
\000\000\054\000\000\000\055\000\056\000\057\000\058\000\059\000\
\060\000\061\000\062\000\049\000\050\000\051\000\052\000\053\000\
\000\000\000\000\054\000\000\000\055\000\056\000\057\000\058\000\
\000\000\060\000\061\000\062\000\049\000\050\000\051\000\052\000\
\053\000\000\000\058\000\054\000\058\000\055\000\056\000\057\000\
\058\000\058\000\060\000\061\000\062\000\049\000\050\000\051\000\
\052\000\053\000\000\000\059\000\054\000\059\000\000\000\056\000\
\057\000\059\000\059\000\060\000\061\000\003\000\004\000\005\000\
\006\000\007\000\008\000\009\000\010\000\011\000"

let yycheck = "\021\000\
\019\000\000\000\006\001\001\000\002\001\027\000\028\000\029\000\
\006\001\114\000\115\000\091\000\015\000\118\000\008\001\018\000\
\014\001\097\000\123\000\003\001\125\000\040\000\004\001\045\000\
\046\000\047\000\003\001\049\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\057\000\058\000\059\000\060\000\061\000\
\062\000\045\001\011\001\012\001\013\001\064\000\001\001\002\001\
\014\001\002\001\001\001\004\001\005\001\028\001\029\001\002\001\
\002\001\010\001\001\001\000\000\001\001\005\001\003\001\005\001\
\017\001\087\000\007\001\008\001\002\001\028\001\092\000\090\000\
\003\001\026\001\027\001\003\001\003\001\099\000\031\001\003\001\
\021\001\022\001\104\000\105\000\005\001\001\001\001\001\040\000\
\041\001\042\001\043\001\044\001\045\001\046\001\047\001\048\001\
\049\001\090\000\002\001\121\000\004\001\009\001\010\001\011\001\
\012\001\013\001\010\001\087\000\016\001\002\001\255\255\255\255\
\001\001\017\001\003\001\255\255\255\255\010\001\007\001\008\001\
\255\255\255\255\026\001\027\001\017\001\255\255\255\255\031\001\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\041\001\042\001\043\001\044\001\045\001\046\001\047\001\
\048\001\049\001\255\255\255\255\041\001\042\001\043\001\044\001\
\045\001\046\001\047\001\048\001\049\001\001\001\255\255\003\001\
\255\255\255\255\255\255\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\255\255\255\255\016\001\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\001\001\255\255\
\003\001\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\255\255\255\255\016\001\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\001\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\009\001\
\010\001\011\001\012\001\013\001\255\255\255\255\016\001\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\001\001\255\255\003\001\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\255\255\255\255\016\001\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\001\001\255\255\003\001\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\255\255\
\016\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\001\001\255\255\003\001\255\255\255\255\255\255\
\007\001\008\001\009\001\010\001\255\255\255\255\255\255\255\255\
\255\255\016\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\001\001\255\255\003\001\255\255\255\255\
\255\255\007\001\008\001\001\001\255\255\003\001\255\255\255\255\
\255\255\007\001\008\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\001\001\255\255\003\001\255\255\
\255\255\255\255\007\001\008\001\001\001\255\255\003\001\255\255\
\255\255\255\255\007\001\008\001\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\018\001\255\255\255\255\
\021\001\022\001\255\255\001\001\025\001\003\001\255\255\255\255\
\255\255\007\001\008\001\255\255\001\001\255\255\003\001\255\255\
\255\255\255\255\007\001\008\001\018\001\255\255\003\001\021\001\
\022\001\255\255\255\255\025\001\009\001\010\001\011\001\012\001\
\013\001\022\001\255\255\016\001\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\003\001\255\255\255\255\
\255\255\255\255\255\255\009\001\010\001\011\001\012\001\013\001\
\255\255\255\255\016\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\003\001\255\255\255\255\255\255\
\255\255\255\255\009\001\010\001\011\001\012\001\013\001\255\255\
\255\255\016\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\003\001\255\255\255\255\255\255\255\255\
\255\255\009\001\010\001\011\001\012\001\013\001\255\255\255\255\
\016\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\007\001\255\255\009\001\010\001\011\001\012\001\
\013\001\255\255\255\255\016\001\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\007\001\255\255\009\001\
\010\001\011\001\012\001\013\001\255\255\255\255\016\001\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\008\001\009\001\010\001\011\001\012\001\013\001\255\255\255\255\
\016\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\009\001\010\001\011\001\012\001\013\001\255\255\
\255\255\016\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\009\001\010\001\011\001\012\001\013\001\
\255\255\255\255\016\001\255\255\018\001\019\001\020\001\021\001\
\255\255\023\001\024\001\025\001\009\001\010\001\011\001\012\001\
\013\001\255\255\001\001\016\001\003\001\018\001\019\001\020\001\
\007\001\008\001\023\001\024\001\025\001\009\001\010\001\011\001\
\012\001\013\001\255\255\001\001\016\001\003\001\255\255\019\001\
\020\001\007\001\008\001\023\001\024\001\032\001\033\001\034\001\
\035\001\036\001\037\001\038\001\039\001\040\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LBRAC\000\
  RBRAC\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  RDIVIDE\000\
  ASSIGN\000\
  COLON\000\
  COMP\000\
  NOT\000\
  EQ\000\
  LT\000\
  GT\000\
  AND\000\
  OR\000\
  LEQ\000\
  GEQ\000\
  NEQ\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  ELIF\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  FLOAT\000\
  VOID\000\
  CHAR\000\
  STRING\000\
  REAL\000\
  IMAGINARY\000\
  COMPLEX\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  BLIT\000\
  CHRLIT\000\
  STRLIT\000\
  ID\000\
  FLIT\000\
  RLIT\000\
  ILIT\000\
  CLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 37 "CalcParse.mly"
            ( _1)
# 421 "CalcParse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "CalcParse.mly"
                 ( ([], [])               )
# 427 "CalcParse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 41 "CalcParse.mly"
                    ( ((_1 :: fst _3), snd _3) )
# 435 "CalcParse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdecl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 42 "CalcParse.mly"
               ( (fst _2, (_1 :: snd _2)) )
# 443 "CalcParse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "CalcParse.mly"
              ( [] )
# 449 "CalcParse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl_list) in
    Obj.repr(
# 46 "CalcParse.mly"
                           (  _1 :: _3 )
# 457 "CalcParse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ_rule) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "CalcParse.mly"
              ( (_1, _2) )
# 465 "CalcParse.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 55 "CalcParse.mly"
  (
    {
      rtyp=fst _1;
      fname=snd _1;
      formals=_3;
      locals=_6;
      body=_7
    }
  )
# 483 "CalcParse.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "CalcParse.mly"
              ( [] )
# 489 "CalcParse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 68 "CalcParse.mly"
                 ( _1 )
# 496 "CalcParse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 71 "CalcParse.mly"
        ( [_1] )
# 503 "CalcParse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 72 "CalcParse.mly"
                             ( _1::_3 )
# 511 "CalcParse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "CalcParse.mly"
           ( Int    )
# 517 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "CalcParse.mly"
           ( Float  )
# 523 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "CalcParse.mly"
           ( String )
# 529 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "CalcParse.mly"
           ( Void   )
# 535 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 79 "CalcParse.mly"
           ( Bool   )
# 541 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'typ_rule) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 80 "CalcParse.mly"
                              ( Array(_1, _3) )
# 549 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "CalcParse.mly"
           ( Char   )
# 555 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "CalcParse.mly"
           ( Real   )
# 561 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 83 "CalcParse.mly"
            (Complex)
# 567 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "CalcParse.mly"
              (Imaginary)
# 573 "CalcParse.ml"
               : 'typ_rule))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "CalcParse.mly"
                ( [] )
# 579 "CalcParse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 90 "CalcParse.mly"
                    ( _1::_2 )
# 587 "CalcParse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 93 "CalcParse.mly"
                                            ( Expr _1               )
# 594 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 94 "CalcParse.mly"
                                            ( Return _2             )
# 601 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 95 "CalcParse.mly"
                                            ( Block(_2)    )
# 608 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "CalcParse.mly"
                                            ( If(_3, _5, _7)        )
# 617 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 9 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 7 : 'stmt) in
    let _8 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _10 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _12 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 97 "CalcParse.mly"
                                                                         ( Elif(_3, _5, _8, _10, _12)        )
# 628 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 98 "CalcParse.mly"
                                            ( While(_3, _5)         )
# 636 "CalcParse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "CalcParse.mly"
                                ( Noexpr )
# 642 "CalcParse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "CalcParse.mly"
                                ( _1     )
# 649 "CalcParse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 105 "CalcParse.mly"
                     ( Literal(_1)                       )
# 656 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 106 "CalcParse.mly"
                     ( FLit(_1)                          )
# 663 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 107 "CalcParse.mly"
                     ( BoolLit(_1)                       )
# 670 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 108 "CalcParse.mly"
                     ( ChrLit(_1)                        )
# 677 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "CalcParse.mly"
                     ( StrLit(_1)                        )
# 684 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "CalcParse.mly"
                     ( RLit(_1)                          )
# 691 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "CalcParse.mly"
                     ( ILit(_1)                          )
# 698 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "CalcParse.mly"
                     ( CLit(_1)                          )
# 705 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "CalcParse.mly"
                     ( Id(_1)                            )
# 712 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "CalcParse.mly"
                     ( Binop(_1, Add,   _3)              )
# 720 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "CalcParse.mly"
                     ( Binop(_1, Sub,   _3)              )
# 728 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "CalcParse.mly"
                     ( Binop(_1, Mul,  _3)               )
# 736 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "CalcParse.mly"
                     ( Binop(_1, Div,   _3)              )
# 744 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "CalcParse.mly"
                      ( Binop(_1, Rdiv,   _3)            )
# 752 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "CalcParse.mly"
                     ( Binop(_1, Equal, _3)              )
# 760 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "CalcParse.mly"
                     ( Binop(_1, Less,  _3)              )
# 768 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "CalcParse.mly"
                     ( Binop(_1, Greater, _3)            )
# 776 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "CalcParse.mly"
                      ( Binop(_1, Leq,  _3)              )
# 784 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "CalcParse.mly"
                     ( Binop(_1, Geq, _3)                )
# 792 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "CalcParse.mly"
                     ( Binop(_1, Neq, _3)                )
# 800 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "CalcParse.mly"
                     ( Binop(_1, And,   _3)              )
# 808 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "CalcParse.mly"
                     ( Binop(_1, Or,    _3)              )
# 816 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "CalcParse.mly"
                       ( Binop(_1, Comp,    _3)          )
# 824 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "CalcParse.mly"
                         ( Unop(Neg, _2)                 )
# 831 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "CalcParse.mly"
                     ( Unop(Not, _2)                     )
# 838 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "CalcParse.mly"
                     ( Assign(_1, _3, Noexpr)            )
# 846 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "CalcParse.mly"
                                    ( Assign(_1, _3, _6) )
# 855 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 132 "CalcParse.mly"
                        ( Access(_1, _3)                 )
# 863 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 133 "CalcParse.mly"
                       ( _2                              )
# 870 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 134 "CalcParse.mly"
                              ( Call (_1, _3)  )
# 878 "CalcParse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "CalcParse.mly"
              ( [] )
# 884 "CalcParse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 139 "CalcParse.mly"
         ( _1 )
# 891 "CalcParse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "CalcParse.mly"
        ( [_1] )
# 898 "CalcParse.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 143 "CalcParse.mly"
                    ( _1::_3 )
# 906 "CalcParse.ml"
               : 'args))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
