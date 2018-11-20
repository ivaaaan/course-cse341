datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Num of int

type card = suit * rank

fun is_Queeen_of_Spades (c: card) =
    #1 c = Spade andalso #2 c = Queen

fun is_Queeen_of_Spades2 (c: card) =
    case c of 
            (Spade, Queen) => true
        | _ => false
val c1: card = (Diamond, Ace)
val c2: card = (Spade, Queen)
