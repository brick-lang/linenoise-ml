#Install

```bash
opam pin ctypes https://github.com/ocamllabs/ocaml-ctypes
opam install ctypes
oasis setup
ocaml setup.ml -configure
ocaml setup.ml -build
ocaml setup.ml -install
```
## Rebuilding the Stubs
```bash
ocamlbuild -use-ocamlfind -pkgs ctypes,ctypes.foreign,ctypes.stubs generate.native
./generate.native
```

## Building the example
The example is ported from the C example. It is functionally identical

```bash
ocamlfind ocamlopt -linkpkg -g -thread -package core -package linenoise example.ml -o example.native
```
