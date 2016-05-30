(* money module *)

type t = {
  cash : int;
  debt : int;
  bank : int
}

let empty = {
  cash = 0;
  debt = 0;
  bank = 0
}

let init c d b = { cash = c; debt = d; bank = b }

let calc_debt m = 
  let inc = int_of_float ((float_of_int m.debt) *. 0.1) in
  { m with debt = m.debt + inc }

let add_cash amt m = { m with cash = m.cash + amt }

exception Out_of_funds

let subtract_cash amt m = 
  let balance = m.cash - amt in
  if balance < 0 then raise Out_of_funds
  else { m with cash = balance }

let deposit amt m = { m with bank = m.bank + amt }

let withdraw amt m = 
  let balance = m.bank - amt in
  if balance < 0 then raise Out_of_funds
  else { m with bank = balance }

let string_of_t m = 
  "Cash: " ^ (string_of_int m.cash) ^ "; " ^
  "Debt: " ^ (string_of_int m.debt)
