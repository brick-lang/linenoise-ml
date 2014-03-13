external set_completion_callback : Cstubs_internals.voidp -> unit 
  = "linenoise_stub_linenoiseSetCompletionCallback" 
let set_completion_callback :
                                     Linenoise_bindings.completion_callback_typ
                                     -> unit 
  = fun x1 ->
      set_completion_callback
      (Ctypes.coerce Linenoise_bindings.completion_callback_typ
      (Ctypes.ptr Ctypes.void) x1).Cstubs_internals.raw_ptr

external add_completion : Cstubs_internals.voidp ->
                                  Cstubs_internals.voidp -> unit 
  = "linenoise_stub_linenoiseAddCompletion" 
let add_completion :
                             Linenoise_bindings.completions Ctypes.structure
                             Ctypes.ptr -> string -> unit 
  = fun x2 x3 ->
      add_completion x2.Cstubs_internals.raw_ptr
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x3).Cstubs_internals.raw_ptr

external linenoise : Cstubs_internals.voidp -> Cstubs_internals.voidp 
  = "linenoise_stub_linenoise" 
let linenoise : string -> string 
  = fun x4 ->
      Ctypes.coerce (Ctypes.ptr Ctypes.char) Ctypes.string
      (Cstubs_internals.make_ptr Ctypes.char
         (linenoise
           (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x4).Cstubs_internals.raw_ptr))

external history_add : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistoryAdd" 
let history_add : string -> int 
  = fun x5 ->
      history_add
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x5).Cstubs_internals.raw_ptr

external history_set_max_len : int -> int 
  = "linenoise_stub_linenoiseHistorySetMaxLen" 

external history_save : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistorySave" 
let history_save : string -> int 
  = fun x7 ->
      history_save
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x7).Cstubs_internals.raw_ptr

external history_load : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistoryLoad" 
let history_load : string -> int 
  = fun x8 ->
      history_load
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x8).Cstubs_internals.raw_ptr

external clear_screen : unit -> unit 
  = "linenoise_stub_linenoiseClearScreen" 

external set_multi_line : int -> unit 
  = "linenoise_stub_linenoiseSetMultiLine" 

