open Ctypes
open PosixTypes

type completions
let  completions: completions structure typ = structure "linenoiseCompletions"
let len  = field completions "len" size_t
let cvec = field completions "cvec" (ptr string)
let ()   = seal completions

let linenoiseCompletionCallback = string @-> ptr completions @-> returning void

module Make(F : Cstubs.FOREIGN) = struct

  let set_completion_callback =
    F.foreign "linenoiseSetCompletionCallback" (Foreign.funptr linenoiseCompletionCallback @-> returning void)

  let add_completion =
    F.foreign "linenoiseAddCompletion" (ptr completions @-> string @-> returning void)

  let linenoise =
    F.foreign "linenoise" (string @-> returning string_opt)
      
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

