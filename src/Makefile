OCAMLC=ocamlc
OCAMLLEX=ocamllex
OCAMLYACC=ocamlyacc
OCAMLFLAGS=-g

SCANNER_SRC=scanner.mll
PARSER_SRC=parser.mly
MAIN_SRC=test.ml

SCANNER_GEN=scanner.ml
PARSER_ML=parser.ml
PARSER_MLI=parser.mli
PARSER_GEN=$(PARSER_ML) $(PARSER_MLI)

TARGET=program

all: $(TARGET)

$(TARGET): $(MAIN_SRC:.ml=.cmo) $(SCANNER_GEN:.ml=.cmo) $(PARSER_ML:.ml=.cmo)
	$(OCAMLC) $(OCAMLFLAGS) -o $@ $^

$(SCANNER_GEN:.ml=.cmo): $(SCANNER_GEN) $(PARSER_ML:.ml=.cmo)
	$(OCAMLC) $(OCAMLFLAGS) -c $<

$(SCANNER_GEN): $(SCANNER_SRC) $(PARSER_GEN)
	$(OCAMLLEX) $<

$(PARSER_ML:.ml=.cmo): $(PARSER_ML) $(PARSER_MLI)
	$(OCAMLC) $(OCAMLFLAGS) -c $(PARSER_MLI)
	$(OCAMLC) $(OCAMLFLAGS) -c $(PARSER_ML)

$(PARSER_GEN): $(PARSER_SRC)
	$(OCAMLYACC) $<

$(MAIN_SRC:.ml=.cmo): $(MAIN_SRC)
	$(OCAMLC) $(OCAMLFLAGS) -c $<

clean:
	rm -f *.cmi *.cmo $(TARGET) $(SCANNER_GEN) $(PARSER_GEN)
