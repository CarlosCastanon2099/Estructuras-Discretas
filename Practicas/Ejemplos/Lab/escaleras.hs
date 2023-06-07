{- Si se tienen unas escaleras de n escalones y podemos subir los escalones de
1, 2 o 3 pasos a la vez ¿De cuántas formas podemos subir las escaleras? -}
escaleras :: Int -> Int
escaleras n
  | n <= 0 = 0
  | n == 1 = 1
  | otherwise = escaleras (n - 1) + escaleras (n - 2) + escaleras (n - 3)
