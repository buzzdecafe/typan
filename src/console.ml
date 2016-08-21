
let rec get_string valid question =
  let s = read_line (print_string question) in 
  if valid s then s 
  else get_string valid question

let valid_firm s = s; true (* TODO *)

let valid_cog = function
  | "1" -> true
  | "2" -> true
  | _   -> false

let cash_or_guns_q = "Start with:\n\t1. Cash and a debt; or\n\t2. Five guns and no debt\n? "

let setup () = 
  let firm = get_string valid_firm "Enter firm name: " in
  let cash_or_guns = get_string valid_cog cash_or_guns_q in
  Turn.init firm cash_or_guns

