
{- toma n xs, recibe un natural n y una lista xs y 
devuelve los primeron n elementos de la lista
toma 3 [2,3,4,5,6,7] = [2,3,4]
-}
toma::Int -> [a] -> [a]
toma 0 xs     = []
toma n []     = error "La lista es vacía"
toma n (a:xs) = a: toma (n-1) xs

{-toma 3 [2,3,4,5,6,7] = 2: toma 2 [3,4,5,6,7]
                       2: (3: toma 1 [4,5,6,7])
                       2: (3: (4: toma 0 [5,6,7]) )
                       2: (3: (4: [] ))
                       [2,3,4]
-}

{-quita n xs, recibe un natural n y una lista xs, devuelve
la lista que resulta de quitar los primeros n elementos
quita 3 [2,3,4,5,6,7] = [5,6,7]
-}
quita::Int -> [a] -> [a]
quita 0 xs     =  xs
quita n []     = error "La lista es vacía"
quita n (a:xs) = quita (n-1) xs

{-quita 3 [2,3,4,5,6,7] = quita 2 [3,4,5,6,7]
                      = quita 1 [4,5,6,7]
                      = quita 0 [5,6,7]
                      = [5,6,7]
-}



{-
-DUDA:   Tuplas Vs Listas
Tuplas
(Int, Char)  pareja
(Int, Int, Int) tripleta
(Int, String, Float)

fun::(Int,Int, Int) -> Int

fun (x,y,z) = x+y+z


fun2::Int -> Int -> Char -> (Int,Char)
fun2 x y c = (x+y, c)

Listas
[]
(a:xs)
-}