fun sum_triple tripe =
    let val (x, y, z) = tripe
    in
        x + y + z
    end

fun full_name r =
    let val {first = x, middle = y, last = z} = r
    in
        x ^ " " ^ y ^ " " ^ z
    end

fun sum_triple2 (x, y, z) =
    x + y + z

fun full_name2 {first = x, middle = y, last = z} =
    x ^ " " ^ y ^ " " ^ z