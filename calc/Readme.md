### Build the MicroC compiler

```
ocamlbuild -no-hygiene -pkgs llvm calclyst.native
```

### Run the MicroC compiler and generate llvm code
```
./calclyst.native -l example.mc > example.ll
```

### Run the llvm code
```
lli example.ll
```
llc -relocation-model=pic example.ll > example.s
cc -o example.exe example.s stdlib.o
./example.exe > example.out
cat example.out
### Compiler files
-  `ast.ml`: abstract syntax tree (AST) definition
-  `scanner.mll`: scanner
-  `microcparse.mly`: parser
-  `sast.ml`: definition of the semantically-checked AST
-  `semant.ml`: semantic checking
-  `irgen.ml`: LLVM IR code generator

### Other files

- `test1.ml`: the file to test the scanner and parser
- `test2.ml`: the file to test the semantic checker
- `microc.ml`: top-level file to test and run microc compiler
- `example.mc`: a sample microc source code
- `example.out`: a sample compiled code of example.mc
