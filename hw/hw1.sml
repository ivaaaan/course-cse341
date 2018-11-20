val string_months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
val int_months = [31, 30, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]			

fun is_older(date1 : int*int*int, date2 : int*int*int) =
    if #1 date1 < #1 date2
    then true
    else
	if #1 date1 = #2 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3 date2
	then true
	else false

	    
fun number_in_month(dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)
    
fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else number_in_months(dates, tl months) + number_in_month(dates, hd months)


fun dates_in_month(dates : (int*int*int) list, month: int) =
    if null dates
    then []
    else if #2 (hd dates) = month
    then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)


fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, (hd months)) @ dates_in_months(dates, (tl months))		      
		      
fun get_nth(xs : 'a list, n : int) =
    if n = 1
    then hd xs
    else get_nth(tl xs, n-1)

fun date_to_string(date : int*int*int) =
    get_nth (string_months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum(sum : int, numbers : int list) =
    let fun helper(counter, sum, numbers) =
	    if sum <= 0
	    then counter - 1
	    else helper(counter+1, sum - hd numbers, tl numbers)
    in
	helper(0, sum, numbers)
    end

fun what_month(d : int) : int =
  1 + number_before_reaching_sum (d, int_months)
	    
fun month_range(d1: int, d2: int) =
    if d1 > d2
    then []
    else what_month(d1) :: month_range(d1 + 1, d2)
				 
fun oldest(dates: (int*int*int) list) = 
    if null dates
    then NONE
    else
        let
            fun find_older_than(dates: (int*int*int) list, oldest_date: int*int*int) =
                if null dates
                then oldest_date
                else
                    let
                        val current_date = hd dates
                    in
                        if is_older(current_date, oldest_date)
                        then find_older_than(tl dates, current_date)
                        else find_older_than(tl dates, oldest_date)
                    end
        in
            SOME (find_older_than(tl dates, hd dates))
        end
