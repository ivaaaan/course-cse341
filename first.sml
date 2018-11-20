(* This is a comment *)

val x = 34; (* int *)
(* static environment: x : int *)
(* dymaic envorinment: x --> 34 *)

val y = 17;
(* static environment: x : int, y : int  *)
(* dymaic envorinment: x --> 34; y --> 17 *)

val z = (x + y) + (y + 2);
(* static environment: x : int, y : int, z : int  *)
(* dymaic envorinment: x --> 34; y --> 17; z --> 70 *)

val q = z + 1;
(* static environment: x : int, y : int, z : int, q : int  *)
(* dymaic envorinment: x --> 34; y --> 17; z --> 70; q --> 71 *)

val abs_of_z = if z < 0 then 0 - z else z;
(* abs_of_z : int *)
(* dymaic envorinment: x --> 34; y --> 17; z --> 70; q --> 71; abs_of_z --> 70 *)

val abs_of_z_simpler = abs z;

(* if then else
Syntax:
    if e1 then e2 else 
    where if, then, else are keywords and e1, e2, e3 is subexpressions
Type-checkinig:
    first e1 must have type bool
    e2 and e3 can have any type T, but they must have the same type T.

Evaluation rules:
    first evaluate e1 to a value and call it v1
    if it's true, evaluate e2 and that result is the whole expression's result
    else, evaluate e3 and that result.
*)
