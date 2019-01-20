compose f g x = f(g x)

add1 x = x + 1
mult2 x = 2*x

y = compose add1 mult2 4