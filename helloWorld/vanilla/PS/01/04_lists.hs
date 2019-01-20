x = [1,2,3]

addToList = 
    0:x --cons operator

double nums =
    if null nums
    then []
    else (2 * (head nums)) : (double (tail nums))
    
removeOdd nums =
    if null nums
    then []
    else
        if (mod (head nums) 2) == 0 -- even number
        then (head nums) : (removeOdd (tail nums)) -- keeps the even number at beginning and continues with the rest
        else removeOdd(tail nums)    