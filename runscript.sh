cd /home/hjb/calclyst

ocamlbuild -no-hygiene -pkgs llvm calclyst.native

./calclyst.native -l example.mc > example.ll
llc -relocation-model=pic example.ll > example.s
cc -o example.exe example.s stdlib.o
./example.exe > example.out
cat example.out