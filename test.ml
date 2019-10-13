(** identifiers *)
(* name of identifier as string *)
let%id foo = declare Int
let foo = declare Int "foo"

(* name of module as string *)
module%id Foo = struct end
module Foo = struct let name = "Foo" end

module%id Foo (Bar : S) = struct end
module Foo (Bar : S) = struct let name = "Foo (Bar)" end (* ? *)


(** types *)
(* type of an expression. TODO what type to use for type? *)
[%typ: expr]
type_of expr

(* apply expression with its type *)
expr [@@typ]
expr (type_of (expr (Obj.magic 42)))


(* module signatures *)
module Foo [@implements S] = ..
(* makes sure that Foo fulfills S without limiting visibility to the signature *)
module Foo = ..
module Foo_sealed : S = Foo (* pollutes namespace *)
let _ = let module X : S = Foo in () (* better *)
(* check multiple signatures without having to define a signature that includes them (saves defining up to 2^n signatures). *)
module Foo [@implements S1, S2] = ..
(* yields *)
module Foo = ..
let _ = let module X : sig include S1 include S2 end = Foo in ()

(** bigger example *)
type typ = Byte | Int

let declare typ name =
  print_endline ((show_typ typ)^" "^name^";")
  typ, name
