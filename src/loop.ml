open Ports
open Random
open Turn

(* turn lifecycle *)
(*

if hong_kong then moneylender Y|N
Y ->
N -> compradors_report
     option Li Yuen message?

     buy gun?
     repairs?
     new ship?
     Buy, Sell, Bank, Transfer cargo, Quit trading?
     Buy ->
       Buy what? Goods.t -> How much? int -> 
     Sell ->
       Sell what? Goods.t -> How much? int -> 
     Bank (if hong_kong) -> Deposit? int -> Withdraw? int -> 
     Transfer (if hong_kong) -> None | Move to wh? Goods.t -> How much? int -> Move to ship? Goods.t -> How much? int -> Buy, Sell, etc.
     Quit -> Where do you wish to go?
       select port city
       At sea/Captain's report
         Pirates? -> Fight | Run
       compradors_report
 *)
(*
type t = {
  firm : string;
  money : Money.t;
  date : Date.t;
  location : Ports.t;
  ship: Ship.t;
  vulnerability : int;
  extortion : bool
}
*)

type loop = (Turn.t -> Turn.t) list

exception Invalid_response Turn.t

let get_resp turn = 
  turn

let rec handle_response turn = 
  try 
    match get_resp () with
    | 'Y' -> { turn with extortion = true } 
    | 'N' -> turn
    | _   -> raise (Invalid_response turn)
  with 
    Invalid_response t -> handle_response t


let get_time dt = ((dt.year - 1860) * 12) + dt.month

let extortion turn = (* HK: is li yuen extoring you? *)
  let extort t = 
    t.location = Ports.hong_kong && 
    t.money.cash > 0 &&
    t.extortion 
  in    
  if extort turn 
  then handle_response turn
  else turn

let fix_ship turn = turn (* HK: McHenry offers to fix your ship *)

let wu_warn turn = turn (* HK: moneylender threatens you over your debt *)
  
let moneylender turn = turn (* HK: do you have business with the moneylender? *)

let new_ship turn = turn (* buy a new ship? *)

let new_gun turn = turn (* or buy a new gun? (these two are tied together) *)

let new_ship_or_gun turn = turn

let opium_bust turn = turn (* NotHK: you get busted for dealing opium *)

let warehouse_robbed turn = turn (* your warehouse got robbed *)

let yuen_summons turn = turn (* NotHK: li yuen summons you to hong kong posthaste *)

let robbed turn = turn (* you personally got robbed *)

let rec choose_act turn = turn (* HK: Buy, Sell, Bank, Transfer, Quit; NotHK: Buy, Sell, Quit *)

let sail_to turn = turn (* choose next city to sail to *)

let at_sea turn = turn

let hk_loop : loop =  [
  extortion; 
  fix_ship; 
  wu_warn; 
  moneylender; 
  new_ship_or_gun; 
  warehouse_robbed; 
  robbed; 
  choose_act; 
  sail_to; 
  at_sea
]

let other_loop : loop = [
  new_ship_or_gun;
  opium_bust;
  warehouse_robbed; 
  robbed; 
  choose_act; 
  sail_to; 
  at_sea
]

let get_loop turn = 
  let hk = Ports.hong_kong in
  match turn.location with 
  | hk -> hk_loop
  | _  -> other_loop
