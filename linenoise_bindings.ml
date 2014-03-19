open Ctypes
open PosixTypes
open Cstubs

type completions
let  completions : completions structure typ 
  = structure "linenoiseCompletions"
    
let len  = completions *:* size_t
let cvec = completions *:* ptr string
let ()   = seal completions

type completion_callback_typ = string -> completions structure ptr -> unit
let completion_callback_typ = Foreign.funptr (string @-> ptr completions @-> returning void)

module Bindings(F : Cstubs.FOREIGN) = struct
                                
  let set_completion_callback = 
    F.foreign "linenoiseSetCompletionCallback" (completion_callback_typ @-> returning void)
      
  let add_completion = 
    F.foreign "linenoiseAddCompletion" (ptr completions @-> string @-> returning void)

  let linenoise =
    F.foreign "linenoise" (string @-> returning string)
      
  let history_add =
    F.foreign "linenoiseHistoryAdd" (string @-> returning int)
      
  let history_set_max_len = 
    F.foreign "linenoiseHistorySetMaxLen" (int @-> returning int)
      
  let history_save = 
    F.foreign "linenoiseHistorySave" (string @-> returning int)
      
  let history_load = 
    F.foreign "linenoiseHistoryLoad" (string @-> returning int)
      
  let clear_screen =
    F.foreign "linenoiseClearScreen" (void @-> returning void)
      
  let set_multi_line = 
    F.foreign "linenoiseSetMultiLine" (int @-> returning void)
end

let c_headers = "
#include <stddef.h>
#include \"linenoise_c/linenoise.h\"
#include \"headers/cstubs_internals.h\"
"

let make_stubname cname = "linenoise_stub_" ^ cname

let main () =
  let ml_out = open_out "linenoise_wrappers.ml"
  and c_out = open_out "linenoise_stubs.c" in
  let ml_fmt = Format.formatter_of_out_channel ml_out
  and c_fmt = Format.formatter_of_out_channel c_out in
  Format.fprintf c_fmt "%s@\n" c_headers;
  let prefix = "linenoise_stub_" in
  Cstubs.write_c c_fmt ~prefix (module Bindings);
  Cstubs.write_ml ml_fmt ~prefix (module Bindings);
  Format.pp_print_flush ml_fmt ();
  Format.pp_print_flush c_fmt ();
  close_out ml_out;
  close_out c_out

(* let () = main () *)
