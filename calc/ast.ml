(* Abstract Syntax Tree and functions for printing it *)

type bop = Add | Sub | Mul | Div | Rdiv | Mod | Equal | Neq | Less | And | Or | Comp |
          Greater | Leq | Geq

type uop = Neg | Not


type expr =
    Literal of int
  | FLit of string
  | BoolLit of bool
  | RLit of string
  | ILit of string 
  | CLit of string
  | ChrLit of char
  | StrLit of string
  | Id of string
  | Binop of expr * bop * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Access of string * expr
  (* function call *)
  | Call of string * expr list
  | Noexpr

type typ = Void | Int | String | Float | Bool | Char | Real | Imaginary | Complex |  Array of typ * expr

type stmt =
    Block of stmt list
  | Expr of expr
  | If of expr * stmt * stmt
  | Elif of expr * stmt * expr * stmt * stmt
  | While of expr * stmt
  (* return *)
  | Return of expr

(* int x: name binding *)
type bind = typ * string

(* func_def: ret_typ fname formals locals body *)
type func_def = {
  rtyp: typ;
  fname: string;
  formals: bind list;
  locals: bind list;
  body: stmt list;
}

type program = bind list * func_def list

(* Pretty-printing functions *)
let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mul -> "*"
  | Div -> "/"
  | Rdiv -> "//"
  | Equal -> "=="
  | Less -> "<"
  | Greater -> ">"
  | Comp -> "~"
  | Leq -> "<="
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | Mod -> "%"
  | Neq -> "!="

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | FLit(l) -> l
  | RLit(l) -> l
  | ILit(l) -> l
  | CLit(l) -> l
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | StrLit(str) -> str
  | ChrLit(c) -> Char.escaped c
  | Id(s) -> s
  | Binop(e1, o, e2) ->
    string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Access(id, e) -> id ^ "[" ^ string_of_expr e ^ "]"
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
   | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n" 
  | Elif(e1, s1, e2, s2, s3) -> "if (" ^ string_of_expr e1 ^ ")\n" ^
      string_of_stmt s1 ^ "elif (" ^ string_of_expr e2 ^ ")\n" ^
      string_of_stmt s2 ^ "else\n" ^ string_of_stmt s3

let rec string_of_typ = function
    Void        -> "void"
  | Int         -> "int"
  | Float       -> "float"
  | String      -> "String"
  | Bool        -> "bool"
  | Char        -> "char"
  | Real        -> "Real"
  | Imaginary   -> "Imaginary"
  | Complex     -> "Complex"
  | Array(t, e) -> string_of_typ t ^ "[" ^ string_of_expr e ^ "]"

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.rtyp ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  "\n\nParsed program: \n\n" ^
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)
