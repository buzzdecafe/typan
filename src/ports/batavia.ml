open Goods
open PortSig
open Make_Port

module Batavia = Make_Port (struct
  let name = "Batavia"
  let get_base_price = function
    | Goods.Opium   -> 13
    | Goods.Silk    -> 12
    | Goods.Arms    -> 15
    | Goods.General -> 16
end)
