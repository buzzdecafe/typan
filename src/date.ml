type month  = January | February | March | April | May | June
            | July | August | September | October | November | December

type t = {
  year : int;
  month : month
}

let next = function
  | January   -> February
  | February  -> March
  | March     -> April
  | April     -> May
  | May       -> June
  | June      -> July
  | July      -> August
  | August    -> September
  | September -> October
  | October   -> November
  | November  -> December
  | December  -> January


let inc {month = mo; year = yr} = 
  match mo with
  | December -> { month = (next mo); year = yr + 1 }
  | _        -> { month = (next mo); year = yr }

let string_of_month = function
  | January   -> "January"
  | February  -> "February"
  | March     -> "March"
  | April     -> "April"
  | May       -> "May"
  | June      -> "June"
  | July      -> "July"
  | August    -> "August"
  | September -> "September"
  | October   -> "October"
  | November  -> "November"
  | December  -> "December"
  

let string_of_t d = (string_of_month d.month) ^ ", " ^(string_of_int d.year)
