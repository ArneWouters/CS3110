let fifth_elem lst =
  match (List.length lst) >= 5 with
    | true -> List.nth lst 4
    | false -> 0
