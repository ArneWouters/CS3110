let rec prod = function
  | [] -> 1
  | x :: xs -> x * prod xs
