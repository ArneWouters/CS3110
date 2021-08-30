open OUnit2
open Prod
open Fifth_elem
open Sort_desc

let make_prod_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (prod input) ~printer:string_of_int)

let make_fifth_elem_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (fifth_elem input) ~printer:string_of_int)
  
let make_sort_desc_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (sort_desc input))
  
let tests_prod = "Test suite for prod" >::: [
  make_prod_test "empty" 1 [];
  make_prod_test "singleton" 2 [2];
  make_prod_test "two_elements" 6 [2; 3];
]

let tests_fifth_elem = "Test suite for fifth_elem" >::: [
  make_fifth_elem_test "empty" 0 [];
  make_fifth_elem_test "less_than_five_elements" 0 [1; 2; 3;];
  make_fifth_elem_test "five_elements" 1 [5; 4; 3; 2; 1];
  make_fifth_elem_test "more_than_five_elements" 46 [123; 45; 66; 78; 46; 234; 456; 567];
]

let tests_sort_desc = "Test suite for sort_desc" >::: [
  make_sort_desc_test "empty" [] [];
  make_sort_desc_test "singleton" [2] [2];
  make_sort_desc_test "two_elements" [2; 1] [1; 2];
  make_sort_desc_test "five_elements" [5; 4; 3; 2; 1] [1; 3; 4; 2; 5];
]

let _ = run_test_tt_main tests_prod
let _ = run_test_tt_main tests_fifth_elem
let _ = run_test_tt_main tests_sort_desc
