(* Semantically-checked Abstract Syntax Tree and functions for printing it *)

open Ast

type sexpr = typ * sx
and sx =
    SLiteral of int
  | SFLit of string
  | SRLit of string
  | SILit of string 
  | SCLit of string
  | SBoolLit of bool
  | SChrLit of char
  | SStrLit of string
  | SId of string
  | SBinop of sexpr * bop * sexpr
  | SUnop of uop * sexpr
  | SCall of string * sexpr list
  | SAssign of string * sexpr
  | SAccess of string * sexpr
  | SNoexpr

type sstmt =
    SBlock of sstmt list
  | SExpr of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SElif of sexpr * sstmt * sexpr * sstmt * sstmt
  | SWhile of sexpr * sstmt
  | SReturn of sexpr

(* func_def: ret_typ fname formals locals body *)
type sfunc_def = {
  srtyp: typ;
  sfname: string;
  sformals: bind list;
  slocals: bind list;
  sbody: sstmt list;
}

type sprogram = bind list * sfunc_def list



(* Pretty-printing functions *)
let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
        SLiteral(l) -> string_of_int l
      | SFLit(l) -> l
      | SRLit(l) -> l 
      | SILit(l) -> l
      | SCLit(l) -> l
      | SBoolLit(true) -> "true"
      | SBoolLit(false) -> "false"
      | SStrLit(str) -> str
      | SChrLit(c) -> Char.escaped c
      | SId(s) -> s
      | SBinop(e1, o, e2) ->
        string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
      | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
      | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
      | SNoexpr -> ""
      | SAccess(id, e) -> id ^ "[" ^ string_of_sexpr e ^ "]"
      | SCall(f, el) ->
          f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
    ) ^ ")"

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SIf(e, s, SBlock([])) -> "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
    string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2
  | SWhile(e, s) -> "while (" ^ string_of_sexpr e ^ ") " ^ string_of_sstmt s
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n" 
  | SElif(e1, s1, e2, s2, s3) -> "if (" ^ string_of_sexpr e1 ^ ")\n" ^
      string_of_sstmt s1 ^ "elif (" ^ string_of_sexpr e2 ^ ")\n" ^
      string_of_sstmt s2 ^ "else\n" ^ string_of_sstmt s3

let string_of_sfdecl fdecl =
  string_of_typ fdecl.srtyp ^ " " ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.slocals) ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

let string_of_sprogram (vars, funcs) =
  "\n\nSementically checked program: \n\n" ^
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
