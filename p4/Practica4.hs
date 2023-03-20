module Practica4 where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) | H a deriving (Show, Eq)

-- PENDIENTE
-- 1)
-- La función listaAArbol que recibe una lista xs, la funcion regresa un árbol binario que contenga todos los elementos de xs
-- Ejemplo de uso: listaAArbol [1,2,3,4,5] = AB 1 (AB 2 (H 4) (H 5)) (H 3)
-- Usa las funciones que ya tienes hechas 
-- No se puede usar drop ni div
-- En su defecto usa en dado caso map o foldr
-- Se debe cumplir que cada arbol tenga dos hijos, excepto el ultimo que puede tener 0 o 1
-- listaAArbol [1,2,3,4,5] = AB 1 (AB 2 (H 4) (H 5)) (H 3)
-- No se puede usar drop, div o take
-- Hazlo recursivamente
listaAArbol :: [a] -> Arbol a
listaAArbol l = invertir (listaAArbolAux l Vacio)

listaAArbolAux :: [a] -> Arbol a -> Arbol a
listaAArbolAux [] a = a
listaAArbolAux (x:xs) Vacio = listaAArbolAux xs (H x)
listaAArbolAux (x:xs) (H y) = listaAArbolAux xs (AB y (H x) Vacio)
listaAArbolAux (x:xs) (AB y izq der) = listaAArbolAux xs (AB y izq (inserta x der))

inserta :: a -> Arbol a -> Arbol a
inserta x Vacio = H x
inserta x (H y) = AB y (H x) Vacio
inserta x (AB y izq der) = AB y izq (inserta x der)

-- Funcion que invierte el orden de un arbol binario 
-- Ejemplo de uso: invertir (AB 1 (H 2) (AB 3 (H 4) (H 5))) = AB 1 (AB 2 (H 4) (H 5)) (H 3)
invertir :: Arbol a -> Arbol a
invertir Vacio = Vacio
invertir (H x) = H x
invertir (AB x izq der) = AB x (invertir der) (invertir izq)








{-
listaAArbol :: [a] -> Arbol a
listaAArbol xs = listaAArbolAux xs Vacio

listaAArbolAux :: [a] -> Arbol a -> Arbol a
listaAArbolAux [] a = a
listaAArbolAux (x:xs) a = listaAArbolAux xs (inserta x a)

inserta :: a -> Arbol a -> Arbol a
inserta x Vacio = H x
inserta x (H y) = AB y (H x) Vacio
inserta x (AB y izq der) = AB y izq (inserta x der)

-}
















-- 2)
-- Funcion que recibe un árbol y regresa el elemento más pequeño del árbol
minimo :: Ord a => Arbol a -> a
minimo a = head (inorder a) 


-- 3)
-- Funcion que recibe un árbol y regresa el elemento más grande del árbol
maximo :: Ord a => Arbol a -> a
maximo a = head (reverse (inorder a))


-- 4)
-- La función inorder que toma un árbol y recorre sus elementos primero
-- por su subárbol izquierdo, despues la raíz y al final su subárbol derecho, y
-- devuelve una lista que contenga los elementos visitados en ese orden.
inorder :: Arbol a -> [a]
inorder a = inorderAux a []

inorderAux :: Arbol a -> [a] -> [a]
inorderAux Vacio xs = xs
inorderAux (H x) xs = x:xs
inorderAux (AB x izq der) xs = inorderAux izq (x:inorderAux der xs)


-- 5)
-- La función postorder que toma un árbol y recorre sus elementos primero
-- por su subárbol izquierdo, al final su subárbol derecho y finalmente su raíz, y
-- devuelve una lista que contenga los elementos visitados en ese orden.
postorder :: Arbol a -> [a]
postorder a = postorderAux a []

postorderAux :: Arbol a -> [a] -> [a]
postorderAux Vacio xs = xs
postorderAux (H x) xs = x:xs
postorderAux (AB x izq der) xs = postorderAux izq (postorderAux der (x:xs))



-- 6)
-- Funcion que recibe como argumentos, un booleano y un árbol, y regresa el número de nodos del árbol que cumplen con la condición del booleano.
contarPor :: (a -> Bool) -> Arbol a -> Int
contarPor b a = contarPorAux b a 0

contarPorAux :: (a -> Bool) -> Arbol a -> Int -> Int
contarPorAux b Vacio n = n
contarPorAux b (H x) n = if b x then n+1 else n
contarPorAux b (AB x izq der) n = if b x then contarPorAux b izq (contarPorAux b der (n+1)) else contarPorAux b izq (contarPorAux b der n)



-- PENDIENTE REVISAR
-- 7)
-- Funcion que tiene los mismos parametros de entrada que contarPor, solo que
-- ahora regresa una lista con los elementos del árbol que cumplen con la condición del booleano.
listaPor :: (a -> Bool) -> Arbol a -> [a]
listaPor b a = listaPorAux b a []

listaPorAux :: (a -> Bool) -> Arbol a -> [a] -> [a]
listaPorAux b Vacio xs = xs
listaPorAux b (H x) xs = if b x then x:xs else xs
listaPorAux b (AB x izq der) xs = if b x then listaPorAux b izq (x:listaPorAux b der xs) else listaPorAux b izq (listaPorAux b der xs)



-- 8)
-- la función mapT que recibe una función, un árbol y regresa otro árbol
-- cuyos elementos son el resultado de aplicar la función a cada uno de los elementos
-- del árbol recibido como parametro.
mapT :: (a -> b) -> Arbol a -> Arbol b
mapT f Vacio = Vacio
mapT f (H x) = H (f x)
mapT f (AB x izq der) = AB (f x) (mapT f izq) (mapT f der)



-- Funcion Auxiliar
-- La funcion mapea recibe una funcion f (a -> b) y una lista l de tipo a y regresa una lista de tipo b 
-- que es el resultado de aplicarle f a cada uno de los elementos de l
-- Ejemplo de uso: mapea (*10) [1...10] = [10,20,30,40,50,60,70,80,90,100]
mapea :: (a -> b) -> [a] -> [b]
mapea _ [] = []
mapea f (x:xs) = f x:mapea f xs


-- PENDIENTE
-- 9)
-- la función filterT que recibe una función que devuelve un booleano, un
-- arbol y regresa otro árbol cuyos elementos son aquellos del árbol recibido como
-- parametro que cumplen que al aplicar la función sobre ellos esta devuelva True.
-- Ejemplo de uso: filterT (>9) (AB 10 (AB 7 (H 6) (H 8)) (AB 13 (H 12) (H 14))) = AB 10 Vacio (AB 13 (H 12) (H 14))
-- Ejemplo de uso: filterT (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10))) = AB 6 (AB 4 (H 2) Vacio) (AB 10 (H 8) Vacio)
-- Usa lamdas y mapT
-- No puedes usar ListaAArbol
filterT :: (a -> Bool) -> Arbol a -> Arbol a
filterT f a = listaAArbol (filtra f (inorder a))



-- Se arregla listaAArbol se arregla esta funcion
-- listaAArbol (filtra f (inorder a))



-- Funcion Auxiliar
-- La funcion filtra recibe una funcion f (a -> Bool) y una lista l de tipo a 
-- regresa una lista de los elementos de l que cumplan f.
-- Ejemplo de uso: filtra (> 10 ) [1..20] = [11,12,13,14,15,16,17,18,19,20]
filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra f (x:xs)
    | f x = x:filtra f xs
    | otherwise = filtra f xs

