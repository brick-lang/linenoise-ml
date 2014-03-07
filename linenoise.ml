(* type linenoise_completions *)

(* external linenoise_set_completion_callback: ((string -> linenoise_completions) -> unit) = "linenoise_set_completion_callback_c" *)

(* external linenoise_add_completion: linenoise_completions -> string -> unit = "linenoise_add_completion_c" *)

(* external linenoise: string -> string = "linenoise_c" *)
(* external linenoise_history_add: string -> int = "linenoise_history_add_c" *)
(* external linenoise_history_set_max_len: int -> int = "linenoise_history_set_max_len_c" *)
(* external linenoise_history_save: string -> int = "linenoise_history_save_c" *)
(* external linenoise_history_load: string -> int = "linenoise_history_load_c" *)
(* external linenoise_clear_screen: unit -> unit = "linenoise_clear_screen_c" *)
(* external linenoise_set_multiline: int -> unit = "linenoise_set_multiline_c" *)

(* char* -> linenoiseCompletions* -> void *)
(* string -> linenoise_completion -> unit *)


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
  foreign "linenoise_set_completion_callback" (funptr completion_callback_t @-> returning void)

let add_completion = 
  foreign "linenoise_add_completion" (ptr completions @-> string @-> returning void)


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

let set_multiline = 
  foreign "linenoiseSetMultiline" (int @-> returning void)
