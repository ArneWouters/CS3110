# Exercises - The Basics of OCaml
## values [★]
### a)
```ocaml
7 * (1 + 2 + 3)
```

```ocaml
- : int = 42
```

### b)

```ocaml
"CS " ^ string_of_int 3110
```

```ocaml
- : string = "CS 3110"
```

## operators [★★]
### a)
```ocaml
42 * 10
```

```ocaml
- : int = 420
```

### b)
```ocaml
3.14 /. 2.
```

```ocaml
- : float = 1.565
```

### c)
```ocaml
4.2 ** 7.
```

```ocaml
- : float = 23053.9333248000075
```

## equality [★★]
### a)
```ocaml
42 = 42
```

```ocaml
- : bool = true
```

### b)
```ocaml
"hi" = "hi"
```

```ocaml
- : bool = true
```

### c)
```ocaml
"hi" == "hi"
```

```ocaml
- : bool = false
```

## assert [★]
### a)
```ocaml
assert true
```

```ocaml
- : unit = ()
```

### b)
```ocaml
assert false
```

```ocaml
Exception: Assert_failure ("//toplevel//", 1, 0).
```

### c)

```ocaml
assert (2110 <> 3110)
```

```ocaml
- : unit = ()
```

## if [★]
```ocaml
if 2 > 1 then 42 else 7
```

```ocaml
- : int = 42
```

## double fun [★]
```ocaml
let double x = x * 2
assert (double 5 = 10); assert(double 2 = 4)
```

```ocaml
val double : int -> int = <fun>
- : unit = ()
```

## more fun [★★]
### a)
```ocaml
let cube x = x ** 3.
assert (cube 2. = 8.); assert (cube 3. = 27.)
```

```ocaml
val cube : float -> float = <fun>
- : unit = ()
```

### b)
```ocaml
let sign x = if x < 0 then -1 else if x > 0 then 1 else 0
assert (sign 3110 = 1); assert (sign (-3110) = -1); assert (sign 0 = 0)
```

```ocaml
val sign : int -> int = <fun>
- : unit = ()
```

### c)
```ocaml
let area r = Float.pi *. r ** 2.
assert (abs_float (area 2. -. 12.56637) < 1e-5)
```

```ocaml
val area : float -> float = <fun>
- : unit = ()
```

## RMS [★★]
```ocaml
let rms x y = sqrt ((x ** 2. +. y ** 2.) /. 2.)
assert ( abs_float ( rms 3. 4. -. 3.53553 ) < 1e-5)
```

```ocaml
val rms : float -> float -> float = <fun>
- : unit = ()
```

## date fun [★★★]
```ocaml
let validDate d m =
  if (m = "Feb" && d <= 28) then true
  else if ((m = "Jan" || m = "Mar" || m = "May" || m = "Jul" || m = "Aug" || m = "Oct" || m = "Dec") && d <= 31)
    then true
  else if ((m = "Apr" || m = "Jun" || m = "Sept" || m = "Nov") && d <= 30)
    then true
  else false
```

```ocaml
val validDate : int -> string -> bool = <fun>
```

## fib [★★]
```ocaml
let rec fib n =
  if n <= 2 then 1
  else fib (n-1) + fib (n-2)
fib 40
```

```ocaml
val fib : int -> int = <fun>
- : int = 102334155
```

## fib fast [★★★]
```ocaml
let rec h n pp p = if n = 1 then p else h (n-1) p (pp+p)
let fib_fast n = h n 0 1
fib_fast 50
```

```ocaml
val h : int -> int -> int -> int = <fun>
val fib_fast : int -> int = <fun>
- : int = 12586269025
```

## poly types [★★★]
```ocaml
let f x = if x then x else x
let g x y = if y then x else x
let h x y z = if x then y else z
let i x y z = if x then y else y
```

```ocaml
val f : bool -> bool = <fun>
val g : 'a -> bool -> 'a = <fun>
val h : bool -> 'a -> 'a -> 'a = <fun>
val i : bool -> 'a -> 'b -> 'a = <fun>
```

## divide [★★]
```ocaml
let divide ~numerator:(n : float) ~denominator:(d : float) = n /. d
divide 1. 2.
divide ~numerator:3. ~denominator:4.
```

```ocaml
val divide : numerator:float -> denominator:float -> float = <fun>
- : float = 0.5
- : float = 0.75
```

## associativity [★★]
```ocaml
let add x y = x + y
add 5 1
add 5
(add 5) 1
add (5 1)
```

```ocaml
val add : int -> int -> int = <fun>
- : int = 6
- : int -> int = <fun>
- : int = 6
Error: This expression has type int
       This is not a function; it cannot be applied.
```

## average [★★]
```ocaml
let ( +/. ) x y = (x +. y) /. 2.
1.0 +/. 2.0
0. +/. 0.
```

```ocaml
val ( +/. ) : float -> float -> float = <fun>
- : float = 1.5
- : float = 0.
```

## hello world [★]
### a)
```ocaml
Hello world!
- : unit = ()
```

```ocaml
Hello world!
- : unit = ()
```

### b)
```ocaml
print_string "Hello world!"
```

```ocaml
Hello world!- : unit = ()
```
