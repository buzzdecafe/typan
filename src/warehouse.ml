(* warehouse module *)

type t = {
  hold     : Hold.t;
  capacity : int
}

let empty =  {
  hold     = Hold.empty;
  capacity = 10000
}

let string_of_t s = "Warehouse (Hold: " ^ (Hold.string_of_t s.hold) ^ ")"

