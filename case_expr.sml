datatype exp = Constant of int
            | Negate of exp
            | Add of exp * exp
            | Multiply of exp * exp

fun eval e =
    case e of
          Constant i => i
        | Negate e => ~ (eval e)
        | Add(e1, e2) => eval(e1) + eval(e2)
        | Multiply(e1, e2) => eval(e1) * eval(e2)

fun max_constant e =
    case e of
      Constant i => i
    | Negate e2 => max_constant e2
    | Add(e1,e2) =>  Int.max(max_constant e1, max_constant e2)
    | Multiply(e1,e2) => Int.max(max_constant e1, max_constant e2)
                                  

				
fun length xs =
    case xs of
	 [] => 0
       | x::xs' => 1 + length(xs')

fun append xs ys =
    case xs of
	 [] => ys
       | x::xs' => x::append xs' ys
			

val _ = length(["abcd", "qwe", "xyz"]);			   
