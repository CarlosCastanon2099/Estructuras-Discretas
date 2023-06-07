-- Ejemplo de recursion

factorial :: Int -> Int
factorial 0 = 1 -- Caso de termino
factorial n = n * factorial (n-1) -- Caso recursivo


-- 1
-- Calcula la potencia de dos enteros de forma recursiva, es decir, sin utilizar el operador de exponencial

potencia :: Int -> Int -> Int
n `potencia` 0 = 1
n `potencia` k = n * (n `potencia` (k-1))


-- 2
-- Maximo Comun Divisor, Calcula el MCD de dos numeros enteros positivos.

mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b (a `mod` b)

-- 3
-- Maximo Comun Multiplo, Calcula el MCM de dos numeros enteros positivos.
mcm :: Int -> Int -> Int 
mcm a b = (a*b) `div` (s)
 where s = (mcd a b)

-- 4
fizzbuzz :: Int -> String 
fizzbuzz f 
    | f == 1 = "1" 
    | (mod f 5) == 0 && (mod f 3) == 0 = fizzbuzz (f - 1) ++ ", fizzbuzz"
    | (mod f 3) == 0 = fizzbuzz  (f-1) ++ ",fizz" 
    |(mod f 5) == 0 = fizzbuzz (f-1) ++ ",buzz"
    | otherwise = fizzbuzz (f-1) ++ " , " ++ show f

-- 5
cifras :: Int -> Int
cifras 0 = 0
cifras a = 1 + cifras (div a 10)

-- 6
-- funcion que recibe un entero n y retorna la suma de todos los numeros pares de 1 hasta n utilizando recursion.
sumaPares :: Int -> Int
sumaPares 0 = 0
sumaPares x = if (mod x 2) == 0 then x + sumaPares(x-2)
 else sumaPares(x-1)

-- Auxiliar
-- Calcula la posicion n dentro de la sucesion de fibonacci
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

-- Auxiliar
-- Produce una lista de los numeros de fibonacci 
fibonacciLista :: Int -> [Int]
fibonacciLista 0 = []
fibonacciLista 1 = [1]
fibonacciLista n = [fibonacci n] ++ fibonacciLista (n-1)

-- Ejercicio 7
fiboPares :: Int -> Int
fiboPares 0 = 0
fiboPares 1 = 0
fiboPares n = if(mod (fibonacci(n-1)) 2) == 0 then ((fiboPares(n-1)) + (fibonacci(n-1))) else fiboPares(n-2)
