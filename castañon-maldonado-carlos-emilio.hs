-- 1
-- Define las siguientes listas utilizando listas por comprension:

-- Nota:
-- Ya que no se especifica si queremos los primeros n numeros o cuantos numeros debe tener cada lista
-- Procedemos a limitar nuestras listas a los primeros 100 numeros
-- Ya que el conjunto de los numeros descritos, todos son infinitos
m = [1..100]

-- a) Lista que contenga a todos los numeros naturales.
-- Ejemplo de uso: numerosNaturales
numerosNaturales = [x | x <- m]

-- b) Lista que contenga todos los multiplos de 10.
-- Ejemplo de uso: multiplosDeDiez
multiplosDeDiez = [10*x | x <- m]

-- c) Lista que contenga unicamente numeros primos.
-- A diferencia de las anteriores, esta solo la pude hacer haciendo uso de una funcion que calculara la lista de primos hasta el enesimo numero primo
-- Por lo que si se quieren los primeros 100 primos, basta con poner como argumento :
-- Ejemplo de uso: listaPrimos 100
listaPrimos :: Int -> [Int]
listaPrimos n = [x | x <- [2..n], primo x]

-- Funcion auxiliar de c)
-- Funcion que verifica si un numero es primo
primo :: Int -> Bool
primo n = length [x | x <- [2..n], n `mod` x == 0] == 1


-- 2
-- Define la funcion natToInt, la cual debe recibir un numero natural n y devuelve el mismo como un entero (Int).
-- Ejemplo de uso: natToInt ( Suc ( Suc ( Suc ( Suc Cero ))))
data Nat = Cero | Suc Nat
           deriving Show

natToInt :: Nat -> Int
natToInt Cero = 0
natToInt (Suc n) = 1 + natToInt n


-- 3
-- Define la funcion intToNat, la cual debe recibir un numero entero y devuelve el mismo como un natural.
-- Ejemplo de uso: intToNat 4
intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat n = Suc (intToNat (n-1))


-- 4
-- Funcion que recibe dos numeros naturales n y m y devuelve el numero de combinaciones de n elementos tomados de m en m
-- Ejemplo de uso: combinaciones ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc Cero ))
combinaciones :: Nat -> Nat -> Nat
combinaciones n k = intToNat z
    where c = natToInt n
          m = natToInt k
          z = (comb c m)

-- Funcion auxiliar de 4
-- Funcion que calcula la combinatoria en formato int 
-- Usando la Formula de (comb n k) = n! / (k!(n-k)!)
comb :: Int -> Int -> Int
comb n k = (factorial n) `div` ((factorial k) * (factorial (n-k)))

-- Funcion auxiliar de 4
-- Funcion que calcula el factorial de un numero entero positivo en formato int
factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1) 


-- 5
-- Recibe dos numeros naturales y devuelve como resultado su maximo comun divisor.
-- Ejemplo de uso: mcd ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc ( Suc Cero )))
mcd :: Nat -> Nat -> Nat
mcd a b = intToNat (mcd' (natToInt a) (natToInt b))

-- Funcion auxiliar de 5
-- Maximo Comun Divisor, Calcula el MCD de dos numeros enteros positivos en formato int.
mcd' :: Int -> Int -> Int
mcd' a 0 = a
mcd' a b = mcd' b (a `mod` b)


-- 6
-- Recibe dos numeros naturales y devuelve como resultado su minimo comun multiplo.
-- Ejemplo de uso: mcm ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc Cero ))
mcm :: Nat -> Nat -> Nat
mcm a b = intToNat (mcm' (natToInt a) (natToInt b))

-- Funcion auxiliar de 6
-- Minimo comun multiplo, Calcula el MCM de dos numeros enteros positivos en formato int.
-- Cabe destacar que hacemos uso tambien de la funcion mcd' para poder calcular el mcm'
mcm' :: Int -> Int -> Int 
mcm' a b = (a*b) `div` (s)
 where s = (mcd' a b)


-- 7
-- Recibe un numero natural n y devuelve el n-esimo elemento de la serie de Fibonacci.
-- Ejemplo de uso: fibonacci (Suc ( Suc ( Suc ( Suc ( Suc ( Suc Cero ))))))
fibonacci :: Nat -> Nat
fibonacci n = intToNat (fibonacci' (natToInt n))

-- Funcion auxiliar de 7
-- Calcula el enesimo numero n dentro de la sucesion de fibonacci en formato int
fibonacci' :: Int -> Int
fibonacci' 0 = 0
fibonacci' 1 = 1
fibonacci' n = fibonacci' (n-2) + fibonacci' (n-1)

