open OUnit
open Ship

let test_ship = {
  status = 100;
  hold = Hold.empty;
  guns = 2;
  capacity = 70
}

let string_of_t_test () = 
  assert_equal (Ship.string_of_t test_ship)
    ("Status: " ^ (string_of_int test_ship.status) ^ "%; " ^
    "Guns: " ^ (string_of_int test_ship.guns) ^ "; " ^
    "Hold: " ^ (Hold.string_of_t test_ship.hold))

let add_gun_test () = 
  assert_equal (Ship.add_gun test_ship) {test_ship with guns = 3}

let rm_gun_test () = 
  assert_equal (Ship.rm_gun test_ship) {test_ship with guns = 1}

let update_status_test () = 
  assert_equal (Ship.update_status (-11) test_ship) {test_ship with status = 89};
  assert_equal (Ship.update_status 11 test_ship) {test_ship with status = 111}


let run () = run_test_tt_main (
  "Ship suite">:::
    [
      "string_of_t">:: string_of_t_test;
      "add_gun">:: add_gun_test;
      "rm_gun">:: rm_gun_test;
      "update_status">:: update_status_test
    ]
)

