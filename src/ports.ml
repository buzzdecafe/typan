(* ports module *)
open Goods

type t = {
  name : string;
  get_base_price : Goods.t -> int
}

let at_sea = { 
  name = "At sea";
  get_base_price = function _ -> 0
}

let batavia = {
  name = "Batavia";
  get_base_price = function
    | Goods.Opium   -> 13
    | Goods.Silk    -> 12
    | Goods.Arms    -> 15
    | Goods.General -> 16
}

let hong_kong = {
  name = "Hong Kong";
  get_base_price = function
    | Goods.Opium   -> 11
    | Goods.Silk    -> 11
    | Goods.Arms    -> 12
    | Goods.General -> 10
}

let manila = {
  name = "Manila";
  get_base_price = function
    | Goods.Opium   -> 12
    | Goods.Silk    -> 10
    | Goods.Arms    -> 13
    | Goods.General -> 14
}

let nagasaki = {
  name = "Nagasaki";
  get_base_price = function
    | Goods.Opium   -> 15
    | Goods.Silk    -> 15
    | Goods.Arms    -> 10
    | Goods.General -> 12
}

let saigon = {
  name = "Saigon";
  get_base_price = function
    | Goods.Opium   -> 14
    | Goods.Silk    -> 16
    | Goods.Arms    -> 11
    | Goods.General -> 13
}

let shanghai = {
  name = "Shanghai";
  get_base_price = function
    | Goods.Opium   -> 16
    | Goods.Silk    -> 14
    | Goods.Arms    -> 16
    | Goods.General -> 11
}

let singapore = {
  name = "Singapore";
  get_base_price = function
    | Goods.Opium   -> 10
    | Goods.Silk    -> 13
    | Goods.Arms    -> 14
    | Goods.General -> 15
}

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

