open Goods
open PortSig
open Make_Port

module Manila = Make_Port (struct
  let name = "Manila"
  let get_base_price = function
    | Goods.Opium   -> 12
    | Goods.Silk    -> 10
    | Goods.Arms    -> 13
    | Goods.General -> 14
end)
