# Exercises - Data and Types
## list expressions [★]
```ocaml
[1; 2; 3; 4; 5;]
1 :: 2 :: 3 :: 4 :: 5 :: []
[1] @ [2; 3; 4;] @ [5]
```

```ocaml
- : int list = [1; 2; 3; 4; 5]
- : int list = [1; 2; 3; 4; 5]
- : int list = [1; 2; 3; 4; 5]
```

## product [★★]
```ocaml
let rec prod = function
  | [] -> 1
  | x :: xs -> x * prod xs
prod [1; 2; 3; 4; 5;]
```

```ocaml
val prod : int list -> int = <fun>
- : int = 120
```

## concat [★★]
```ocaml
let rec concat = function
  | [] -> ""
  | x :: xs -> x ^ concat xs
concat ["Hello"; " "; "world"; "!"]
```

```ocaml
val concat : string list -> string = <fun>
- : string = "Hello world!"
```

## product test [★★]
Unit test can be found in [test.ml](test.ml).
You can run the test suite: `dune exec ./test.exe`

## patterns [★★★]
```ocaml
let pattern1 = function
  | "bigred" :: _ -> true
  | _ -> false

let pattern2 = function
  | _ :: _ :: [] -> true
  | _ :: _ :: _ :: _ :: [] -> true
  | _ -> false

let pattern3 = function
  | x1 :: x2 :: _ -> x1 = x2
  | _ -> false
```

```ocaml
val pattern1 : string list -> bool = <fun>
val pattern2 : 'a list -> bool = <fun>
val pattern3 : 'a list -> bool = <fun>
```

## library [★★★]
```ocaml
let fifth_elem lst =
  match (List.length lst) >= 5 with
    | true -> List.nth lst 4
    | false -> 0;;

let sort_desc (lst : int list) = List.rev @@ List.sort Stdlib.compare lst
```

```ocaml
val fifth_elem : int list -> int = <fun>
val sort_desc : int list -> int list = <fun>
```

## library test [★★★]
Unit tests can be found in [test.ml](test.ml).
You can run the test suite: `dune exec ./test.exe`

## library puzzle [★★★]
```ocaml
let last_elem lst = List.hd @@ List.rev lst
let any_zeroes (lst : int list) = List.mem 0 lst
```

```ocaml
val last_elem : 'a list -> 'a = <fun>
val any_zeroes : int list -> bool = <fun>
```

## take drop [★★★]
```ocaml
let rec take n = function
  | [] -> []
  | x :: xs ->
    if n > 0 then x :: take (n-1) xs
    else []

let rec drop n = function
  | [] -> []
  | x :: xs ->
    if n > 0 then drop (n-1) xs
    else x :: xs
```

```ocaml
val take : int -> 'a list -> 'a list = <fun>
val drop : int -> 'a list -> 'a list = <fun>
```

## take drop tail [★★★★]
`drop` is already tail recursive but `take` is not.

```ocaml
let rec take n output = function
  | [] -> []
  | x :: xs ->
    if n > 0 then take (n-1) (x :: output) xs
    else List.rev output;;

let test_lst = List.init 1_000_000 Fun.id
take 500000 [] test_lst
```

```ocaml
val take : int -> 'a list -> 'a list -> 'a list = <fun>
- : int list = [0; 1; 2; 3; 4; 5; ...]
- : int list = [0; 1; 2; 3; 4; 5; ...]
```

## unimodal [★★★]
```ocaml
let rec is_monotonic_decr = function
  | [] -> true
  | _ :: [] -> true
  | x1 :: x2 :: xs -> if x1 >= x2 then is_monotonic_decr (x2 :: xs) else false

let rec is_unimodal (lst : int list) =
  match lst with
    | [] -> true
    | _ :: [] -> true
    | x1 :: x2 :: xs -> if x1 <= x2 then is_unimodal (x2 :: xs) else is_monotonic_decr (x2 :: xs)
```

```ocaml
val is_monotonic_decr : 'a list -> bool = <fun>
val is_unimodal : int list -> bool = <fun>
```

## powerset [★★★]
```ocaml
let rec powerset = function
  | [] -> [[]]
  | x :: xs -> List.map ((@) [x]) (powerset xs) @ (powerset xs)
```

```ocaml
val powerset : 'a list -> 'a list list = <fun>
```

## print int list rec [★★]
```ocaml
let rec print_int_list = function
  | [] -> ()
  | x :: xs -> x |> print_int |> print_newline; print_int_list xs
```

```ocaml
val print_int_list : int list -> unit = <fun>
```

## print int list iter [★★]
```ocaml
let print_int_list' lst = List.iter (fun x -> x |> print_int |> print_newline) lst
```

```ocaml
val print_int_list' : int list -> unit = <fun>
```

## student [★★]
```ocaml
let s = {first_name = "John"; last_name = "Doe"; gpa = 4.}
let name_of_student s = (s.first_name, s.last_name)
let make_student first_name last_name gpa = {first_name; last_name; gpa}
```

```ocaml
val s : student = {first_name = "John"; last_name = "Doe"; gpa = 4.}
val name_of_student : student -> string * string = <fun>
val make_student : string -> string -> float -> student = <fun>
```

## pokerecord [★★]

## safe hd and tl [★★]

## pokefun [★★★]

## date before [★★]

## earliest date [★★★]

## assoc list [★]

## cards [★★]

## matching [★]

## quadrant [★★]

## quadrant when [★★]

## depth [★★]

## shape [★★★]

## list max exn [★★]

## list max exn string [★★]

## list max exn ounit [★]

## is_bst [★★★★]

## quadrant poly [★★]
