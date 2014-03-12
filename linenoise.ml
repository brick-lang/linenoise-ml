external linenoiseSetCompletionCallback : Cstubs_internals.voidp -> unit 
  = "linenoise_stub_linenoiseSetCompletionCallback" 
let linenoiseSetCompletionCallback :
                                     Linenoise_bindings.completion_callback_typ
                                     -> unit 
  = fun x1 ->
      linenoiseSetCompletionCallback
      (Ctypes.coerce Linenoise_bindings.completion_callback_typ
      (Ctypes.ptr Ctypes.void) x1).Cstubs_internals.raw_ptr

external linenoiseAddCompletion : Cstubs_internals.voidp ->
                                  Cstubs_internals.voidp -> unit 
  = "linenoise_stub_linenoiseAddCompletion" 
let linenoiseAddCompletion :
                             Linenoise_bindings.completions Ctypes.structure
                             Ctypes.ptr -> string -> unit 
  = fun x2 x3 ->
      linenoiseAddCompletion x2.Cstubs_internals.raw_ptr
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x3).Cstubs_internals.raw_ptr

external linenoise : Cstubs_internals.voidp -> Cstubs_internals.voidp 
  = "linenoise_stub_linenoise" 
let linenoise : string -> string 
  = fun x4 ->
      Ctypes.coerce (Ctypes.ptr Ctypes.char) Ctypes.string
      (Cstubs_internals.make_ptr Ctypes.char
         (linenoise
           (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x4).Cstubs_internals.raw_ptr))

external linenoiseHistoryAdd : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistoryAdd" 
let linenoiseHistoryAdd : string -> int 
  = fun x5 ->
      linenoiseHistoryAdd
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x5).Cstubs_internals.raw_ptr

external linenoiseHistorySetMaxLen : int -> int 
  = "linenoise_stub_linenoiseHistorySetMaxLen" 

external linenoiseHistorySave : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistorySave" 
let linenoiseHistorySave : string -> int 
  = fun x7 ->
      linenoiseHistorySave
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x7).Cstubs_internals.raw_ptr

external linenoiseHistoryLoad : Cstubs_internals.voidp -> int 
  = "linenoise_stub_linenoiseHistoryLoad" 
let linenoiseHistoryLoad : string -> int 
  = fun x8 ->
      linenoiseHistoryLoad
      (Ctypes.coerce Ctypes.string (Ctypes.ptr Ctypes.char) x8).Cstubs_internals.raw_ptr

external linenoiseClearScreen : unit -> unit 
  = "linenoise_stub_linenoiseClearScreen" 

external linenoiseSetMultiLine : int -> unit 
  = "linenoise_stub_linenoiseSetMultiLine" 

