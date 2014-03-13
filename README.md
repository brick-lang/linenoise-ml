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
ocamlfind ocamlc -linkpkg -g -package ctypes -package ctypes.foreign -package ctypes.stubs linenoise_bindings.ml -o linenoise_bindings.native
./linenoise_bindings.native
```

## Building the example
The example is ported from the C example. It is functionally identical

```bash
ocamlfind ocamlopt -linkpkg -g -thread -package core -package ctypes -package ctypes.foreign -package linenoise example.ml -o example.native
```
