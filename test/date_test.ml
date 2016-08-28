open OUnit
open Date


let string_of_t_test () = 
  assert_equal (Date.string_of_t {month = Date.January; year = 1856}) "January, 1856";
  assert_equal (Date.string_of_t {month = Date.February; year = 1865}) "February, 1865";
  assert_equal (Date.string_of_t {month = Date.March; year = 1847}) "March, 1847";
  assert_equal (Date.string_of_t {month = Date.April; year = 1832}) "April, 1832";
  assert_equal (Date.string_of_t {month = Date.May; year = 1877}) "May, 1877";
  assert_equal (Date.string_of_t {month = Date.June; year = 1882}) "June, 1882";
  assert_equal (Date.string_of_t {month = Date.July; year = 1870}) "July, 1870";
  assert_equal (Date.string_of_t {month = Date.August; year = 1850}) "August, 1850";
  assert_equal (Date.string_of_t {month = Date.September; year = 1860}) "September, 1860";
  assert_equal (Date.string_of_t {month = Date.October; year = 1862}) "October, 1862";
  assert_equal (Date.string_of_t {month = Date.November; year = 1844}) "November, 1844";
  assert_equal (Date.string_of_t {month = Date.December; year = 1836}) "December, 1836"

let run () = run_test_tt_main (
  "Date suite">:::
    [
      "string_of_t">:: string_of_t_test
    ]
)

