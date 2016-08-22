open OUnit
open Hold
open Goods

let test_inv = {opium = 10; silk = 9; arms = 8; general = 5}

let get_test () = 
  assert_equal
    (Hold.get Opium test_inv)
    10;
  assert_equal 
    (Hold.get Silk test_inv)
    9;
  assert_equal 
    (Hold.get Arms test_inv)
    8;
  assert_equal 
    (Hold.get General test_inv)
    5

let set_test () = 
  assert_equal
    (Hold.set Opium 11 test_inv)
    {test_inv with opium = 11}; 
  assert_equal 
    (Hold.set Silk 99 test_inv)
    {test_inv with silk = 99}; 
  assert_equal 
    (Hold.set Arms 1 test_inv)
    {test_inv with arms = 1}; 
  assert_equal 
    (Hold.set General 0 test_inv)
    {test_inv with general = 0}

let update_test () = 
  assert_equal
    (Hold.update Opium 7 test_inv)
    {test_inv with opium = 17}; 
  assert_equal 
    (Hold.update Silk 11 test_inv)
    {test_inv with silk = 20}; 
  assert_equal 
    (Hold.update Arms (-1) test_inv)
    {test_inv with arms = 7}; 
  assert_equal 
    (Hold.update General 0 test_inv)
    {test_inv with general = 5}

let get_usage_test () = 
  assert_equal
    (Hold.get_usage test_inv)
    32 

let suite =
  "suite">:::
    [
      "get">:: get_test;
      "set">:: set_test;
      "update">:: update_test;
      "get_usage">:: get_usage_test;
    ]

let run () = run_test_tt_main suite

