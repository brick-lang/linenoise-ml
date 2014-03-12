open Core.Std
open Linenoise

let completion (buf:string) lc = 
  if (String.get buf 0) = 'h' then 
    begin
      Linenoise.add_completion lc "hello";
      Linenoise.add_completion lc "hello there"
    end
  else ()
  
let () =
  let prgname = Array.get Sys.argv 0 in 
  let count = ref (Array.length Sys.argv) in
  while !count > 1 do
    decr count;
    if (Array.get Sys.argv !count) = "--multiline" then 
      begin
        Linenoise.set_multi_line 1;
        print_string "Multi-line mode enabled"
      end
    else
      begin
        Printf.fprintf stderr "Usage: %s [--multiline]\n" prgname;
        exit 1
      end
  done;

  Linenoise.set_completion_callback completion;
  ignore (Linenoise.history_load "history.txt");

  let line = ref (Linenoise.linenoise "hello> ") in
  while !line <> "" do
    
    if (String.get !line 0) <> '/' then 
      begin
        Printf.printf "echo: '%s'\n" !line;
        ignore (Linenoise.history_add !line);
        ignore (Linenoise.history_save "history.txt");
      end
    else if (String.slice !line 0 11) = "/historylen" then
      begin
        let len = Int.of_string (String.slice !line 11 0) in
        ignore (Linenoise.history_set_max_len len)
      end
    else if (String.get !line 0) = '/' then
      Printf.printf "Unrecognized command: %s\n" !line
    else assert false;
    line := (Linenoise.linenoise "hello> ")
  done;
  exit 0
