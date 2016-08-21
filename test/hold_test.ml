open OUnit

let test1 ctx = assert_equal 1 1

let suite =
  "suite">:::
    ["test1">:: test1]

let run () = run_test_tt_main suite

