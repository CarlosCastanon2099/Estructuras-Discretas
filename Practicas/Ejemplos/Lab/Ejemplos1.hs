-- Rangos
listaUnoAVeinte :: [Int]
listaUnoAVeinte = [1 .. 20]

-- Lista por comprensión
listaPorComprension :: [Int]
listaPorComprension = [2 * x | x <- [1 .. 10]]

-- Función que toma como base la formula de la distancia entre dos puntos, y las
-- coordenadas de dichos puntos serian los parametros
-- de entrada en forma de tuplas "(x1,y1)" y "(x2,y2)",
-- (que deben ser de tipo float)
distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) =
  sqrt (((x2 - x1) ** 2) + ((y2 - y1) ** 2))

-- Función que representa la tabla de verdad de la compuerta logica XOR
xor :: Bool -> Bool -> Bool
xor True True = False
xor n m = n || m
