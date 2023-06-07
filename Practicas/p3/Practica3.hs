module Practica3
where



-- Funcion Auxiliar cuya funcion es:
-- Verificar si un elemento se encuentra en una lista
-- La uso en la funcion 3) interseccionListas 
contiene :: (Eq a) => a -> [a] -> Bool
contiene _ [] = False
contiene x (y:ys) = x == y || contiene x ys


-- 1)
-- Funcion que toma una lista y regresa otra lista pero sin elementos repetidos
-- Ejemplo de uso1: eliminaRepetidos [1,2,1,3,1,2,5,6,4,2] = [1,2,3,5,6,4]
-- Ejemplo de uso2: eliminaRepetidos "parangaracutirimicuaro" = parngcutimo
eliminaRepetidos :: (Eq a) => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = x:eliminaRepetidos (eliminaRepetidosAux x xs)

-- Funcion auxiliar de eliminaRepetidos, su funcion es la de eliminar los elementos repetidos
eliminaRepetidosAux :: (Eq a) => a -> [a] -> [a]
eliminaRepetidosAux _ [] = []
eliminaRepetidosAux x (y:ys)
    | x == y = eliminaRepetidosAux x ys
    | otherwise = y:eliminaRepetidosAux x ys




-- 2)
-- La funcion unionListas toma dos listas y regresa la union de ambas listas (sin repetidos).
-- Ejemplo de uso1: unionListas [1,2,3,4,9] [2,2,2,4,1,3,5,7,4] = [1,2,3,4,9,5,7]
-- Ejemplo de uso2: unionListas "amorosa" "guajira" = amorsguji
unionListas :: (Eq a) => [a] -> [a] -> [a]
unionListas xs [] = eliminaRepetidos xs
unionListas [] xs = eliminaRepetidos xs
unionListas (y:ys) xs = eliminaRepetidos (y:unionListas ys xs)




-- 3)
-- La funcion interseccionListas toma dos listas y regresa su interseccion (sin repetidos)
-- Aqui usamos la funcion auxiliar contiene que estaba al principio del archivo
-- Ejemplo de uso1: interseccionListas [1,2,3,5] [5,6,7,8,1,2] = [1,2,5]
-- Ejemplo de uso2: interseccionListas "aeiou" ['a'..'z'] = "aeiou"
interseccionListas :: (Eq a) => [a] -> [a] -> [a]
interseccionListas  xs [] = []
interseccionListas [] xs = []
interseccionListas (y:ys) xs
    | contiene y xs = eliminaRepetidos (y:interseccionListas ys xs)
    | otherwise = eliminaRepetidos (interseccionListas ys xs)




-- 4)
-- La funcion mapea recibe una funcion f (a -> b) y una lista l de tipo a y regresa una lista de tipo b 
-- que es el resultado de aplicarle f a cada uno de los elementos de l
-- Ejemplo de uso: mapea (*10) [1...10] = [10,20,30,40,50,60,70,80,90,100]
mapea :: (a -> b) -> [a] -> [b]
mapea _ [] = []
mapea f (x:xs) = f x:mapea f xs




-- 5)
-- La funcion zipeaWith recibe una funcion f (a -> b -> c), una lista l1 de tipo a y una lista l2 de tipo b 
-- regresa una lista de tipo c que es el resultado de aplicarle f a cada uno de los elementos de l1 y l2
-- Ejemplo de uso: zipeaWith (*) [1..10] [1..10] = [1,4,9,16,25,36,49,64,81,100] 
zipeaWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipeaWith _ [] [] = []
zipeaWith _ [] _ = []
zipeaWith _ _ [] = []
zipeaWith f (x:xs) (y:ys) = f x y:zipeaWith f xs ys




-- 6)
-- La funcion filtra recibe una funcion f (a -> Bool) y una lista l de tipo a 
-- regresa una lista de los elementos de l que cumplan f.
-- Ejemplo de uso: filtra (> 10 ) [1..20] = [11,12,13,14,15,16,17,18,19,20]
filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra f (x:xs)
    | f x = x:filtra f xs
    | otherwise = filtra f xs




