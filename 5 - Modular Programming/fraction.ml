module type Fraction = sig
  (* A fraction is a rational number p/q, where q != 0.*)
  type t = int * int

  (** [make n d] is n/d. Requires d != 0. *)
  val make : int -> int -> t

  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float

  val add : t -> t -> t
  val mul : t -> t -> t
end

module FractionImpl : Fraction = struct
  type t = int * int

  let make n d =
    if d = 0 then raise (Invalid_argument "Denominator cannot be zero.")
    else (n, d)

  let numerator = function (num, _) -> num
  let denominator = function (_, denom) -> denom
  let to_string = function (num, denom) -> string_of_int(num) ^ "/" ^ string_of_int(denom)
  let to_float = function (num, denom) -> float_of_int(num) /. float_of_int(denom)

  let add frac1 frac2 = match (frac1, frac2) with (num1, denom1), (num2, denom2) -> begin
    let n = (num1 * denom2) + (num2 * denom1) in
      let d = denom1 * denom2 in (n, d)
    end

  let mul frac1 frac2 = match (frac1, frac2) with (num1, denom1), (num2, denom2) ->
    (num1 * num2, denom1 * denom2)
end

module FractionReduced (M : Fraction) = struct
  let rec gcd x y =
    if x = 0 then y
    else if (x < y) then gcd (y - x) x
    else gcd y (x - y)

  let reduce = function (num, denom) -> begin
    let r = (gcd num denom) in
      if (denom < 0) then ((-num) / r, (-denom) / r)
      else (num / r, denom / r)
    end

  let make n d = reduce(M.make n d)
  let add frac1 frac2 = reduce(M.add frac1 frac2)
  let mul frac1 frac2 = reduce(M.mul frac1 frac2)
end

module FractionReducedImpl = FractionReduced (FractionImpl)
