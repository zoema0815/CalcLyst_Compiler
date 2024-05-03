(* IR generation: translate takes a semantically checked AST and
   produces LLVM IR

   LLVM tutorial: Make sure to read the OCaml version of the tutorial

   http://llvm.org/docs/tutorial/index.html

   Detailed documentation on the OCaml LLVM library:

   http://llvm.moe/
   http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in

  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "Calclyst" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context in
  (* Return the LLVM type for a calclyst type *)
  let rec ltype_of_typ = function
      A.Int       -> i32_t
    | A.Bool      -> i1_t
    | A.Void      -> i32_t
    | A.String    -> i32_t
    | A.Float     -> i32_t
    | A.Char      -> i8_t
    | A.Real      -> i32_t
    | A.Imaginary -> i32_t
    | A.Array (t, e)    -> let num =(match e with
                           Literal(l) -> l
                         | _ -> raise(Failure("Can not declare array's length with non integer expr type."))
                        )
                        in L.array_type (ltype_of_typ t) num 
  in

  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) =
      let init = L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype =
    L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
    L.declare_function "printf" printf_t the_module in

  (* Define each function (arguments and return type) so we can
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_def) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types =
        Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.srtyp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in

  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in

    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p =
        L.set_value_name n p;
        let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
        StringMap.add n local m

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
        let local_var = L.build_alloca (ltype_of_typ t) n builder
        in StringMap.add n local_var m
      in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals
    in

    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
      with Not_found -> StringMap.find n global_vars
    in

    (* Construct code for an expression; return its value *)
    let rec build_expr builder ((_, e) : sexpr) = match e with
        SLiteral i  -> L.const_int i32_t i
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SFLit f -> L.const_float_of_string i32_t f
      | SRLit r -> L.const_float_of_string i32_t r
      | SILit i -> L.const_float_of_string i32_t i
      | SId s -> L.build_load (lookup s) s builder
      | SChrLit c -> L.const_int i32_t (Char.code c)
      | SStrLit s -> L.build_global_stringptr s "fmt" builder

      | SAssign (s, e) -> let e' = build_expr builder e in
        ignore(L.build_store e' (lookup s) builder); e'
      | SBinop ((A.Float,_ ) as e1, op, e2) ->
          let e1' = build_expr builder e1
        and e2' = build_expr builder e2  in
          (match op with 
            A.Add     -> L.build_fadd
          | A.Sub     -> L.build_fsub
          | A.Mul    -> L.build_fmul
          | A.Div     -> L.build_fdiv 
          | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
          | A.Less    -> L.build_fcmp L.Fcmp.Olt
          | A.Greater -> L.build_fcmp L.Fcmp.Ogt
          | A.Leq     -> L.build_fcmp L.Fcmp.Ole
          | A.Geq     -> L.build_fcmp L.Fcmp.Oge
          | A.And | A.Or | A.Mod->
              raise (Failure "internal error: semant should have rejected and/or on float")
                | _ -> raise (Failure "This float binop is not implemented")
          ) e1' e2' "tmp" builder
      (*|  SBinop (((A.String,_ )) as e, op, e2) ->
          if op == A.Add then
                L.build_call sconcat_func [| (build_expr builder e); (ebuild_expr builder e2)  |]
	        "sconcat" builder
          else
                raise (Failure "internal error: can only concatenate (+) strings") *)
      | SBinop (e1, op, e2) ->
        let e1' = build_expr builder e1
        and e2' = build_expr builder e2 in
        (match op with
           A.Add     -> L.build_add
         | A.Sub     -> L.build_sub
         | A.Mul     -> L.build_mul
         | A.Div     -> L.build_fdiv
         | A.Rdiv    -> L.build_sdiv
         | A.Mod     -> L.build_srem
         | A.And     -> L.build_and
         | A.Or      -> L.build_or
         | A.Equal   -> L.build_icmp L.Icmp.Eq
         | A.Neq     -> L.build_icmp L.Icmp.Ne
         | A.Less    -> L.build_icmp L.Icmp.Slt
         | A.Greater -> L.build_icmp L.Icmp.Sgt
         | A.Leq     -> L.build_icmp L.Icmp.Sle
         | A.Geq     -> L.build_icmp L.Icmp.Sge
        ) e1' e2' "tmp" builder
      | SCall ("print", [e]) ->
        L.build_call printf_func [| int_format_str ; (build_expr builder e) |]
          "printf" builder
      | SCall (f, args) ->
        let (fdef, fdecl) = StringMap.find f function_decls in
        let llargs = List.rev (List.map (build_expr builder) (List.rev args)) in
        let result = f ^ "_result" in
        L.build_call fdef (Array.of_list llargs) result builder
      | SAccess (s, e) -> let index = (match e with
                             (Int, _)          -> build_expr builder e
                           | _                 -> raise(Failure("This should have been caught by semant.ml"))
                          ) in
                          let indices = 
                            (Array.of_list [L.const_int i32_t 0; index]) in 
                          let ptr =  
                            L.build_in_bounds_gep (lookup s) indices (s^"_ptr_") builder
                          in L.build_load ptr (s^"_elem_") builder
      |SUnop(op, ((t, _) as e)) ->
          let e' = build_expr builder e in
	      (match op with
          A.Neg when t = A.Float -> L.build_fneg 
          | A.Neg                  -> L.build_neg
          | A.Not                  -> L.build_not) e' "tmp" builder
      | _ -> raise (Failure("Unhandled case: unimplemented")) 
    in

    (* LLVM insists each basic block end with exactly one "terminator"
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (instr builder) in

    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)
    let rec build_stmt builder = function
        SBlock sl -> List.fold_left build_stmt builder sl
      | SExpr e -> ignore(build_expr builder e); builder
      | SReturn e -> ignore(L.build_ret (build_expr builder e) builder); builder
      | SIf (predicate, then_stmt, else_stmt) ->
        let bool_val = build_expr builder predicate in

        let then_bb = L.append_block context "then" the_function in
        ignore (build_stmt (L.builder_at_end context then_bb) then_stmt);
        let else_bb = L.append_block context "else" the_function in
        ignore (build_stmt (L.builder_at_end context else_bb) else_stmt);

        let end_bb = L.append_block context "if_end" the_function in
        let build_br_end = L.build_br end_bb in (* partial function *)
        add_terminal (L.builder_at_end context then_bb) build_br_end;
        add_terminal (L.builder_at_end context else_bb) build_br_end;

        ignore(L.build_cond_br bool_val then_bb else_bb builder);
        L.builder_at_end context end_bb
      | SElif (ifpredicate, ifstmt, elifpredicate, elifstmt, elsestmt) ->
          let then_bb = L.append_block context "elif_then" the_function in
          let else_bb = L.append_block context "elif_else" the_function in
          let end_bb = L.append_block context "elif_end" the_function in

          let bool_val_if = build_expr builder ifpredicate in
          ignore (L.build_cond_br bool_val_if then_bb else_bb builder);

          (* Build "if" branch *)
          let then_builder = L.builder_at_end context then_bb in
          ignore (build_stmt then_builder ifstmt);
          add_terminal then_builder (L.build_br end_bb);

          (* Build "else" branch *)
          let else_builder = L.builder_at_end context else_bb in
          let bool_val_elif = build_expr else_builder elifpredicate in
          ignore (L.build_cond_br bool_val_elif then_bb else_bb else_builder);
          ignore (build_stmt else_builder elifstmt);
          add_terminal else_builder (L.build_br end_bb);

          (* Build "end" block *)
          L.builder_at_end context end_bb
      | SWhile (predicate, body) ->
        let while_bb = L.append_block context "while" the_function in
        let build_br_while = L.build_br while_bb in (* partial function *)
        ignore (build_br_while builder);
        let while_builder = L.builder_at_end context while_bb in
        let bool_val = build_expr while_builder predicate in

        let body_bb = L.append_block context "while_body" the_function in
        add_terminal (build_stmt (L.builder_at_end context body_bb) body) build_br_while;

        let end_bb = L.append_block context "while_end" the_function in

        ignore(L.build_cond_br bool_val body_bb end_bb while_builder);
        L.builder_at_end context end_bb

    in
    (* Build the code for each statement in the function *)
    let func_builder = build_stmt builder (SBlock fdecl.sbody) in

    (* Add a return if the last block falls off the end *)
    add_terminal func_builder (L.build_ret (L.const_int i32_t 0))

  in

  List.iter build_function_body functions;
  the_module
