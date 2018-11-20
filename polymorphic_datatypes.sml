fun sum_list xs =
    case xs of
        [] => 0
        | x::xs' => x + sum_list xs'

fun append(xs, ys) =
    case xs of
        [] => ys
        | x::xs' => x :: append(xs', ys)


datatype 'a option = NONE | SOME of 'a

datatype ('a, 'b) tree = Node of 'a * ('a, 'b) tree * ('a, 'b) tree
                            | Leaf of 'b

fun sum_tree tr =
    case tr of
        Leaf i => i
        | Node (i, left, right) => i + sum_tree left + sum_tree right

fun sum_leaves tr =
    case tr of
        Leaf i => i
        | Node (i, left, right) => sum_leaves left + sum_leaves right