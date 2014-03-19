external linenoise_stub__1_linenoiseSetCompletionCallback :
                                                            Cstubs_internals.voidp
                                                            -> unit 
  =  "linenoise_stub_linenoiseSetCompletionCallback" 

external linenoise_stub__2_linenoiseAddCompletion : Cstubs_internals.voidp ->
                                                    Cstubs_internals.voidp ->
                                                    unit 
  =  "linenoise_stub_linenoiseAddCompletion" 

external linenoise_stub__3_linenoise : Cstubs_internals.voidp ->
                                       Cstubs_internals.voidp 
  =  "linenoise_stub_linenoise" 

external linenoise_stub__4_linenoiseHistoryAdd : Cstubs_internals.voidp ->
                                                 int 
  =  "linenoise_stub_linenoiseHistoryAdd" 

external linenoise_stub__5_linenoiseHistorySetMaxLen : int -> int 
  =  "linenoise_stub_linenoiseHistorySetMaxLen" 

external linenoise_stub__6_linenoiseHistorySave : Cstubs_internals.voidp ->
                                                  int 
  =  "linenoise_stub_linenoiseHistorySave" 

external linenoise_stub__7_linenoiseHistoryLoad : Cstubs_internals.voidp ->
                                                  int 
  =  "linenoise_stub_linenoiseHistoryLoad" 

external linenoise_stub__8_linenoiseClearScreen : unit -> unit 
  =  "linenoise_stub_linenoiseClearScreen" 

external linenoise_stub__9_linenoiseSetMultiLine : int -> unit 
  =  "linenoise_stub_linenoiseSetMultiLine" 

type 'a fn = 'a

let foreign : type a b. string -> (a -> b) Ctypes.fn -> (a -> b) =
  fun name t -> match name, t with
| "linenoiseSetMultiLine",
  Cstubs_internals.Function
    (Cstubs_internals.Primitive Cstubs_internals.Int,
     Cstubs_internals.Returns Cstubs_internals.Void) ->
  linenoise_stub__9_linenoiseSetMultiLine
| "linenoiseClearScreen",
  Cstubs_internals.Function
    (Cstubs_internals.Void, Cstubs_internals.Returns Cstubs_internals.Void) ->
  linenoise_stub__8_linenoiseClearScreen
| "linenoiseHistoryLoad",
  Cstubs_internals.Function
    (Cstubs_internals.View
       {Cstubs_internals.ty = Cstubs_internals.Pointer x5;
        Cstubs_internals.write = x4; },
     Cstubs_internals.Returns
       (Cstubs_internals.Primitive Cstubs_internals.Int)) ->
  (fun x3 ->
    linenoise_stub__7_linenoiseHistoryLoad (x4 x3).Cstubs_internals.raw_ptr)
| "linenoiseHistorySave",
  Cstubs_internals.Function
    (Cstubs_internals.View
       {Cstubs_internals.ty = Cstubs_internals.Pointer x8;
        Cstubs_internals.write = x7; },
     Cstubs_internals.Returns
       (Cstubs_internals.Primitive Cstubs_internals.Int)) ->
  (fun x6 ->
    linenoise_stub__6_linenoiseHistorySave (x7 x6).Cstubs_internals.raw_ptr)
| "linenoiseHistorySetMaxLen",
  Cstubs_internals.Function
    (Cstubs_internals.Primitive Cstubs_internals.Int,
     Cstubs_internals.Returns
       (Cstubs_internals.Primitive Cstubs_internals.Int)) ->
  linenoise_stub__5_linenoiseHistorySetMaxLen
| "linenoiseHistoryAdd",
  Cstubs_internals.Function
    (Cstubs_internals.View
       {Cstubs_internals.ty = Cstubs_internals.Pointer x12;
        Cstubs_internals.write = x11; },
     Cstubs_internals.Returns
       (Cstubs_internals.Primitive Cstubs_internals.Int)) ->
  (fun x10 ->
    linenoise_stub__4_linenoiseHistoryAdd (x11 x10).Cstubs_internals.raw_ptr)
| "linenoise",
  Cstubs_internals.Function
    (Cstubs_internals.View
       {Cstubs_internals.ty = Cstubs_internals.Pointer x15;
        Cstubs_internals.write = x14; },
     Cstubs_internals.Returns
       (Cstubs_internals.View
          {Cstubs_internals.ty = Cstubs_internals.Pointer x16;
           Cstubs_internals.read = x17; })) ->
  (fun x13 ->
    x17
    (Cstubs_internals.make_ptr x16
       (linenoise_stub__3_linenoise (x14 x13).Cstubs_internals.raw_ptr)))
| "linenoiseAddCompletion",
  Cstubs_internals.Function
    (Cstubs_internals.Pointer x19,
     Cstubs_internals.Function
       (Cstubs_internals.View
          {Cstubs_internals.ty = Cstubs_internals.Pointer x22;
           Cstubs_internals.write = x21; },
        Cstubs_internals.Returns Cstubs_internals.Void)) ->
  (fun x18 x20 ->
    linenoise_stub__2_linenoiseAddCompletion x18.Cstubs_internals.raw_ptr
    (x21 x20).Cstubs_internals.raw_ptr)
| "linenoiseSetCompletionCallback",
  Cstubs_internals.Function
    (Cstubs_internals.View
       {Cstubs_internals.ty = Cstubs_internals.Pointer x25;
        Cstubs_internals.write = x24; },
     Cstubs_internals.Returns Cstubs_internals.Void) ->
  (fun x23 ->
    linenoise_stub__1_linenoiseSetCompletionCallback
    (x24 x23).Cstubs_internals.raw_ptr)
| s, _ ->  Printf.fprintf stderr "No match for %s" s; assert false
