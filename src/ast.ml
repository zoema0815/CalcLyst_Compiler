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
