type month  = 
  | January 
  | February 
  | March 
  | April 
  | May 
  | June
  | July 
  | August 
  | September 
  | October 
  | November 
  | December

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
  let inc_y y = { month = (next mo); year = yr + y} in
  match mo with
  | January   -> (inc_y 0)
  | February  -> (inc_y 0)
  | March     -> (inc_y 0)
  | April     -> (inc_y 0)
  | May       -> (inc_y 0)
  | June      -> (inc_y 0)
  | July      -> (inc_y 0)
  | August    -> (inc_y 0)
  | September -> (inc_y 0)
  | October   -> (inc_y 0)
  | November  -> (inc_y 0)
  | December  -> (inc_y 1)

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
