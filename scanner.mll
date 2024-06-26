(* Ocamllex scanner for CalcLyst *)

{ open CalcParse
 let chop_last_char str = 
    String.sub str 0 (String.length str - 1) }

let digit = ['0' - '9']
let digits = digit+
let letter = ['a'-'z' 'A'-'Z']
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
| '~'      { COMP  }
| '/'      { DIVIDE }
| "//"     { RDIVIDE }
| '='      { ASSIGN }
| "=="     { EQ }
| '<'      { LT }
| ">"      { GT }
| "<="      {LEQ}
| ">="      {GEQ}
| "!="     { NEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| ":"      { COLON }
| "if"     { IF }
| "elif"   {ELIF}
| "else"   { ELSE }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "char"   { CHAR }
| "float"  { FLOAT }
| "String" { STRING }
| "Real"   {REAL}
| "Imaginary" {IMAGINARY}
| "Complex" {COMPLEX}
| "void"   { VOID }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| digits as lem { LITERAL(int_of_string lem) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? '@' digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? 'i' as lem { CLIT(lem)  }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )?  as lem { FLIT(lem) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? 'r' as lem { RLIT(lem) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? 'i' as lem { ILIT(lem) }

| letter (digit | letter | '_')*  as lem { ID(lem) }
| "'" escapeChars "'"                                 as lem { match lem.[2] with 
                                                                 'b' -> CHRLIT('\b')
                                                                |'t' -> CHRLIT('\t')
                                                                |'r' -> CHRLIT('\r')
                                                                |'n' -> CHRLIT('\n')
                                                                | _ -> raise (Failure "Invalid Escape character")
                                                             } 
| "'" ascii "'"                                       as lxm { CHRLIT(String.get lxm 1) } 
| '"' (( ascii # '"' )* escapeChars*)+ '"'            as lxm { STRLIT(String.sub lxm 1 ((String.length lxm )-2) ) }                                                            
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
