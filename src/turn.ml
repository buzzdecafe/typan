open Ports
open Date

type cog = Cash | Guns

type state = { 
  firm : string;
  cash : int;
  debt : int;
  guns : int;
  date : Date.t;
  location : Ports.t;
  vulnerability : int;
  extortion : bool
}

exception Invalid of string

let init firm cash_or_guns = 
  let to_cog = function
    | "1" -> Cash
    | "2" -> Guns
    | x   -> raise (Invalid (x ^ " is not a valid input"))
  
  and init_cash = function
    | Cash -> 400
    | Guns -> 0

  and init_debt = function
    | Cash -> 5000
    | Guns -> 0

  and init_guns = function
    | Cash -> 0
    | Guns -> 5

  and init_vulnerability = function
    | Cash -> 10
    | Guns -> 7

  and init_extortion = function
    | Cash -> false
    | Guns -> true

  in let start_cog = to_cog cash_or_guns in
    { 
      firm = firm;
      cash = init_cash start_cog;
      debt = init_debt start_cog;
      guns = init_guns start_cog;
      date = { year = 1860; month = January };
      location = Ports.hong_kong;
      vulnerability = init_vulnerability start_cog;
      extortion = init_extortion start_cog;
    }

let add_gun s = { s with guns = s.guns + 1 }

let add_cash m s = { s with cash = cash + m }

let subtract_cash m s = add_cash (-m) s

let inc_year s = { s with year = s.eyar + 1 }


