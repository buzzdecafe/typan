open Goods
open PortSig
open Make_Port

module Saigon = Make_Port (struct
  let name = "Saigon"
  let get_base_price = function
    | Goods.Opium   -> 14
    | Goods.Silk    -> 16
    | Goods.Arms    -> 11
    | Goods.General -> 13
end)
