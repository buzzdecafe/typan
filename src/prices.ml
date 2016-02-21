open Goods
open Ports
open Market
open Map

module PriceMap = Map.Make(struct
  type t = Goods.t * Ports.t
  let compare = compare
end)

(* build_map Map.S -> (Goods.t * Ports.t) -> Map.S *)
let build_map m (good, port) =
  match (good, port) with
  | (Goods.Opium, Ports.Hong_Kong) -> m.add (good, port) 11
  | (Goods.Opium, Ports.Shanghai)  -> m.add (good, port) 16
  | (Goods.Opium, Ports.Nagasaki)  -> m.add (good, port) 15
  | (Goods.Opium, Ports.Saigon)    -> m.add (good, port) 14
  | (Goods.Opium, Ports.Manila)    -> m.add (good, port) 12
  | (Goods.Opium, Ports.Singapore) -> m.add (good, port) 10
  | (Goods.Opium, Ports.Batavia)   -> m.add (good, port) 13

  | (Goods.Silk, Ports.Hong_Kong) -> m.add (good, port) 11
  | (Goods.Silk, Ports.Shanghai)  -> m.add (good, port) 14
  | (Goods.Silk, Ports.Nagasaki)  -> m.add (good, port) 15
  | (Goods.Silk, Ports.Saigon)    -> m.add (good, port) 16
  | (Goods.Silk, Ports.Manila)    -> m.add (good, port) 10
  | (Goods.Silk, Ports.Singapore) -> m.add (good, port) 13
  | (Goods.Silk, Ports.Batavia)   -> m.add (good, port) 12

  | (Goods.Arms, Ports.Hong_Kong) -> m.add (good, port) 12
  | (Goods.Arms, Ports.Shanghai)  -> m.add (good, port) 16
  | (Goods.Arms, Ports.Nagasaki)  -> m.add (good, port) 10
  | (Goods.Arms, Ports.Saigon)    -> m.add (good, port) 11
  | (Goods.Arms, Ports.Manila)    -> m.add (good, port) 13
  | (Goods.Arms, Ports.Singapore) -> m.add (good, port) 14
  | (Goods.Arms, Ports.Batavia)   -> m.add (good, port) 15

  | (Goods.General, Ports.Hong_Kong) -> m.add (good, port) 10
  | (Goods.General, Ports.Shanghai)  -> m.add (good, port) 11
  | (Goods.General, Ports.Nagasaki)  -> m.add (good, port) 12
  | (Goods.General, Ports.Saigon)    -> m.add (good, port) 13
  | (Goods.General, Ports.Manila)    -> m.add (good, port) 14
  | (Goods.General, Ports.Singapore) -> m.add (good, port) 15
  | (Goods.General, Ports.Batavia)   -> m.add (good, port) 16
;;

(* multiplier_for : Goods.t -> Market.t *)
let multiplier_for = function
  | Goods.Opium   -> 1000
  | Goods.Silk    ->  100
  | Goods.Arms    ->   10
  | Goods.General ->    1

(* proc : 'a list -> 'b list -> ('a * 'b) list *)
let prod l r =
  let g acc a =
    let f acc x = (a, x) :: acc
    in List.fold_left f acc r
  in List.fold_left g [] l

(* price_matrix : Map.S *)
let price_matrix = List.fold_left build_map PriceMap.empty (prod Goods.all Ports.all)

(* get_proce : Ports.t -> Goods.t -> Market.t *)
let get_price port good = price_matrix.find (good, port)

(* rand : unit -> int *)
let rand () = (Random.int 3) + 1

(* Ports.t -> Goods.t -> Market.t *)
let get port good = 
  let p = get_price port good in
  p / 2 * (rand) * (multiplier_for good)

(* get_good_port : Ports.t -> Goods.t -> Goods.t * Market.t *)
let get_good_price port good = (good, (get port good))

