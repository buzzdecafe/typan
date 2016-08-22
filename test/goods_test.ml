open OUnit
open Hold


let string_of_t_test () = 
  assert_equal (Goods.string_of_t Goods.Opium) "Opium";
  assert_equal (Goods.string_of_t Goods.Silk) "Silk";
  assert_equal (Goods.string_of_t Goods.Arms) "Arms";
  assert_equal (Goods.string_of_t Goods.General) "General"

let eq_test () = 
  assert_equal (Goods.eq Goods.Opium Goods.Opium) true;
  assert_equal (Goods.eq Goods.Silk Goods.Silk) true;
  assert_equal (Goods.eq Goods.Arms Goods.Arms) true;
  assert_equal (Goods.eq Goods.General Goods.General) true;
  assert_equal (Goods.eq Goods.General Goods.Opium) false;
  assert_equal (Goods.eq Goods.Arms Goods.Silk) false

let compare_test () = 
  assert_equal (Goods.compare Goods.Opium Goods.Silk) (-1);
  assert_equal (Goods.compare Goods.Silk Goods.Opium) 1;
  assert_equal (Goods.compare Goods.Arms Goods.General) (-1);
  assert_equal (Goods.compare Goods.Arms Goods.Arms) 0 

let all_test () = 
  assert_equal Goods.all [Goods.Opium; Goods.Silk; Goods.Arms; Goods.General]


let run () = run_test_tt_main (
  "Goods suite">:::
    [
      "string_of_t">:: string_of_t_test;
      "eq">:: eq_test;
      "compare">:: compare_test;
      "all">:: all_test
    ]
)

