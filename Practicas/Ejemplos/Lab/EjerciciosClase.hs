module EjerciciosClase where


-- [(Int,String)]

sumaTripletaString :: (Int, Int, String) -> (Int, Int, String) -> (Int, Int, String)
sumaTripletaString (x1,x2,nombre1) (y1,y2,nombre2) = (x1+y1, x2+y2, nombre1)


sumaTripleta :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
sumaTripleta (x1,x2,x3) (y1,y2,y3) = (x1+y1 , x2+ y2, x3 + y3) 



{-
Una funcion que recibe una lista de Strings, verifica la longitud de cada elemento
de la lista y nos devuelve una lista de tuplas con el string y su longitud.
listaLongitud ["y", "se", "hoy", "info", "cinco"]

 > [, ("se". 2), ("hoy", 3), ("info", 4), ("cinco", 5)]
-}  -- [
    --[Char]
    --]


prueba1 = ["y",  "se", "hoy", "info", "cinco", "Mario"]

listaLongitud :: [String] -> [(String, Int)]
listaLongitud [] = []
listaLongitud (x:xs) =  (x,  length x ) : listaLongitud xs--  1 + listaLongitud xs
 -- x es de tipo string, que es una lista de char
{-
Una funcion que recibe una lista de String que representan los logs de un servidor.
Queremos que nos devuelva una lista de String con el string completo que incluye la palabra
ERROR:
logs ["ERROR: sqlExceptionAt:","INFO: entrando en metodo: ","TRACE: Tardo 1.2 segundos en evitar un error","INFO: Correo enviado a s@gmail.com","INFO: buscaCliente regreso .... ERROR"]
> [
    "ERROR: sqlExceptionAt",
    "INFO: buscaCliente regreso .... ERROR"]
-}

otraCosa = "OTRA COSA"
--Comparo ER R OR EROR: SqlExceptionAt:
-- Comparo E == E 
-- Comparo ERROR INFO: buscaCliente regreso ... ERROR
-- Comparo E == I
prebaLogs1 = ["ERROR: sqlExceptionAt:","INFO: entrando en metodo: ","TRACE: Tardo 1.2 segundos en evitar un error","INFO: Correo enviado a s@gmail.com","INFO: buscaCliente regreso .... ERROR", "ESTO NO ES UN UN error", "ERR ERRKAJSND ESTO NO ES UN error OR"]

-- Verifica si la primer cadena esta contenida dentro de la segunda
-- [Char] = String
contiene :: String -> String -> Bool
contiene [] _ = True
contiene _ [] = False 
---       "OR"   ERRKAJSND ESTO NO ES UN error OR
contiene completa@(x:xs) frase@(y:ys) 
    | completa == take (length completa) frase = True
    | otherwise = contiene completa ys

logs :: [String] -> [String]
logs [] = []
logs (x:xs)  --otraCosa String ("ERROR": "OTRA COSA") -> [String] no se puede comparar con "ERROR" comparar 1 == [1,2,3,4]
    | contiene "ERROR" x = x : logs xs
    | otherwise = logs xs


imprimeMeses :: Int -> String 

imprimeMeses n 
    | n == 1 = "enero"
    | n == 2 = "febrero"
    | n == 3 = "marzo"
    | n == 4 = "abril"

imprimeMeses n = "error de mes"
     --(expresion que se evalue a boolean) 
-- otherwise = true

{-

num1 el primer digito. Int 

num1: string resto del numero


Usar map, filter o foldl Recibe una lista de ints y  devuelve la lista
original con un uno sumado a todos los elementos menores a 5
-}

mapea :: (a -> b) -> [a] -> [b]
mapea _ [] = []
mapea f (x:xs) = (f x): mapea f xs

filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = [] 
filtra f (x:xs) = if f x then x:( filtra f xs) else filtra f xs

aux :: Int -> String
aux n =  'v':(show n)

ejercicioClaseAntePasada :: [Int] -> [String]
ejercicioClaseAntePasada [] = []
ejercicioClaseAntePasada (x:xs) = mapea (aux) (x:xs)

ejercicioClaseAntePasada2 :: [Int] -> [String]
ejercicioClaseAntePasada2 l = mapea (\ x -> 'v':(show x)) l

ejercicioa :: [Int]
ejercicioa = error "falta implementar"

{-
Usar map, filter o foldl para devolver true si todos los elementos son menores a 50
-}
ejerciciob :: [Int]
ejerciciob = error "falta implementar"