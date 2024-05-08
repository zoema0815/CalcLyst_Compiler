Ocaml Version: 4.08.1
LLVM version: 10.0.1

### Build the CalcLyst compiler

```
ocamlbuild -no-hygiene -pkgs llvm calclyst.native
```

### Run the Calclyst compiler and generate llvm code
```
llc -relocation-model=pic example.ll > example.s
gcc -c stdlib.c -o stdlib.o
cc -o example.exe example.s stdlib.o
./example.exe > example.out
```

### cat the output llvm code
```
cat example.out
```

### Compiler files
-  `ast.ml`: abstract syntax tree (AST) definition
-  `scanner.mll`: scanner
-  `CalcParse.mly`: parser
-  `sast.ml`: definition of the semantically-checked AST
-  `semant.ml`: semantic checking
-  `irgen.ml`: LLVM IR code generator

### Other files

- `calclyst.ml`: top-level file to test and run microc compiler
- `example.cl`: a sample calclyst source code
- `example.out`: a sample compiled code of example.cl
