
module type PortSig = sig
  val get_multiplier : Good.t -> Market.t
  val name : string
end
