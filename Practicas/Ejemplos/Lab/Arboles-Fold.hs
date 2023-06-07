module Lab where



data Arbol a = Vacio 
    | H a 
    | AB a (Arbol a) (Arbol a)
    deriving (Eq, Show)

{-
 Este es sola la implementacion de show para el dato arbol. Es solo 
 para que se imprima en la pantalla de una forma personalizada. 

instance (Show a) => Show (Arbol a ) where 
    show Vacio = " _ "
    show (H a) = "[Hoja: " ++ show a ++ "]"
    show (AB a Vacio Vacio) = "[Hoja: " ++ show a ++"]"
    show (AB dato izq der) = "[ " ++ (show dato) ++ " hijoL: " ++ (show izq) ++ "| Hijod: " ++ (show der)  ++ " ]"
-}

foldr2 :: (a -> b -> b) -> b -> [a] ->  b
foldr2 _ a [] = a
foldr2 f valorInicial (x:xs) = f x (foldr2 f valorInicial xs)


foldl2 :: (b-> a -> b) -> b -> [a] -> b
foldl2 _ a [] = a
foldl2 f valorInicial (x:xs) = foldl2 f (f valorInicial x) xs


misterio :: Int -> String 
misterio 0 = "0"
misterio _ = ""

misterio2 :: [(Int, Int)] -> Int
misterio2  lista  = foldl (\ acc (x,y) -> acc + x + y ) 0 lista

data P = Persona String | Animal | Cosa 
    deriving (Show)
{-
Devuelve true si todos los elementos son pares
-}
foldf2 :: [Int] -> Bool
foldf2 lista = foldl (\ acc x-> if (mod x 2) == 0 then acc else False ) True lista



{-
Queremos una funcion sumaSiSonPares
Recibe una lista y suma todos sus elementos si son impares.
Suma todos los elementos que sean impares
-}

sumaSiSonImPares :: [Int] -> Int 
sumaSiSonImPares lista = foldl (\ acc x -> if (mod x 2) == 1 then acc + x else acc ) 0 lista



{-
Vamos a concatenar todas las cadenas 
foldf1 ["hola", "a", "todos"]
" hola a todos "
-}
foldf1 :: [String] -> String 
foldf1 lista = foldl (\ acc x -> acc ++ [' '] ++ x) [] lista



{-
=======================================
INSERTAR A UN ARBOL
=======================================
-}

{- 
    Vamos a crear un metodo inserta en el que "simplemente"
    vamos a meter el elemento en la posicion disponible siguiente.
-}

hayDisponibles :: Arbol a -> Bool 
hayDisponibles Vacio = True 
hayDisponibles (H _) = True 
--hayDisponibles (AB _ Vacio Vacio) = True
hayDisponibles (AB _ Vacio r) = True 
hayDisponibles (AB _ i Vacio) = True 
hayDisponibles (AB _ i d) = False

insertaTodoAux :: [a] -> Arbol a -> Arbol a 
insertaTodoAux [] arbol = arbol                                             --1
insertaTodoAux (x:xs) Vacio = insertaTodoAux xs (AB x Vacio Vacio)          --2
insertaTodoAux (x:xs) (H y) = insertaTodoAux xs (AB y (H x) Vacio)          --3
insertaTodoAux (x:xs) (AB y Vacio der) = insertaTodoAux xs (AB y (H x) der) --4
insertaTodoAux (x:xs) (AB y izq Vacio) = insertaTodoAux xs (AB y izq (H x)) --5
insertaTodoAux (x:xs) (AB y izq der) 
    | hayDisponibles izq = insertaTodoAux xs (AB y (insertaTodoAux [x] izq) der) --6
    | hayDisponibles der = insertaTodoAux xs (AB y izq (insertaTodoAux [x] der)) --7
    | otherwise = insertaTodoAux xs (AB y (insertaTodoAux [x] izq) der)

{-
insertaTodoAux [1,2,3,4,5,6,7,8] Vacio
insertaTodoAux [1,2,3,4,5,6,7,8] Vacio = insertaTodoAux [2...8] (AB 1 Vacio Vacio)
insertaTodoAux [2...8] (AB 1 Vacio Vacio) = insertaTodoAux [3..8] (AB 1 (insertaTodoAux [2] Vacio) Vacio)
    insertaTodoAux [3..8] (AB 1 (insertaTodoAux [2] Vacio) Vacio) =  insertaTodoAux [] (AB 2 Vacio Vacio) = AB 2 Vacio Vacio
insertaTodoAux [3..8] (AB 1 (AB 2 Vacio Vacio) Vacio) = insertaTodoAux [4..8] (AB 1 (AB 2 Vacio Vacio) (H 3))
insertaTodoAux [4..8] (AB 1 (AB 2 Vacio Vacio) (H 3)) = insertaTodoAux [5..8] (AB 1 (InsertaTodoAux [4] AB 2 Vacio Vacio) (H 3))
     (InsertaTodoAux [4] (AB 2 Vacio Vacio)  = insertaTodoAux [] (AB 2 (H 4) Vacio ) = (AB 2 (H 4 ) Vacio)
 insertaTodoAux [5..8] (AB 1 (AB 2 (H 4 ) Vacio) (H 3))  = 
    insertaTodoAux [6..8] (AB 1 (AB 2 (H 4) (AB 5 Vacio Vacio)) H 3)
insertaTodoAux [6..8] (AB 1 (AB 2 (H 4) (AB 5 Vacio Vacio) ) H 3)
insertaTodoAux [7,8] (AB 1 (AB 2 (H 4) (AB 5 Vacio Vacio) ) (AB 3 (H 6) Vacio)

insertaTodoAux [8] (AB 1 (AB 2 (H 4) (AB 5 Vacio Vacio) ) (AB 3 (H 6) (H 7))


                    1
            2                3
        4        5          6     7
    8     9     10 11
12  16   14 15      
                    
                4
            5
        6
    7
8

insertaTodoAux (4:[]) (AB 1 (H 2) (H 3))
-}
-- (Como irnos a la izquierda y despues a la derecha)


insertaTodo :: [a] -> Arbol a 
insertaTodo l = insertaTodoAux l Vacio


{-
=======================================
FOLDS
=======================================
-}
