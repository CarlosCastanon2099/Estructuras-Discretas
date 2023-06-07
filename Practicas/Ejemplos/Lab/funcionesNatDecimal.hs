{-
Un número natural N (notación decimal) se define 
recursivamente de la siguiente manera:
Caso Base: 0 es un N
Caso Recursivo: Si x es un N, entonces x+1 es un N
Caso Exclusión: Solo los que se difinen con las reglas 
reglas anteriores son N
-}

suma::Int -> Int -> Int
suma n   0   = n
suma n   m   = (suma n (m-1)) + 1

--sumaNat  n  (Suc m) = Suc (sumaNat n m) 
--suma     n  (m+1)   = (suma n m) + 1
{-
suma 3 4 = (suma 3 (4-1)) + 1 = 6+ 1 = 7
suma 3 3 = (suma 3 (3-1)) + 1 =...5+ 1 = 6
suma 3 2 = (suma 3 (2-1)) + 1 =... 4 + 1 = 5
suma 3 1 = (suma 3 (1-1)) + 1 =... 3 +1 = 4
suma 3 0 = 3
-}

prod:: Int -> Int -> Int
prod  n    0 =  0
prod  n    m = suma n (prod n (m-1))

--prod  n   (m+1) = suma n (prod n m)
fact:: Int -> Int
fact 0 = 1
fact n = prod n (fact (n-1))

-- (sumaN n) dado un natural devuelve la suma
-- de los primeros n naturales 
--  sumaN n = 1+2+3+...+n
sumaN::Int -> Int
sumaN 0 = 0
sumaN n = n + (sumaN (n-1))

-- (sumaDig n) dado un natural devuelve la suma 
-- de los dígitos que conforman n
-- Ej   sumaDig 345 = 3+4+5
sumaDig::Int -> Int
sumaDig 0    = 0a
sumaDig n    = (mod n 10) + sumaDig (div n 10)

-- (inversa n) dado un natural devuelva el natural 
-- escrito en orden inverso
-- inversa 345 = 543
{- inversa n =  inversaAux n 0

Pista... Deben definir una función auxiliar que reciba
dos parámetros, en el primero n y el segundo la suma acumulada
de las llamadas recursivas
inversaAux   n    accu
      345  0   -> 0*10 + 5
      34   5   -> 5*10 + 5 = 54 
      3    54   -> 54*10 + 3 = 543
      0    543   -> 543 
-}