(* Ocamllex scanner for CalcLyst *)

{ open CaclParse }

let digit = ['0' - '9']
let digits = digit+
let ascii = [' ' - '~']
let escapeChars = ('\\' ['b' 't' 'r' 'n'])

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| "["      { LBRAC }
| "]"      { RBRAC }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| "//"     {RDIVIDE}
| '='      { ASSIGN }
| "=="     { EQ }
| '<'      { LT }
| ">"      { GT }
| "<="      {LEQ}
| ">="      {GEQ}
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| ":"      { COLON }
| "~"      {COMP}
| "if"     { IF }
| "elif"   {ELIF}
| "else"   { ELSE }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "char"   { CHAR }
| "float"  { FLOAT }
| "Graph"  { GRAPH }
| "String" { STRING }
| "Node"   { NODE }
| "Point"  {POINT}
| "Vector" {VECTOR}
| "Real"   {REAL}
| "Imaginary" {IMAGINARY}
| "void"   { VOID }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| digits as lem { LITERAL(int_of_string lem) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lem { FLIT(lem) }
| letter (digit | letter | '_')*  as lem { ID(lem) }
| "'" escapeChars "'"                                 as lem { match lem.[2] with 
                                                                 'b' -> CHRLIT('\b')
                                                                |'t' -> CHRLIT('\t')
                                                                |'r' -> CHRLIT('\r')
                                                                |'n' -> CHRLIT('\n')
                                                                | _ -> raise (Failure "Invalid Escape character")
                                                             } 
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
