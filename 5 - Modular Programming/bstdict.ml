module type Dictionary = sig
  type ('k, 'v) t

  (* The empty dictionary *)
  val empty : ('k, 'v) t

  (* [insert k v d] produces a new dictionary [d'] with the same mappings
   * as [d] and also a mapping from [k] to [v], even if [k] was already
   * mapped in [d]. *)
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t

  (* [lookup k d] returns the value associated with [k] in [d].
   * raises:  [NotFound] if [k] is not mapped to any value in [d]. *)
  val lookup : 'k -> ('k, 'v) t -> 'v
end

module BstDict : Dictionary = struct
  (* exception NotFound *)

  type 'a tree =
    | Empty
    | Node of {left : 'a tree; data : 'a; right : 'a tree}

  type ('k, 'v) t = ('k * 'v) tree

  let empty = Empty

  let rec lookup k = function
    | Empty -> raise Not_found
    | Node n -> let key, value = n.data in begin
      if key > k then lookup key n.right
      else if key < k then lookup key n.left
      else value
    end

  let rec insert k v = function
    | Empty -> Node {left = Empty; data = (k, v); right = Empty}
    | Node n -> let key, value = n.data in begin
      if key > k then Node {left = n.left; data = n.data; right = insert k v n.right}
      else if key < k then Node {left = insert k v n.left; data = n.data; right = n.right}
      else Node {left = n.left; data = (k, v); right = n.right}
    end
end
