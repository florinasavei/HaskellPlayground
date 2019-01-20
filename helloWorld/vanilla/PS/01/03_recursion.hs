pow2 n =
    if n ==0 
    then 1
    else 2 * (pow2 (n-1))

repeatString str n =
    if n == 0
    then ""
    else str ++ (repeatString str (n-1))

classicForLoop n x i =
    if i<n
    then classicForLoop n (x*2) (i+1)
    else x    