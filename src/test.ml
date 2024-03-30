type identifier = string
type value =
  | Int of int
  | String of string

type expression =
  | Var of identifier
  | Val of value
  | Equals of expression * expression

type statement =
  | Declaration of identifier * value
  | Print of expression
  | ForLoop of identifier * expression * expression * expression * statement list
  | WhileLoop of expression * statement list
  | IfElse of expression * statement list * statement list

type program = Program of statement list

let rec print_value = function
  | Int(i) -> Printf.sprintf "%d" i
  | String(s) -> Printf.sprintf "\"\"%s\"\"" s

and print_expression = function
  | Var(id) -> id
  | Val(v) -> print_value v
  | Equals(e1, e2) -> Printf.sprintf "%s == %s" (print_expression e1) (print_expression e2)

let rec print_statements stmts =
  String.concat "\n" (List.map print_statement stmts)

and print_statement = function
  | Declaration(id, v) -> Printf.sprintf "int %s = %s;" id (print_value v)
  | Print(expr) -> Printf.sprintf "Print(%s);" (print_expression expr)
  | ForLoop(id, start, cond, step, stmts) ->
      Printf.sprintf "for (%s = %s; %s; %s) {\n%s\n}" id (print_expression start) (print_expression cond) (print_expression step) (print_statements stmts)
  | WhileLoop(cond, stmts) ->
      Printf.sprintf "while (%s) {\n%s\n}" (print_expression cond) (print_statements stmts)
  | IfElse(cond, stmts_true, stmts_false) ->
      Printf.sprintf "if (%s) {\n%s\n} else {\n%s\n}" (print_expression cond) (print_statements stmts_true) (print_statements stmts_false)

let rec print_value = function
  | Int(i) -> Printf.sprintf "%d" i
  | String(s) -> Printf.sprintf "\"%s\"" s

and print_expression = function
  | Var(id) -> id
  | Val(v) -> print_value v
  | Equals(e1, e2) -> Printf.sprintf "%s == %s" (print_expression e1) (print_expression e2)

let rec print_statements stmts =
  String.concat "\n" (List.map print_statement stmts)

and print_statement = function
  | Declaration(id, v) -> Printf.sprintf "int %s = %s;" id (print_value v)
  | Print(expr) -> Printf.sprintf "Print(%s);" (print_expression expr)
  | ForLoop(id, start, cond, step, stmts) ->
      Printf.sprintf "for (%s = %s; %s; %s) {\n%s\n}" id (print_expression start) (print_expression cond) (print_expression step) (print_statements stmts)
  | WhileLoop(cond, stmts) ->
      Printf.sprintf "while (%s) {\n%s\n}" (print_expression cond) (print_statements stmts)
  | IfElse(cond, stmts_true, stmts_false) ->
      Printf.sprintf "if (%s) {\n%s\n} else {\n%s\n}" (print_expression cond) (print_statements stmts_true) (print_statements stmts_false)

let print_program (Program(stmts)) =
  print_statements stmts

