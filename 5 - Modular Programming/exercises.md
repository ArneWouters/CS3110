# Exercises - Modular Programming
## complex synonym [★]
```ocaml
module type ComplexSig = sig
  type t = float * float
  val zero : t
  val add : t -> t -> t
end
```

## complex encapsulation [★★]
- The value `zero` is required but not provided
- The value `add` is required but not provided
- Values do not match: `val zero : int * int` is not included in `val zero : t`

## big list queue [★★]
Delay of around 10 seconds when `n = 25,000`

## big batched queue [★★]
Delay of around 7 seconds when `n = 100,000,000`

## queue efficiency [★★★]
See Chapter 5.5 for the explanation

## binary search tree dictionary [★★★]
See [bstdict.ml](bstdict.ml)

## fraction [★★★]
See [fraction.ml](fraction.ml)

## fraction reduced [★★★]
See [fraction.ml](fraction.ml)

## make char map [★]

## char ordered [★]

## use char map [★★]

## bindings [★★]

## date order [★★]

## calendar [★★]

## print calendar [★★]

## is for [★★★]

## first after [★★★]

## sets [★★★]

## ToString [★★]

## Print [★★]

## Print Int [★★]

## Print String [★★]

## Print reuse [★]

## Print String reuse revisited [★★]

## implementation without interface [★]

## implementation with interface [★]

## implementation with abstracted interface [★]

## printer for dat [★★★]

## refactor arith [★★★★]


