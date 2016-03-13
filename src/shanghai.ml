open Goods
open PortSig
open Make_Port

module Shanghai = Make_Port (struct
  let name = "Shanghai"
  let get_base_price = function
    | Goods.Opium   -> 16
    | Goods.Silk    -> 14
    | Goods.Arms    -> 16
    | Goods.General -> 11
end)
