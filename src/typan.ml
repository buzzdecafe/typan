open Goods
open Turn
open Console

let _ = 
  print_endline ("Let's buy some " ^ (Goods.string_of_t Goods.Opium));
  let turn = Console.setup () in print_endline ("Welcome, " ^ Turn.string_of_t turn)
;;

