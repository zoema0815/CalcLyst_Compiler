ocamlbuild -no-hygiene -pkgs llvm calclyst.native
./calclyst.native -l example.cl > example.ll
llc -relocation-model=pic example.ll > example.s
gcc -c stdlib.c -o stdlib.o
cc -o example.exe example.s stdlib.o
./example.exe > example.out
cat example.out