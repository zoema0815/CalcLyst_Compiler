type bop = Add | Sub | Mult | Div | rDiv | Equal | Less | Greater | Leq | Geq
          And | Or | Mod | Comp

type uop = Neg | Not

type expr =
    Literal of int
  | FLit of string
  | BoolLit of bool
  | ChrLit of char
  | StrLit of string
  | Id of string
  | Binop of expr * bop * expr
  | Unop of uop * expr
  | Assign of string * expr 
  | Access of string * expr
  | EdgeList of expr * expr list
  | EdgeOp of expr * expr * bop * expr * expr
  | Noexpr

type typ = Void | Int | String | Float | Bool | Char | Real | Imaginary |  Array of typ * expr
         | Node | Edge| Graph | Point | Vector
 
type bind = typ * string

type stmt =
    Block of stmt list
  | Expr of expr
  | If of expr * stmt * stmt
  | ELIF of expr * stmt * expr * stmt * stmt
  | While of expr * stmt
  | Return of expr

type program = {
  locals: bind list;
  body: stmt list;
}

(* Pretty-printing functions *)
let string_of_bop = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | rDiv -> "//"
  | Equal -> "=="
  | Less -> "<"
  | Greater -> ">"
  | Leq -> "<="
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | Mod -> "%"
  | Comp -> "~"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | FLit(l) -> l
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | NodeLit(_, name) -> string_of_expr name
  | GraphLit(name) -> name
  | StrLit(str) -> str
  | ChrLit(c) -> Char.escaped c
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e1, e2) -> 
      (match e2 with 
         Noexpr -> v ^ " = " ^ string_of_expr e1
       | _ -> v ^ "[" ^ string_of_expr e1 ^ "]" ^ " = " ^ string_of_expr e2 
      )
  | Access(id, e) -> id ^ "[" ^ string_of_expr e ^ "]"
  | Noexpr -> ""
  | EdgeOp(_, e1, o, e3, e4) -> string_of_expr e1 ^ " " ^ string_of_op o ^ "|" 
        ^ string_of_expr e3 ^ "| " ^ string_of_expr e4

type typ = Void | Int | String | Float | Bool | Char | Real | Imaginary |  Array of typ * expr
         | Node | Edge| Graph | Point | Vector
let rec string_of_typ = function
    Void        -> "void"
  | Int         -> "int"
  | Float       -> "float"
  | String      -> "String"
  | Bool        -> "bool"
  | Char        -> "char"
  | Real        -> "Real"
  | Imaginary   -> "Imaginary"
  | Node        -> "Node"
  | Graph       -> "Graph"
  | Edge        -> "Edge"
  | Point       -> "Point"
  | Vector      -> "Vector"
  | Array(t, e) -> string_of_typ t ^ "[" ^ string_of_expr e ^ "]"

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
  | Binding(t, id) -> string_of_typ t ^ " " ^ id ^ ";\n"
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n" 
 
let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (stmts, funcs) =
  String.concat "" (List.map string_of_stmt stmts) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)

