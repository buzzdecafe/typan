open Goods
open PortSig
open Make_Port

module Nagasaki = Make_Port (struct
  let name = "Nagasaki"
  let get_base_price = function
    | Goods.Opium   -> 15
    | Goods.Silk    -> 15
    | Goods.Arms    -> 10
    | Goods.General -> 12
end)
