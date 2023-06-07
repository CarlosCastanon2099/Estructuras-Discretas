module Practica2Completa where

import Text.Printf

-- 1
-- Funcion que recibe dos tripletas que representan vectores de numeros enteros y nos devuelve su producto punto.
productoPunto3D :: (Int, Int, Int) -> (Int, Int, Int) -> Int 
productoPunto3D (x1,y1,z1) (x2,y2,z2) = ((x1*x2) + (y1*y2) + (z1*z2))




-- 2
-- Funcion que recibe dos listas de enteros de longitud n,m que representan vectores de numeros enteros y nos devuelve su producto punto.
-- Para esto usaremos la funcion auxiliar juntaListaElementos que nos regresa una lista de parejas de elementos de las listas originales.
-- Para que entonces podamos multiplicar todas las parejas (x,y) y despues sumar todos esos resultados con la funcion sumaLista.
-- sumaLista se encuentra mas abajo por que la cree para el ejercicio 7 y no especificamente para este.
productoPunto :: [Int] -> [Int] -> Int 
productoPunto xs ys = sumaLista [x*y | (x,y) <- juntaListaElementos xs ys] 

-- Funcion auxiliar que a partir de dos listas, regresa una lista con las parejas de elementos de las listas originales.
-- Es decir que si teniamos por ejemplo dos listas, a=[1,2,3] y b=[4,5,6] regresaria [(1,4),(2,5),(3,6)]
juntaListaElementos :: [a] -> [b] -> [(a, b)]
juntaListaElementos xs [] = []
juntaListaElementos [] ys = []
juntaListaElementos (x:xs) (y:ys) = (x, y) : juntaListaElementos xs ys




-- 3
-- Funcion que toma 2 tripletas de enteros que representan dos vectores y nos devuelve su producto cruz.
-- Usando la formula R = a x b = (i,j,k) = (y1*z2 - z1*y2, z1*x2 - x1*z2, x1*y2 - y1*x2)
productoCruz :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
productoCruz (x1,y1,z1) (x2,y2,z2) = (iV,jV,kV)
    where
        iV = (y1*z2) - (z1*y2)
        jV = (z1*x2) - (x1*z2)
        kV = (x1*y2) - (y1*x2)



-- 4
-- Funcion que recibe 2 tripletas de enteros n, m que representan vectores y regresa: n - m (resta de vectores).
restaVectores :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
restaVectores (x1,y1,z1) (x2,y2,z2) = ((x1-x2) , (y1-y2) , (z1-z2))



-- 5
-- Funcion que recibe 3 tripletas de enteros que representan los puntos de un triangulo y regresa un vector ortogonal a la superficie del triangulo.
-- En donde si los puntos estan dados por P1, P2, P3 y a cada punto le corresponde una cordenada (x,y,z)
-- Y considerando a dos vectores V y W tales que V = P2 - P1 y W = P3 - P1 ademas de que el vector N es la superficie normal
-- Tendremos que el vector ortogonal sera (Nx,Ny,Nz) 
-- En donde Nx = (Vy*Wz) - (Vz*Wy) , Ny = (Vz*Wx) - (Vx*Wz) , Nz = (Vx*Wy) - (Vy*Wx)
normalATriangulo :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
normalATriangulo (x1,y1,z1) (x2,y2,z2) (x3,y3,z3) = (nX,nY,nZ)
    where
        v1 = x2-x1
        v2 = y2-y1
        v3 = z2-z1
        w1 = x3-x1
        w2 = y3-y1
        w3 = z3-z1
        nX = (v2*w3) - (v3*w2)
        nY = (v3*w1) - (v1*w3)
        nZ = (v1*w2) - (v2*w1)




-- 6
-- Funcion que recibe un entero y regresa una lista con sus divisores propios.
-- Un divisor propio de un número es cualquier divisor que no es el mismo número que el que divide.
divisoresPropios :: Int -> [Int]
divisoresPropios x = [y | y <- [1..x-1], divisible x y]

-- Funcion auxiliar que nos dice si un numero es divisor de otro.
divisible :: Int -> Int -> Bool
divisible x y = x `mod` y == 0



-- 7
-- Función que suma los primeros n numeros pares.
-- Entiendase por n numeros pares, los primeros n numeros pares, en otras palabras si por ejemplo le pasamos un 10 esto nos
-- regresa los primeros 10 numeros pares y despues los suma (2+4+6+8+10+12+14+16+18+20=110).
sumaPares :: Int -> Int
sumaPares x = sumaLista(pares x)

-- Funcion Auxiliar que suma los elementos de una lista
sumaLista :: [Int] -> Int
sumaLista [ ] = 0
sumaLista (x:xs) = x + sumaLista(xs)

 -- Funcion Auxiliar que calcula una lista de los n pares
pares :: Int -> [Int]
pares n = [2*x | x <- m]
    where m = [1..n]

-- Funcion Auxiliar que verifica que un numero sea par
esPar :: Int -> Bool
esPar x = if (mod x 2) == 0 then True
 else False



-- 8
-- Función para obtener el n-esimo numero primo, con la que usando una lista por comprension
-- Buscamos los numeros primos hasta el n-esimo numero primo y despues regresamos solo el n-esimo numero primo.
primo :: Int -> Int
primo x = [x | x <- [2..], esPrimo x] !! (x-1)

-- Función Auxiliar que verifica si un numero es primo
esPrimo :: Int -> Bool
esPrimo n = length [x | x <- [2..n], n `mod` x == 0] == 1




-- 9
-- Función que suma los digitos de un numero
sumaDigitos :: Int -> Int
sumaDigitos 0 = 0
sumaDigitos x = (mod x 10) + sumaDigitos (div x 10) 



-- 10
-- Funcion que imprime un entero usando la libreria de Haskell "Text.Printf"
imprimeUnEntero :: Int -> String 
imprimeUnEntero = printf "%v"

--esPositivo :: Int -> Bool
--esPositivo x = x >= 0


    -- if x then printf "%d" else printf "-%d"


