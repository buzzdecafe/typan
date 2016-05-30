open Goods
open Turn
open Console

let _ = 
  let turn = Console.setup () in print_endline ("Welcome, " ^ Turn.string_of_t turn)
;;

