#include "linenoise_c/linenoise.h"
#include "ctypes_cstubs_internals.h"

value linenoise_stub_1_linenoiseSetCompletionCallback(value x1)
{
   void(* x2)(char*, struct linenoiseCompletions*) =
   CTYPES_ADDR_OF_FATPTR(x1);
   linenoiseSetCompletionCallback(x2);
   return Val_unit;
}
value linenoise_stub_2_linenoiseAddCompletion(value x5, value x4)
{
   struct linenoiseCompletions* x6 = CTYPES_ADDR_OF_FATPTR(x5);
   char* x7 = CTYPES_ADDR_OF_FATPTR(x4);
   linenoiseAddCompletion(x6, x7);
   return Val_unit;
}
value linenoise_stub_3_linenoise(value x9)
{
   char* x10 = CTYPES_ADDR_OF_FATPTR(x9);
   char* x11 = linenoise(x10);
   return CTYPES_FROM_PTR(x11);
}
value linenoise_stub_4_linenoiseHistoryAdd(value x12)
{
   char* x13 = CTYPES_ADDR_OF_FATPTR(x12);
   int x14 = linenoiseHistoryAdd(x13);
   return Val_int(x14);
}
value linenoise_stub_5_linenoiseHistorySetMaxLen(value x15)
{
   int x16 = Int_val(x15);
   int x19 = linenoiseHistorySetMaxLen(x16);
   return Val_int(x19);
}
value linenoise_stub_6_linenoiseHistorySave(value x20)
{
   char* x21 = CTYPES_ADDR_OF_FATPTR(x20);
   int x22 = linenoiseHistorySave(x21);
   return Val_int(x22);
}
value linenoise_stub_7_linenoiseHistoryLoad(value x23)
{
   char* x24 = CTYPES_ADDR_OF_FATPTR(x23);
   int x25 = linenoiseHistoryLoad(x24);
   return Val_int(x25);
}
value linenoise_stub_8_linenoiseClearScreen(value x26)
{
   linenoiseClearScreen();
   return Val_unit;
}
value linenoise_stub_9_linenoiseSetMultiLine(value x28)
{
   int x29 = Int_val(x28);
   linenoiseSetMultiLine(x29);
   return Val_unit;
}
