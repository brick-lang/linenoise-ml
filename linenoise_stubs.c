
#include <stddef.h>
#include "linenoise_c/linenoise.h"
#include "headers/cstubs_internals.h"

value linenoise_stub_linenoiseSetCompletionCallback(value x1)
{
   void(* x2)(char*, struct linenoiseCompletions*) = CTYPES_TO_PTR(x1);
   linenoiseSetCompletionCallback(x2);
   return Val_unit;
}
value linenoise_stub_linenoiseAddCompletion(value x5, value x7)
{
   struct linenoiseCompletions* x6 = CTYPES_TO_PTR(x5);
   char* x8 = CTYPES_TO_PTR(x7);
   linenoiseAddCompletion(x6, x8);
   return Val_unit;
}
value linenoise_stub_linenoise(value x11)
{
   char* x12 = CTYPES_TO_PTR(x11);
   char* x13 = linenoise(x12);
   value x14 = CTYPES_FROM_PTR(x13);
   return x14;
}
value linenoise_stub_linenoiseHistoryAdd(value x15)
{
   char* x16 = CTYPES_TO_PTR(x15);
   int x17 = linenoiseHistoryAdd(x16);
   value x18 = Val_int(x17);
   return x18;
}
value linenoise_stub_linenoiseHistorySetMaxLen(value x19)
{
   int x21 = Int_val(x19);
   int x22 = linenoiseHistorySetMaxLen(x21);
   value x23 = Val_int(x22);
   return x23;
}
value linenoise_stub_linenoiseHistorySave(value x24)
{
   char* x25 = CTYPES_TO_PTR(x24);
   int x26 = linenoiseHistorySave(x25);
   value x27 = Val_int(x26);
   return x27;
}
value linenoise_stub_linenoiseHistoryLoad(value x28)
{
   char* x29 = CTYPES_TO_PTR(x28);
   int x30 = linenoiseHistoryLoad(x29);
   value x31 = Val_int(x30);
   return x31;
}
value linenoise_stub_linenoiseClearScreen(value x32)
{
   linenoiseClearScreen();
   return Val_unit;
}
value linenoise_stub_linenoiseSetMultiLine(value x36)
{
   int x38 = Int_val(x36);
   linenoiseSetMultiLine(x38);
   return Val_unit;
}
