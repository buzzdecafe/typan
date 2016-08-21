open Date

type cog = Cash | Guns

type t = { 
  firm : string;
  money : Money.t;
  date : Date.t;
  location : Ports.t;
  ship: Ship.t;
  vulnerability : int;
  extortion : bool
}

(* initialization *)
exception Invalid of string

let init firm cash_or_guns = 
  let to_cog = function
    | "1" -> Cash
    | "2" -> Guns
    | x   -> raise (Invalid (x ^ " is not a valid input"))
  
  and init_guns = function
    | Cash -> 0
    | Guns -> 5

  and init_cash = function
    | Cash -> 400
    | Guns -> 0

  and init_debt = function
    | Cash -> 5000
    | Guns -> 0

  and init_vulnerability = function
    | Cash -> 10
    | Guns -> 7

  and init_extortion = function
    | Cash -> false
    | Guns -> true

  in let cog = to_cog cash_or_guns in
    { 
      firm = firm;
      ship = Ship.init (init_guns cog);
      money = Money.init (init_cash cog) (init_debt cog) 0;
      date = { year = 1860; month = January };
      location = Ports.hong_kong;
      vulnerability = init_vulnerability cog;
      extortion = init_extortion cog;
    }

let string_of_t turn = 
  "Firm name: " ^ turn.firm ^ "\n" ^
  "Money: (" ^ (Money.string_of_t turn.money) ^ ")\n" ^
  "Ship: (" ^ (Ship.string_of_t turn.ship) ^ ")\n" ^
  "Date: (" ^ (Date.string_of_t turn.date) ^ ")\n" ^
  "Location: " ^ (Ports.string_of_t turn.location) ^ "\n"

