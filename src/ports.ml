(* ports module *)

type t = {
  name           : string;
  warehouse      : Warehouse.t option;
  get_base_price : Goods.t -> int
}

let at_sea = { 
  name = "At sea";
  warehouse = None;
  get_base_price = function _ -> 0
}

let batavia = {
  name = "Batavia";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 6500
    | Goods.Silk    -> 600
    | Goods.Arms    -> 75
    | Goods.General -> 16
}

let hong_kong = {
  name = "Hong Kong";
  warehouse = Some Warehouse.empty;
  get_base_price = function
    | Goods.Opium   -> 5500
    | Goods.Silk    -> 550
    | Goods.Arms    -> 60
    | Goods.General -> 10
}

let manila = {
  name = "Manila";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 6000
    | Goods.Silk    -> 500
    | Goods.Arms    -> 65
    | Goods.General -> 14
}

let nagasaki = {
  name = "Nagasaki";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 7500
    | Goods.Silk    -> 750
    | Goods.Arms    -> 50
    | Goods.General -> 12
}

let saigon = {
  name = "Saigon";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 7000
    | Goods.Silk    -> 800
    | Goods.Arms    -> 55
    | Goods.General -> 13
}

let shanghai = {
  name = "Shanghai";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 8000
    | Goods.Silk    -> 700
    | Goods.Arms    -> 80
    | Goods.General -> 11
}

let singapore = {
  name = "Singapore";
  warehouse = None;
  get_base_price = function
    | Goods.Opium   -> 5000
    | Goods.Silk    -> 650
    | Goods.Arms    -> 70
    | Goods.General -> 15
}

let get_price good p = 
  let rand = (Random.int 3) + 1 in
  (p.get_base_price good) * rand

let string_of_t p = 
  match p.warehouse with
  | Some w -> p.name ^ " (" ^ (Warehouse.string_of_t w) ^ ")"
  | None   -> p.name

let all = [
  at_sea;
  batavia;
  hong_kong;
  manila;
  nagasaki;
  saigon;
  shanghai;
  singapore
]
