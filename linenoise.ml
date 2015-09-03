include Linenoise_bindings.Make(Linenoise_foreign)

type completions_ptr = completions Ctypes.structure Ctypes_static.ptr
