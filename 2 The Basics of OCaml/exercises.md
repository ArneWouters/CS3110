# values [*]
```ocaml
7 * (1 + 2 + 3)
- : int = 42
```

```ocaml
"CS " ^ string_of_int 3110
- : string = "CS 3110"
```

# operators [**]
```ocaml
42 * 10;;
- : int = 420
```

```ocaml
3.14 /. 2.;;
- : float = 1.565
```

```ocaml
4.2 ** 7.;;
- : float = 23053.9333248000075
```

# equality [*]
```ocaml
42 = 42;;
- : bool = true
```

```ocaml
"hi" = "hi";;
- : bool = true
```

```ocaml
"hi" == "hi";;
- : bool = false
```

# assert [*]
```ocaml
assert true;;
- : unit = ()
```

```ocaml
assert false;;
Exception: Assert_failure ("//toplevel//", 1, 0).
```

```ocaml
assert (2110 <> 3110);;
- : unit = ()
```

# if [*]
```ocaml
if 2 > 1 then 42 else 7;;
- : int = 42
```

# double fun [*]
```ocaml
let double x = x * 2;;
assert (double 5 = 10); assert(double 2 = 4);;
```

# more fun [**]
```ocaml
let cube x = x ** 3.;;
assert (cube 2. = 8.); assert (cube 3. = 27.);;
```

```ocaml
let sign x = if x < 0 then -1 else if x > 0 then 1 else 0;;
assert (sign 3110 = 1); assert (sign (-3110) = -1); assert (sign 0 = 0);;
```

```ocaml
let area r = Float.pi *. r ** 2.;;
assert (abs_float (area 2. -. 12.56637) < 1e-5);;
```

# RMS [**]
```ocaml
let rms x y = sqrt ((x ** 2. +. y ** 2.) /. 2.);;
assert ( abs_float ( rms 3. 4. -. 3.53553 ) < 1e-5);;
```

# date fun [***]
```ocaml
let validDate d m =
  if (m = "Feb" && d <= 28) then true
  else if ((m = "Jan" || m = "Mar" || m = "May" || m = "Jul" || m = "Aug" || m = "Oct" || m = "Dec") && d <= 31) then true
  else if ((m = "Apr" || m = "Jun" || m = "Sept" || m = "Nov") && d <= 30) then true
  else false;;
```

# fib fast [***]
```ocaml
let rec h n pp p = if n = 1 then p else h (n-1) p (pp+p);;
let fib_fast n = h n 0 1;;
```

# poly types [***]
```ocaml
let f x = if x then x else x;;
val f : bool -> bool = <fun>
```

```ocaml
let g x y = if y then x else x;;
val g : 'a -> bool -> 'a = <fun>
```

```ocaml
let h x y z = if x then y else z;;
val h : bool -> 'a -> 'a -> 'a = <fun>
```

```ocaml
let i x y z = if x then y else y;;
val i : bool -> 'a -> 'b -> 'a = <fun>
```

# divide [**]
```ocaml
let divide ~numerator:(n : float) ~denominator:(d : float) = n /. d;;
divide 1. 2.;;
- : float = 0.5
divide ~numerator:3. ~denominator:4.;;
- : float = 0.75
```

# associativity [**]
```ocaml
let add x y = x + y;;
add 5 1;;
- : int = 6
add 5;;
- : int -> int = <fun>
(add 5) 1;;
- : int = 6
add (5 1);;
Error: This expression has type int
       This is not a function; it cannot be applied.
```

# average [**]
```ocaml
let ( +/. ) x y = (x +. y) /. 2.;;
1.0 +/. 2.0;;
- : float = 1.5
0. +/. 0.;;
- : float = 0.
```

# hello world [*]
```ocaml
print_endline "Hello world!";;
Hello world!
- : unit = ()
```

```ocaml
print_string "Hello world!";;
Hello world!- : unit = ()
```

