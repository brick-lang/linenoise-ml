###lineoise.mli
I added a lineoise.mli file
with explicit type signatures for all foreign functions.

Without this mli file, example.ml compiles fine *within* the source directory along all stubs and generated files.
But once the package is installed and example.ml compiled in its own directory,
compilation leads to errors like:

    File "example.ml", line 7, characters 6-30:
    Error: This expression has type
             (Linenoise.completions Ctypes.structure Ctypes_static.ptr ->
              string -> unit)
             Linenoise_foreign.fn
           This is not a function; it cannot be applied.

Indeed, all the foreign functions are exported as `(a -> b) Linenoise_foreign.fn`.
The lineoise.mli file fixes the issue with explicit `(a -> b)` signatures.

This works.
But I fail to understand why this file is required (this doesn't seems the case in other ctypes packages),
and how this works (why the compiler accepts the foreign functions within the project but not once installed).
What am I missing ?
