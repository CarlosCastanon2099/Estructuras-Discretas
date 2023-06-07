module Practica4 where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) | H a deriving (Show, Eq)
--data Arbol a = Vacio | AB a (Arbol a) (Arbol a) | H a deriving (Eq)



-- 1)
-- La función listaAArbol que recibe una lista xs, la funcion regresa un árbol binario 
-- que contenga  todos los elementos de xs
-- Ejemplo de uso: listaAArbol [1,2,3,4,5] = AB 1 (AB 3 (H 5) (H 4)) (H 2)
listaAArbol :: [a] -> Arbol a
listaAArbol l = invertir (listaAArbolAux l Vacio)

-- Funcion auxiliar que recibe una lista y un arbol y regresa un arbol con los elementos de la lista
listaAArbolAux :: [a] -> Arbol a -> Arbol a
listaAArbolAux [] a = a
listaAArbolAux (x:xs) Vacio = listaAArbolAux xs (H x)
listaAArbolAux (x:xs) (H y) = listaAArbolAux xs (AB y (H x) Vacio)
listaAArbolAux (x:xs) (AB y izq der) = listaAArbolAux xs (AB y izq (inserta x der))

-- Funcion que inserta un elemento en un arbol binario
inserta :: a -> Arbol a -> Arbol a
inserta x Vacio = H x
inserta x (H y) = AB y (H x) Vacio
inserta x (AB y izq der) = AB y izq (inserta x der)


-- Funcion que invierte el orden de un arbol binario 
invertir :: Arbol a -> Arbol a
invertir Vacio = Vacio
invertir (H x) = H x
invertir (AB x izq der) = AB x (invertir der) (invertir izq)




-- 2)
-- Funcion que recibe un árbol y regresa el elemento más pequeño del árbol
-- Ejemplo de uso: minimo (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11))) = 4
-- Ejemplo de uso: minimo (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (H 4)))) = -1
minimo :: Ord a => Arbol a -> a
minimo arbol = ordena (arbolALista arbol) !! 0
-- minimo a = head (inorder a) 


-- Funcion axiliar que convierte un arbol binario en una lista 
arbolALista :: Arbol a -> [a]
arbolALista Vacio = []
arbolALista (H x) = [x]
arbolALista (AB x izq der) = arbolALista izq ++ [x] ++ arbolALista der

-- Funcion auxiliar que ordena de menor a mayor una lista
ordena :: Ord a => [a] -> [a]
ordena [] = []
ordena (x:xs) = ordena [y | y <- xs, y <= x] ++ [x] ++ ordena [y | y <- xs, y > x]

-- Funcion auxiliar que aplica reversa a una lista
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]


-- 3)
-- Funcion que recibe un árbol y regresa el elemento más grande del árbol
-- Ejemplo de uso: maximo (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11))) = 11
-- Ejemplo de uso: maximo (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5))))) = 5
maximo :: Ord a => Arbol a -> a
maximo arbol = ordena (arbolALista arbol) !! (length (arbolALista arbol) - 1)
-- maximo a = head (reverse (inorder a)) 
-- maximo a = reversa (ordena (arbolALista arbol) !! 0) 



-- 4)
-- La función inorder que toma un árbol y recorre sus elementos primero
-- por su subárbol izquierdo, despues la raíz y al final su subárbol derecho, y
-- devuelve una lista que contenga los elementos visitados en ese orden.
-- Ejemplo de uso: inorder (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11))) = [4,5,6,8,9,10,11]
-- Ejemplo de uso: inorder (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5))))) = [-1,1,2,3,4,5]
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
-- Ejemplo de uso: postorder (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5))))) = [-1,5,4,3,2,1]
-- Ejemplo de uso: postorder (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11))) = [4,6,5,9,11,10,8]
postorder :: Arbol a -> [a]
postorder a = postorderAux a []


postorderAux :: Arbol a -> [a] -> [a]
postorderAux Vacio xs = xs
postorderAux (H x) xs = x:xs
postorderAux (AB x izq der) xs = postorderAux izq (postorderAux der (x:xs))




-- 6)
-- Funcion que recibe como argumentos, un booleano y un árbol, y regresa el número de nodos del árbol que cumplen con la condición del booleano.
-- Ejemplo de uso: contarPor (> 3) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9))) = 5
-- Ejemplo de uso: contarPor (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9))) = 4
contarPor :: (a -> Bool) -> Arbol a -> Int
contarPor b a = contarPorAux b a 0


