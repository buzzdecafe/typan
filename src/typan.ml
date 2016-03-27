open Goods
open Gamestate

let rec get_string valid question =
  let s = read_line (print_string question) in 
  if valid s then s 
  else get_string valid question

let valid_firm s = true (* TODO *)

let valid_cog = function
  | "1" -> true
  | "2" -> true
  | _   -> false

let cash_or_guns_q = "Start with:\n\t1. Cash and a debt; or\n\t2. Five guns and no debt\n? "


let setup () = 
  let firm = get_string valid_firm "Enter firm name: " in
  let cash_or_guns = get_string valid_cog cash_or_guns_q in
  Gamestate.gen firm cash_or_guns


let _ = 
  print_endline ("Let's buy some " ^ (Goods.string_of_t Goods.Opium));
  let game = setup () in print_endline ("Welcome, " ^ game.firm)
;;

