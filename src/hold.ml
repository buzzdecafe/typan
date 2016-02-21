open Goods

type t = {
  opium : int;
  silk : int;
  arms : int;
  general : int
}
  
let empty = {
  opium = 0;
  silk = 0;
  arms = 0;
  general = 0
}

(*
 * get : Good -> Hold.t -> int
 *)
let get good inv = 
  match good with
  | Opium   -> inv.opium
  | Silk    -> inv.silk
  | Arms    -> inv.arms
  | General -> inv.general

let getOpium = get Opium
let getSilk = get Silk
let getArms = get Arms
let getGeneral = get General

(*
 * set : Good -> int -> Hold.t -> Hold.t
 *)
let set good x inv = 
  match good with
  | Opium   -> { inv with opium = x }
  | Silk    -> { inv with silk = x }
  | Arms    -> { inv with arms = x }
  | General -> { inv with general = x }

let setOpium = set Opium
let setSilk = set Silk
let setArms = set Arms
let setGeneral = set General

(*
 * update : Good.t -> int -> Hold.t -> Hold.t
 *)
let update good amount inv = 
  match good with
  | Opium   -> { inv with opium = (inv.opium + amount) }
  | Silk    -> { inv with silk = (inv.silk + amount) }
  | Arms    -> { inv with arms = (inv.arms + amount) }
  | General -> { inv with general = (inv.general + amount) }

let updateOpium = update Opium
let updateSilk = update Silk
let updateArms = update Arms
let updateGeneral = update General

