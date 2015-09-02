module CI = Cstubs_internals

external linenoise_stub_1_linenoiseSetCompletionCallback
  : _ CI.fatptr -> unit = "linenoise_stub_1_linenoiseSetCompletionCallback" 

external linenoise_stub_2_linenoiseAddCompletion
  : _ CI.fatptr -> _ CI.fatptr -> unit
  = "linenoise_stub_2_linenoiseAddCompletion" 

external linenoise_stub_3_linenoise : _ CI.fatptr -> CI.voidp
  = "linenoise_stub_3_linenoise" 

external linenoise_stub_4_linenoiseHistoryAdd : _ CI.fatptr -> int
  = "linenoise_stub_4_linenoiseHistoryAdd" 

external linenoise_stub_5_linenoiseHistorySetMaxLen : int -> int
  = "linenoise_stub_5_linenoiseHistorySetMaxLen" 

external linenoise_stub_6_linenoiseHistorySave : _ CI.fatptr -> int
  = "linenoise_stub_6_linenoiseHistorySave" 

external linenoise_stub_7_linenoiseHistoryLoad : _ CI.fatptr -> int
  = "linenoise_stub_7_linenoiseHistoryLoad" 

external linenoise_stub_8_linenoiseClearScreen : unit -> unit
  = "linenoise_stub_8_linenoiseClearScreen" 

external linenoise_stub_9_linenoiseSetMultiLine : int -> unit
  = "linenoise_stub_9_linenoiseSetMultiLine" 

type 'a fn = 'a

let foreign : type a b. string -> (a -> b) Ctypes.fn -> (a -> b) =
  fun name t -> match name, t with
| "linenoiseSetMultiLine",
  CI.Function (CI.Primitive CI.Int, CI.Returns CI.Void) ->
  linenoise_stub_9_linenoiseSetMultiLine
| "linenoiseClearScreen", CI.Function (CI.Void, CI.Returns CI.Void) ->
  linenoise_stub_8_linenoiseClearScreen
| "linenoiseHistoryLoad",
  CI.Function
    (CI.View {CI.ty = CI.Pointer x5; write = x4; },
     CI.Returns (CI.Primitive CI.Int)) ->
  (fun x3 -> linenoise_stub_7_linenoiseHistoryLoad (CI.cptr (x4 x3)))
| "linenoiseHistorySave",
  CI.Function
    (CI.View {CI.ty = CI.Pointer x8; write = x7; },
     CI.Returns (CI.Primitive CI.Int)) ->
  (fun x6 -> linenoise_stub_6_linenoiseHistorySave (CI.cptr (x7 x6)))
| "linenoiseHistorySetMaxLen",
  CI.Function (CI.Primitive CI.Int, CI.Returns (CI.Primitive CI.Int)) ->
  linenoise_stub_5_linenoiseHistorySetMaxLen
| "linenoiseHistoryAdd",
  CI.Function
    (CI.View {CI.ty = CI.Pointer x12; write = x11; },
     CI.Returns (CI.Primitive CI.Int)) ->
  (fun x10 -> linenoise_stub_4_linenoiseHistoryAdd (CI.cptr (x11 x10)))
| "linenoise",
  CI.Function
    (CI.View {CI.ty = CI.Pointer x15; write = x14; },
     CI.Returns (CI.View {CI.ty = CI.Pointer x16; read = x17; })) ->
  (fun x13 ->
    x17 (CI.make_ptr x16 (linenoise_stub_3_linenoise (CI.cptr (x14 x13)))))
| "linenoiseAddCompletion",
  CI.Function
    (CI.Pointer x19,
     CI.Function
       (CI.View {CI.ty = CI.Pointer x22; write = x21; }, CI.Returns CI.Void)) ->
  (fun x18 x20 ->
    linenoise_stub_2_linenoiseAddCompletion (CI.cptr x18) (CI.cptr (x21 x20)))
| "linenoiseSetCompletionCallback",
  CI.Function
    (CI.View {CI.ty = CI.Pointer x25; write = x24; }, CI.Returns CI.Void) ->
  (fun x23 ->
    linenoise_stub_1_linenoiseSetCompletionCallback (CI.cptr (x24 x23)))
| s, _ ->  Printf.ksprintf failwith "No match for %s" s


let foreign_value : type a b. string -> a Ctypes.typ -> a Ctypes.ptr =
  fun name t -> match name, t with
| s, _ ->  Printf.ksprintf failwith "No match for %s" s