-- 7)
-- La funcion minimoLista recibe una lista l de tipo Int y regresa el elemento mas chico de esa lista.
-- Ejemplo de uso: minimoLista [10,12,4,2,7,99] = 2
minimoLista :: [Int] -> Int
minimoLista (x:xs) = minimoListaAux x xs

-- Funcion auxiliar de minimoLista, su funcion es la de recorrer la lista y encontrar el minimo
minimoListaAux :: Int -> [Int] -> Int
minimoListaAux x [] = x
minimoListaAux x (y:ys)
    | x < y = minimoListaAux x ys
    | otherwise = minimoListaAux y ys




-- 8)
-- La funcion aprobados que recibe una lista de tuplas (String, Int) las cuales representan los nombres y calificaciones de un grupo de alumnos.
-- Regresa una tupla cuya primer entrada es una lista de tripletas que contienen:
-- Los nombres de los alumnos que obtuvieron una calificacion mayor a 6, y un mensaje de felicidades.
-- Su calificacion.
-- Un mensaje de felicitacion.
-- El mensaje de felicidades es: "Felicidades!" El mensaje de esforzarse es: "Necesitas esforzarte +"
-- La segunda tiene la misma estructura, solo que contiene a los alumnos con una calificacion menor o igual a 6 y un mensaje de que se esfuercen mas.
-- En esta practica, esta lista la devuelve la funcion: listaAlumnos
-- Debemos usar las funciones mapea y filtra para lograr esto.

calificaciones :: [(String, Int)] -> ([(String, Int, String )], [(String, Int, String)])
calificaciones [] = ([],[])
calificaciones (x:xs) 
    | snd' x > 6 = ((mapea (\(a,b) -> (a,b,"Necesitas esforzarte +")) (filtra (\(a,b) -> b > 6) (x:xs))), (mapea (\(a,b) -> (a,b,"Felicidades!")) (filtra (\(a,b) -> b <= 6) (x:xs))))
    | otherwise = ((mapea (\(a,b) -> (a,b,"Felicidades!")) (filtra (\(a,b) -> b > 6) (x:xs))), (mapea (\(a,b) -> (a,b,"Necesitas esforzarte +")) (filtra (\(a,b) -> b <= 6) (x:xs))))


{-
-- La funcion anterior pero sin usar mapea y filtra, esta version tambien pasa los test 
calificaciones :: [(String, Int)] -> ([(String, Int, String )], [(String, Int, String)])
calificaciones [] = ([],[])
calificaciones (x:xs) 
    | snd' x > 6 = ((fst' x, snd' x, "Felicidades!"):fst' (calificaciones xs), snd' (calificaciones xs))
    | otherwise = (fst' (calificaciones xs), (fst' x, snd' x, "Necesitas esforzarte +"):snd' (calificaciones xs))
-}



-- Funcion Auxiliar que devuelve el primer elemento de una tupla.
-- Ejemplo de uso: fst' (1,2) = 1
fst' :: (a, b) -> a
fst' (x, _) = x

-- Funcion Auxiliar que devuelve el segundo elemento de una tupla.
-- Ejemplo de uso: snd' (12,53) = 53
snd' :: (a, b) -> b
snd' (_, y) = y




-- Funcion que contiene a la lista de alumnos y sus calificaciones
listaAlumnos :: [(String, Int)]
listaAlumnos = [("Benedict",6),("Martin",7),("Paola",6),("Karolina",2),("Lissy",3),
                ("Clari",4),("Ritchie",7),("Anna",1),("Harriott",2),("Wayne",9),
                ("Bryant",6),("Noah",5),("Jerri",3),("Shandra",3),("Ameline",9),
                ("Costanza",3),("Ashlin",6),("Estrella",7),("Perla",9),("Susannah",6),
                ("Anselma",10),("Renie",4),("Whittaker",1),("Madelle",1),("June",10),
                ("Marv",4),("Gwenore",3),("Crysta",3),("Merola",2),("Trent",6)]