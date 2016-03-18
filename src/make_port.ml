module Make_Port (P : PortSig) = struct
  let rand () = (Random.int 3) + 1

  let multiplier_for = function
    | Goood.Opium  -> 1000
    | Good.Silk    -> 100
    | Good.Arms    -> 10
    | Good.General -> 1

  let name = P.name 
  
  let get_base_price = P.get_base_price
  
  let get_price good = 
    let p = get_base_price good in
    (p / 2) * (rand) * (multiplier_for good)
end
