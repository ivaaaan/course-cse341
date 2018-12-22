exception NoAnswer

datatype pattern = WildcardP
                 | VariableP of string
                 | UnitP
                 | ConstantP of int
                 | ConstructorP of string * pattern
                 | TupleP of pattern list

datatype valu = Constant of int
              | Unit
              | Constructor of string * valu
              | Tuple of valu list


fun g f1 f2 p =
    let 
        val r = g f1 f2 
    in
        case p of
            WildcardP         => f1 ()
          | VariableP x       => f2 x
          | ConstructorP(_,p) => r p
          | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
          | _                 => 0
    end

datatype typ = AnythingT
             | UnitT
             | IntT
             | TupleT of typ list
             | DatatypeT of string

fun only_lowercase xs = 
    List.filter((fn x => Char.isLower(String.sub(x, 0)))) xs

fun longest_string1 xs = 
    List.foldl((fn (x, y) => if String.size x > String.size y then x else y )) "" xs

fun longest_string2 xs = 
    List.foldl (fn(x,y) => if (String.size(x) < String.size(y)) then y else x) "" xs;

fun longest_string_helper f  = 
    List.foldl (fn(x,y) => if f( String.size(x), String.size (y) ) then y else x) ""

val longest_string3 = longest_string_helper (fn(x,y) => if ( x < y) then true else false) 

val longest_string4 = longest_string_helper (fn(x,y) => if ( x <=  y) then true else false)

val longest_lowercase = longest_string1 o only_lowercase

val caps_no_X_string = String.implode o List.filter (fn(c) => Char.toString(c) <> "X") o List.map (fn(c) => Char.toUpper(c) ) o String.explode

fun first_answer f xs =
    case xs of
        [] => raise NoAnswer
        | x::xs' => case f x of
                    SOME x => x
                    | NONE => first_answer f xs'

fun all_answers f xs =
    let
        fun helper (f, xs, acc) = 
            case xs of
                [] => SOME acc
                | x::xs' => case f(x) of
                                NONE => NONE
                                | SOME v => helper(f, xs', v @ acc)
    in
        helper(f, xs, [])
    end

fun count_wildcards p =
    g (fn() => 1) (fn(x) => 0) p

fun count_wild_and_variable_lengths p =
    g (fn() => 1) (fn(x) => String.size x) p