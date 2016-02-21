type t = Hong_Kong | Shanghai | Nagasaki | Saigon | Manila | Singapore | Batavia

let all = [Hong_Kong; Shanghai; Nagasaki; Saigon; Manila; Singapore; Batavia]

let int_of_port = function
  | Hong_Kong -> 0
  | Shanghai  -> 1
  | Nagasaki  -> 2
  | Saigon    -> 3
  | Manila    -> 4
  | Singapore -> 5
  | Batavia   -> 6

