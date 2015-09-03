open Linenoise
open Core.Std

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
        Printf.printf "Multi-line mode enabled\n%!"
      end
    else
      begin
        Printf.fprintf stderr "Usage: %s [--multiline]\n%!" prgname;
        exit 1
      end
  done;

  Linenoise.set_completion_callback completion;
  ignore (Linenoise.history_load "history.txt");

  let rec loop () =
    match Linenoise.linenoise "hello> " with
    | None -> ()
    | Some "" -> loop ()
    | Some line when String.get line 0 <> '/' -> 
      begin
        Printf.printf "echo: '%s'\n%!" line;
        ignore (Linenoise.history_add line);
        ignore (Linenoise.history_save "history.txt");
        loop ()
      end
    | Some line ->
      begin match String.split ~on:' ' line with
        | ["/historylen"; arg] ->
          let len = Int.of_string (String.strip arg) in
          ignore (Linenoise.history_set_max_len len);
          loop ()
        | _ ->
          Printf.printf "Unrecognized command: %s\n%!" line;
          loop ()
      end
  in 
    loop ()