contarPorAux :: (a -> Bool) -> Arbol a -> Int -> Int
contarPorAux b Vacio n = n
contarPorAux b (H x) n = if b x then n+1 else n
contarPorAux b (AB x izq der) n = if b x then contarPorAux b izq (contarPorAux b der (n+1)) else contarPorAux b izq (contarPorAux b der n)




-- 7)
-- Funcion que tiene los mismos parametros de entrada que contarPor, solo que
-- ahora regresa una lista con los elementos del árbol que cumplen con la condición del booleano.
-- listaPor (> 3) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9))) = [4,6,7,8,9]
-- listaPor (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9))) = [2,4,6,8]
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
-- Ejemplo de uso: mapT (+1) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10))) = AB 7 (AB 4 (H 3) (H 5)) (AB 10 (H 9) (H 11))
-- Ejemplo de uso: mapT show (AB 10 (AB 7 (H 6) (H 8)) (AB 13 (H 12) (H 14))) = AB "10" (AB "7" (H "6") (H "8")) (AB "13" (H "12") (H "14"))
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




-- 9)
-- la función filterT que recibe una función que devuelve un booleano, un
-- arbol y regresa otro árbol cuyos elementos son aquellos del árbol recibido como
-- parametro que cumplen que al aplicar la función sobre ellos esta devuelva True.
-- Ejemplo de uso: filterT (>9) (AB 10 (AB 7 (H 6) (H 8)) (AB 13 (H 12) (H 14))) = AB 10 Vacio (AB 13 (H 12) (H 14))
-- Ejemplo de uso: filterT (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10))) = AB 6 (AB 4 (H 2) Vacio) (AB 10 (H 8) Vacio)
filterT :: (a -> Bool) -> Arbol a -> Arbol a
filterT f a = listaAArbol (filtra f (inorder a))


-- Funcion Auxiliar
-- La funcion filtra recibe una funcion f (a -> Bool) y una lista l de tipo a 
-- regresa una lista de los elementos de l que cumplan f.
-- Ejemplo de uso: filtra (> 10 ) [1..20] = [11,12,13,14,15,16,17,18,19,20]
filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra f (x:xs)
    | f x = x:filtra f xs
    | otherwise = filtra f xs




{-

{- 
Vamos a hacer una instance show para que los arboles se vean algo parecidos a el siguiente ejemplo
arbolito = AB 5 (AB 3 (H 2) (H 4)) (AB 8 (H 6) (H 9))
            5
         /     \
        3       8
       / \     / \
      2   4   6   9  
-}
-- m = AB 5 (AB 3 (H 2) (H 4)) (AB 8 (H 6) (H 9))

-- 1
instance Show a => Show (Arbol a) where
  show Vacio = ""
  show (H a) = show a
  show (AB a izq der) = showSubtree "" "    " (AB a izq der)
    where
      showSubtree prefix branch subtree = prefix ++ nodeValue subtree ++ "\n" ++ children
        where
          nodeValue (H a) = show a
          nodeValue (AB a _ _) = show a
          children = case subtree of
            Vacio -> ""
            H _ -> ""
            AB _ izq' der' -> showSubtree (prefix ++ branch) ("│" ++ replicate (length (nodeValue subtree)) ' ') izq' ++
                              showSubtree (prefix ++ branch) (" " ++ replicate (length (nodeValue subtree)) ' ') der'



-- 2
instance Show a => Show (Arbol a) where
    show t = intercalate "\n" (map snd (draw t))

draw :: Show a => Arbol a -> [(Int, String)]
draw Vacio            = [(1, "*")]
draw (H x)            = [(1, show x)]
draw (AB x tl tr)     = zip (repeat 0) (map shiftr (draw tr)) ++ [(1, show x ++ "-+")] ++ zip (repeat 2) (map shiftl (draw tl))
  where
    shiftl (0, x)     = spaces ++ "  " ++ x
    shiftl (1, x)     = spaces ++ "+-" ++ x
    shiftl (2, x)     = spaces ++ "| " ++ x
    shiftr (0, x)     = spaces ++ "| " ++ x
    shiftr (1, x)     = spaces ++ "+-" ++ x
    shiftr (2, x)     = spaces ++ "  " ++ x
    spaces           = replicate (length (show x)) ' '

intercalate :: [a] -> [[a]] -> [a]
intercalate _ [] = []
intercalate _ [x] = x
intercalate s (x:xs) = x ++ s ++ intercalate s xs

-}