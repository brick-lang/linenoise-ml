type completions
type completions_ptr = completions Ctypes.structure Ctypes_static.ptr

val set_completion_callback: (string -> completions_ptr -> unit) -> unit
val add_completion: completions_ptr -> string -> unit
val linenoise: string -> string option
val history_add: string -> int
val history_set_max_len: int -> int
val history_save: string -> int
val history_load: string -> int
val clear_screen: unit -> unit
val set_multi_line: int -> unit
