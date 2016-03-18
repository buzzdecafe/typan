module type PortSig = sig
  val get_base_price : Goods.t -> int
  val name : string
end
