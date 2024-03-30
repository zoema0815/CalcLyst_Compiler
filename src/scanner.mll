{
  open Parser
}

let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let identifier = letter (letter | digit | '_')*
let integer = digit+
let string = '"' [^'"']* '"'

rule token = parse
  | [' ' '\t' '\r' '\n'] { token lexbuf }
  | "int" { INT }
  | "string" { STRING }
  | "if" { IF }
  | "else" { ELSE }
  | "for" { FOR }
  | "while" { WHILE }
  | "==" { EQUALS }
  | integer as int_lit { INT_LIT(int_of_string int_lit) }
  | string as str_lit { STRING_LIT(str_lit) }
  | identifier as id { IDENT(id) }
  | "{" { LBRACE }
  | "}" { RBRACE }
  | ";" { SEMICOLON }
  | "Print" { PRINT }
  | "("     { LPAREN }
  | ")"     { RPAREN }
  | "=" { ASSIGN }
  | eof { EOF }
  | _ { raise (Failure "lexing: unexpected character") }
