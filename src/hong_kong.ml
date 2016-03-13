open Goods
open PortSig
open Make_Port

module Hong_Kong = Make_Port (struct
  let name = "Hong Kong"
  let get_base_price = function
    | Goods.Opium   -> 11
    | Goods.Silk    -> 11
    | Goods.Arms    -> 12
    | Goods.General -> 10
end)
