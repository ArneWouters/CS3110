# Exercises - Mutability
## mutable fields [★]
```ocaml
type student = {name : string; mutable gpa : float}
let s = {name = "Alice"; gpa = 3.7}
s.gpa <- 4.0
```

## refs [★]
```ocaml
ref true
ref [1]
[ref 1]
```

```ocaml
- : bool ref = {contents = true}
- : int list ref = {contents = [1]}
- : int ref list = [{contents = 1}]
```

## inc fun [★]
```ocaml
!inc (3110-1)
```

## addition assignment [★★]
```ocaml
let ( +:= ) x y =
  x := !x + y
```

## physical equality [★★]
```ocaml
- : bool = true
- : bool = false
- : bool = true
- : bool = true
- : unit = ()
- : bool = true
- : bool = false
```

## norm [★★]
```ocaml
let norm v = Array.fold_left (fun acc x -> acc +. (x *. x)) 0. v |> sqrt
```

## normalize [★★]
```ocaml
let normalize v =
  let y = norm(v) in Array.iteri (fun idx x -> v.(idx) <- x /. y) v
```

## norm loop [★★]

## normalize loop [★★]

## init matrix [★★★]

## doubly linked list [★★★★]
