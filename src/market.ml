open Goods
open Hold
open Prices

type t = int

(* init : Ports.t -> *)
let init port = List.map (get_good_price port) Goods.all


