open Goods
open PortSig
open Make_Port

module Singapore = Make_Port (struct
  let name = "Singapore"
  let get_base_price = function
    | Goods.Opium   -> 10
    | Goods.Silk    -> 13
    | Goods.Arms    -> 14
    | Goods.General -> 15
end)
