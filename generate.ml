open Ctypes

let c_headers = "
#include <stdlib.h>
#include \"linenoise_c/linenoise.h\"
"

let main () =
  let ml_out = open_out "linenoise_foreign.ml"
  and c_out = open_out "linenoise_generated.c" in
  let ml_fmt = Format.formatter_of_out_channel ml_out
  and c_fmt = Format.formatter_of_out_channel c_out in
  Format.fprintf c_fmt "%s@\n" c_headers;
  Cstubs.write_c c_fmt ~prefix:"linenoise_stub" (module Linenoise_bindings.Make);
  Cstubs.write_ml ml_fmt ~prefix:"linenoise_stub" (module Linenoise_bindings.Make);
  Format.pp_print_flush ml_fmt ();
  Format.pp_print_flush c_fmt ();
  close_out ml_out;
  close_out c_out

let () = main ()
