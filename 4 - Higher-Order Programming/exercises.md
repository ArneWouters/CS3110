# Exercises - Higher-Order Programming
## twice, no arguments [★]
```ocaml
val double : int -> int = <fun>
val square : int -> int = <fun>
val twice : ('a -> 'a) -> 'a -> 'a = <fun>
val quad : int -> int = <fun>
val fourth : int -> int = <fun>
```

## mystery operator 1 [★★]
Application operator like `Stdlib.(@@)`.

```ocaml
square $ 2 + 2
square 2 + 2
```

```ocaml
- : int = 16
- : int = 6
```

## mystery operator 2 [★★]
```ocaml
(String.length @@ string_of_int) 1
(String.length @@ string_of_int) 10
(String.length @@ string_of_int) 100
```

```ocaml
- : int = 1
- : int = 2
- : int = 3
```

## repeat [★★]
```ocaml
let rec repeat f n x = if n > 0 then f (repeat f (n-1) x) else x
```

```ocaml
val repeat : ('a -> 'a) -> int -> 'a -> 'a = <fun>
```

## product [★]
```ocaml
let product_left = List.fold_left ( *. ) 1.
let product_right lst = List.fold_right ( *. ) lst 1.
```

## terse product [★★]
See answer above.

## sum_cube_odd [★★]
```ocaml
let rec ( -- ) i j = if i > j then [] else i :: i + 1 -- j
let sum_cube_odd n =
  0 -- n
  |> List.filter (fun x -> x mod 2 <> 0)
  |> List.map (fun x -> x * x * x)
  |> List.fold_left ( + ) 0
```

## sum_cube_odd pipeline [★★]
See answer above.

## exists [★★]
```ocaml
let rec exists_rec p = function
  | [] -> false
  | x :: xs -> p x || (exists_rec p xs)

let exists_fold p = List.fold_left (fun acc x -> p x || acc) false

let exists_lib p = List.find p
```

## account balance [★★]
```ocaml

```

## library uncurried [★★]

## map composition [★★★]

## more list fun [★★★]

## association list keys [★★★]

## valid matrix [★★★]

## row vector add [★★★]

## matrix add [★★★]

## matrix multiply [★★★★]
