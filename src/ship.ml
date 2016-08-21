(* ship module *)

type t = {
  status   : int;
  hold     : Hold.t;
  guns     : int;
  capacity : int
}

let empty =  {
  status   = 100;
  hold     = Hold.empty;
  guns     = 0;
  capacity = 60
}

let init num_guns = { empty with guns = num_guns }

let update_status amt ship = { ship with status = ship.status + amt }

let add_gun s = { s with guns = s.guns + 1 }

let rm_gun s = { s with guns = s.guns - 1 }

let string_of_t s = 
  "Status: " ^ (string_of_int s.status) ^ "%; " ^
  "Guns: " ^ (string_of_int s.guns) ^ "; " ^
  "Hold: " ^ (Hold.string_of_t s.hold)
