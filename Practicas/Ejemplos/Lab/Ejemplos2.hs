module Main where

-- Función que toma una lista, una función y un valor acumulador
-- y devuelve el resultado de aplicar la función de forma secuencial a cada
-- elemento de la lista.
-- foldr
-- [1, 2, 3] (+) 0
-- ((0 + 1) + 2) + 3) = 6
-- reduce [1..10] (+) 0
-- acc | elemento
-- 0 + 1 = 1
-- 1 + 2 = 3
-- 3 + 3 = 6
-- 6 + 4 = 10
-- ...
reduce :: [a] -> (a -> b -> b) -> b -> b
reduce [] f acc = acc
reduce (x : xs) f acc = reduce xs f (f x acc)

-- Función que dado un numero lo convierte en negativo, si ya era negativo lo
-- mantiene igual.
negativo :: Int -> Int
negativo n
  | n >= 0 = -1 * n
  | otherwise = n

-- Función que dadas dos fuciones y un valor regresa la aplicación de la primera
-- función con el resultado de aplicar la segunda función sobre el valor dado.
-- f . g v
composicion :: (a -> b) -> (b -> c) -> a -> c
composicion f g v = g (f v)

-- Función que dada otra función invierte los valores que recibe
-- foo :: Int -> String -> String
-- flip foo :: String -> Int -> String
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where
    g x y = f y x

main = do
  print "Hola"