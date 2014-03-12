open Ctypes
open PosixTypes
open Foreign

type completions
let  completions : completions structure typ 
  = structure "linenoiseCompletions"

let len  = completions *:* size_t
let cvec = completions *:* ptr string
let ()   = seal completions

let completion_callback_t = string @-> ptr completions @-> returning void

let set_completion_callback = 
  foreign "linenoiseSetCompletionCallback" (funptr completion_callback_t @-> returning void)

let add_completion = 
  foreign "linenoiseAddCompletion" (ptr completions @-> string @-> returning void)


let linenoise =
  foreign "linenoise" (string @-> returning string)

let history_add =
  foreign "linenoiseHistoryAdd" (string @-> returning int)

let history_set_max_len = 
  foreign "linenoiseHistorySetMaxLen" (int @-> returning int)

let history_save = 
  foreign "linenoiseHistorySave" (string @-> returning int)

let history_load = 
  foreign "linenoiseHistoryLoad" (string @-> returning int)

let clear_screen =
  foreign "linenoiseClearScreen" (void @-> returning void)

let set_multi_line = 
  foreign "linenoiseSetMultiLine" (int @-> returning void)
