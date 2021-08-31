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
```ocaml
type pokemon = {name : string; hp : int; ptype : poketype}
let charizard = {name = "Charizard"; hp = 78; ptype = Fire}
let squirtle = {name = "Squirtle"; hp = 44; ptype = Water}
```

## safe hd and tl [★★]
```ocaml
let safe_hd = function
  | [] -> None
  | x :: xs -> Some x

let rec safe_tl = function
  | [] -> None
  | x :: [] -> Some x
  | _ :: xs -> safe_tl xs
```

```ocaml
val safe_hd : 'a list -> 'a option = <fun>
val safe_tl : 'a list -> 'a option = <fun>
```
## pokefun [★★★]
```ocaml
let rec max_hp = function
  | [] -> None
  | x :: xs -> begin
    match max_hp xs with
      | None -> Some x
      | Some m -> if x.hp > m.hp then Some x else Some m
    end
```

```ocaml
val max_hp : pokemon list -> pokemon option = <fun>
```

## date before [★★]
```ocaml
let is_before (date1 : int * int * int) (date2 : int * int * int) =
  let (year1, month1, day1) = date1 in
    let (year2, month2, day2) = date2 in
      if (year1 = year2) then begin
        if (month1 = month2) then day1 < day2 else month1 < month2
        end
      else year1 < year2
```

```ocaml
val is_before : int * int * int -> int * int * int -> bool = <fun>
```

## earliest date [★★★]
```ocaml
let rec earliest (lst : (int * int * int) list) =
  match lst with
    | [] -> None
    | x :: xs -> begin
      match earliest xs with
        | None -> Some x
        | Some m -> if is_before x m then Some x else Some m
      end
```

```ocaml
val earliest : (int * int * int) list -> (int * int * int) option = <fun>
```

## assoc list [★]
```ocaml
let assoc_lst = [] |> insert 1 "one" |> insert 2 "two" |> insert 3 "three"
lookup 2 assoc_lst
lookup 4 assoc_lst
```

```ocaml
val assoc_lst : (int * string) list = [(3, "three"); (2, "two"); (1, "one")]
- : string option = Some "two"
- : string option = None
```

## cards [★★]
```ocaml
type suit = Clubs | Diamonds | Hearts | Spades
type rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
type card = {c_suit : suit; c_rank : rank}

{c_suit = Clubs; c_rank = Ace}
{c_suit = Hearts; c_rank = Queen}
{c_suit = Diamonds; c_rank = Two}
{c_suit = Spades; c_rank = Seven}
```

## matching [★]
```ocaml
None :: _
Some 3110 :: None :: _ :: _
Some _ :: _ :: _ :: _
_ :: []
[] (* Matches everything except for the empty list *)
```

## quadrant [★★]
```ocaml
let sign (x:int) : sign =
  if x > 0 then Pos
  else if x < 0 then Neg
  else Zero

let quadrant : int*int -> quad option = fun (x,y) ->
  match (sign x, sign y) with
  | (Pos, Pos) -> Some I
  | (Pos, Neg) -> Some II
  | (Neg, Neg) -> Some III
  | (Neg, Pos) -> Some IV
  | _ -> None
```

## quadrant when [★★]
```ocaml
let quadrant_when : int*int -> quad option = function
  | (x, y) when x > 0 && y > 0 -> Some I
  | (x, y) when x < 0 && y > 0 -> Some II
  | (x, y) when x < 0 && y < 0 -> Some III
  | (x, y) when x < 0 && y < 0 -> Some IV
  | _ -> None
```

## depth [★★]

## shape [★★★]

## list max exn [★★]

## list max exn string [★★]

## list max exn ounit [★]

## is_bst [★★★★]

## quadrant poly [★★]
