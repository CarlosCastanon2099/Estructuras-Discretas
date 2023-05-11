module Practica5 where

{- 

Alumno: Carlos Emilio Castañon Maldonado

La funcion lambda1 esta definida de la siguiente manera:

lambda1 :: (Int -> Int -> Int) -> [Int] -> Int
lambda1 f l = foldl (\x acc-> f (f x acc) acc) 0 l

De que tipo es x?
Es un numero del tipo Int

De que tipo es acc?
Tambien es un numero del tipo Int

Si modificamos lambda1 para que se defina de la siguiente manera, funcionaria o no? 
Explica por que.

lambda1 :: (Int -> Int -> Int) -> [Int] -> Int
lambda1 f l = foldl (\x acc-> f (f x acc) ) 0 l

La modificación propuesta en la definición de lambda1 no funcionaría 
ya que la función lambda que se utiliza en la llamada a foldl espera dos argumentos
x y acc, pero la expresión lambda proporcionada solo está tomando un argumento.

Al llamar a la función lambda de esta manera (\x acc -> f (f x acc)) en la expresión 
foldl, solo se está pasando un argumento a la función lambda, en este caso x. 
Pero la función lambda necesita dos argumentos por lo que no puede ser evaluada correctamente.

-}

-- 1)
-- Escribe la funcion filtraTieneLongitudPar que recibe una lista de Strings y regresa una lista que
-- contiene solo a los string con una longitud par. Tienes que usar lambdas y la funcion filter.
-- Ejemplo: filtraTieneLongitudPar ["a", "se", "non","casa"] = ["se","casa"]
filtraTieneLongitudPar :: [String] -> [String]
filtraTieneLongitudPar a = filter (\x -> mod (length x) 2 == 0) a



 
-- 2)
-- Escribe la funcion concatenaConEspacios que recibe una lista de strings y regresa un string que es la
-- concatenacion de todos los string con un espacio entre cada palabra. 
-- Debes usar foldr o foldl y lambdas. 
-- Dependiendo de tu eleccion puede haber un espacio en blanco al principio o al final, no importa.
-- Ejemplo: concatenaConEspacios ["hola","mundo","a","todos"] = "hola mundo a todos "
concatenaConEspacios :: [String] -> String
concatenaConEspacios a = foldr (\x acc -> x ++ " " ++ acc) "" a




data Arbol a = Vacio 
    | H a 
    | AB a (Arbol a) (Arbol a)
    deriving (Eq, Show)

-- 3)
-- Define la funcion foldlT que recibe una funcion f(b-> a -> b) un valorInicial a, un Arbol a y regresa un
-- valor b que es el resultado de irle aplicando la funcion f a todo el arbol. 
-- Debe comportarse de manera similar a foldl definido en listas.

-- El recorrido del arbol debe ser Pre order.
-- Debe comportarse de la siguiente manera:
-- Con los Vacio debe reemplazar el valorInicial directamente.
-- Con las (H a) debe aplicar la funcion con el valor y con el valorInicial.

-- Ejemplo1: foldlT (+) 10 (AB 1 (H 2) (H 3)) = 16
-- Ejemplo2: foldlT (++) "x" (AB "1" (AB "2" (H "6") Vacio ) (AB "3" (H "4") (H"5")) ) = "x126345"
-- Ejemplo3: foldlT (-) 0 (AB 1 (AB 2 (H 3) ( H 4) ) (H 5)) = -15
foldlT :: (b -> a -> b) -> b -> Arbol a -> b 
foldlT f a Vacio = a
foldlT f a (H x) = f a x
foldlT f a (AB x h1 h2) = foldlT f (foldlT f (f a x) h1) h2





 
data Prop = Var String | T | F | Neg Prop | Conj Prop Prop | 
    Disy Prop Prop | Impl Prop Prop | Syss Prop Prop 
    deriving (Eq) 

instance Show Prop where 
    show (Var x) = x 
    show (T)  = "T"
    show (F) = "F"
    show (Neg p) = "!Neg "++ show p ++ "!"
    show (Conj x y) = "[Conj " ++ (show x) ++ "  "++ (show y) ++"]"
    show (Disy x y) = "{Disy " ++ (show x) ++ "  "++(show y) ++"}"
    show (Impl x y) = "<Impl " ++ (show x) ++ "  "++(show y) ++">"
    show (Syss x y) = "?Syss " ++ (show x) ++ "  "++(show y) ++"?"

{-
instance Show Prop where 
    show (Var x) = x 
    show (T)  = "T"
    show (F) = "F"
    show (Neg p) = "!Neg "++ show p ++ "!"
    show (Conj x y) = "[Conj " ++ (show x) ++ "  "++ (show y) ++"]"
    show (Disy x y) = "{Disy " ++ (show x) ++ "  "++(show y) ++"}"
    show (Impl x y) = "<Impl " ++ (show x) ++ "  "++(show y) ++">"
    show (Syss x y) = "?Syss " ++ (show x) ++ "  "++(show y) ++"?"

instance Show Prop where
  show (Var x) = x
  show T = "T"
  show F = "F"
  show (Neg p) = "¬ " ++ show p
  show (Conj x y) = show x ++ " /\\ " ++ show y
  show (Disy x y) = show x ++ " \\/ " ++ show y
  show (Impl x y) = show x ++ " -> " ++ show y
  show (Syss x y) = show x ++ " <->  " ++ show y

instance Show Prop where
   show (Var p) = p
   show T = "T"
   show F = "F"
   show (Neg p) = "¬" ++ show p
   show (Conj p q) = "(" ++ show p ++ " ^ " ++ show q ++ ")"
   show (Disy p q) = "(" ++ show p ++ " v " ++ show q ++ ")"
   show (Impl p q) = "(" ++ show p ++ " -> " ++ show q ++ ")"
   show (Syss p q) = "(" ++ show p ++ " <-> " ++ show q ++ ")"
-}



type Estado = [(String, Bool)]



interpretacion :: Prop -> Estado -> Bool
interpretacion T _ = True
interpretacion F _ = False
interpretacion (Neg p) e = not (interpretacion p e) -- if interp p e == False then True else False
interpretacion (Disy p q) e = interpretacion p e || interpretacion q e
interpretacion (Conj p q) e = interpretacion p e && interpretacion q e
interpretacion (Impl p q) e = not (interpretacion p e && not (interpretacion q e))
interpretacion (Syss p q) e = interpretacion (Impl p q) e && interpretacion (Impl q p) e
interpretacion (Var x) e = buscaEstado x e
  where
    buscaEstado :: String -> Estado -> Bool
    buscaEstado x [] = error "No se encontro la variable."
    buscaEstado x ((z, y) : xs) = if x == z then y else buscaEstado x xs


data Arbol3 a = Empty | A3 a (Arbol3 a) (Arbol3 a) (Arbol3 a)
    deriving (Eq)

instance (Show a) => Show (Arbol3 a ) where 
    show Empty = "_"
    show (A3 x Empty Empty Empty) = "(H: " ++ show x ++ ")"
    show (A3 x h1 h2 h3) = "(" ++ show x ++ " " ++ show h1 ++"  "++ show h2 ++"  "++ show h3 ++ ")"

hoja ::  a -> Arbol3 a 
hoja x = A3 x Empty Empty Empty


-- 4)
-- Usando los data Arbol3 y Prop, realiza la funcion propArbol que toma una prop y arma su arbol de sintaxis.
{-
Ejemplos de uso:

propAArbolString (Var "x") = (H: "x")

propAArbolString (Neg (Var "x")) = ("!Neg x!" (H: "~") (H: "x") _)

propAArbolString (Conj (Var "x") (Var "y")) = ("[Conj x y]" (H: "x") (H: "^") (H: "y"))

propAArbolString (Disy (Var "x") (Var "y")) = ("{Disy x y}" (H: "x") (H: "V") (H: "y"))

propAArbolString (Impl (Var "x") (Var "y")) = ("<Impl x y>" (H: "x") (H: "->") (H: "y"))

propAArbolString (Syss (Var "x") (Var "y")) = ("?Syss x y?" (H: "x") (H: "<->") (H: "y"))

propAArbolString (Conj (Syss (Var "x") (Neg (F))) (Impl (Disy (Var "a")(Var "b")) F )) = 
("[Conj ?Syss x !Neg F!? <Impl {Disy a b} F>]" ("?Syss x !Neg F!?" (H: "x") (H:
"<->") ("!Neg F!" (H: "~") (H: "F") _)) (H: "^") ("<Impl {Disy a b} F>" ("{Disy
a b}" (H: "a") (H: "V") (H: "b")) (H: "->") (H: "F")))
-}
propAArbolString :: Prop -> Arbol3 String
propAArbolString p = 
    case p of
        Var x -> hoja x
        T -> hoja "T"
        F -> hoja "F"
        Neg x -> A3 ("!Neg " ++ show x ++ "!") (hoja "~") (propAArbolString x) Empty
        Conj x y -> A3 ("[Conj " ++ show x ++ " " ++ show y ++ "]") (propAArbolString x) (hoja "^") (propAArbolString y)
        Disy x y -> A3 ("{Disy " ++ show x ++ " " ++ show y ++ "}") (propAArbolString x) (hoja "V") (propAArbolString y)
        Impl x y -> A3 ("<Impl " ++ show x ++ " " ++ show y ++ ">") (propAArbolString x) (hoja "->") (propAArbolString y)
        Syss x y -> A3 ("?Syss " ++ show x ++ " " ++ show y ++ "?") (propAArbolString x) (hoja "<->") (propAArbolString y)



 
-- 5)
-- Recibe una Prop y regresa una lista que contiene todas las variables que aparecen. 
-- Sin repetidos.
-- Ejemplo1: vars (Disy (Neg (Var "x")) (Var "y")) = ["x", "y"]
-- Ejemplo2: vars (Disy (Neg (Var "x")) (Conj (Neg (Var "x")) (T))) = ["x"]
-- Ejemplo3: vars (Disy (Neg (Var "x")) (Conj (Neg (Var "x")) (Syss (Var "y") (Var"z")))) = ["x", "y", "z"]
vars :: Prop -> [String]
vars p = eliminaRepetidos (varsAux p)

-- Funcion Auxiliar que originalmente era la funcion vars Original pero que
-- como se puede intuir, tiene un bug el cual hace que la lista final tenga elementos repetidos
-- es por eso que en la nueva version de vars implemente la funcion eliminaRepetidos para solucionarlo.
varsAux :: Prop -> [String]
varsAux p = 
    case p of
        Var x -> [x]
        T -> []
        F -> []
        Neg x -> varsAux x
        Conj x y -> varsAux x ++ varsAux y
        Disy x y -> varsAux x ++ varsAux y
        Impl x y -> varsAux x ++ varsAux y
        Syss x y -> varsAux x ++ varsAux y

-- Funcion Auxiliar que elimina los repetidos de una lista
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = x : eliminaRepetidos (filter (/= x) xs)



 
-- 6)
-- Recibe una prop y regresa la misma proposicion en su forma normal negativa y simplificando las
-- negaciones de constantes. Ademas de que no existen ni Impl ni Syss pues se hacen las equivalencias
-- necesarias para eliminarlas.
-- Una proposicion en Forma Normal Negativa (FNN) es una proposicion que tiene las negaciones
-- aplicadas solo a elementos atomicos: Variables, Constantes (T, F).
-- Ejemplo1: fnn (Neg (Disy (Var "x") T) ) = [Conj !Neg x! F]
-- Ejemplo2: fnn (Neg T) = F
-- Ejemplo3: fnn (Syss (Conj (Var "x") T) (Disy F (Var "y")) ) = [Conj {Disy {Disy !Neg x! F} {Disy F y}} {Disy [Conj T !Neg y!] [Conj x T]}]
fnn :: Prop -> Prop
fnn p = quitaNegaciones $ morgan $ quitaImp p

-- Funcion Auxiliar que elimina las implicaciones
quitaImp :: Prop -> Prop
quitaImp (Impl p q) = Disy (quitaImp (Neg p)) (quitaImp q)
quitaImp (Syss p q) = (Conj (quitaImp (Impl p q)) (quitaImp (Impl q p)))
quitaImp (Conj p q) = Conj (quitaImp p) (quitaImp q)
quitaImp (Disy p q) = Disy (quitaImp p) (quitaImp q)
quitaImp (Neg p) = Neg (quitaImp p)
quitaImp p = p

-- Funcion Auxiliar que aplica las leyes de Morgan
morgan :: Prop -> Prop
morgan (Neg (Conj p q)) = Disy (morgan (Neg p)) (morgan (Neg q))
morgan (Neg (Disy p q)) = Conj (morgan (Neg p)) (morgan (Neg q))
morgan (Neg p) = Neg (morgan p)
morgan (Conj p q) = Conj (morgan p) (morgan q)
morgan (Disy p q) = Disy (morgan p) (morgan q)
morgan p = p

-- Funcion Auxiliar que elimina las negaciones 
quitaNegaciones :: Prop -> Prop
quitaNegaciones (Neg (Neg p)) = quitaNegaciones p
quitaNegaciones (Neg (T)) = (F)
quitaNegaciones (Neg (F)) = (T)
quitaNegaciones (Neg p) = Neg (quitaNegaciones p)
quitaNegaciones (Conj p q) = Conj (quitaNegaciones p) (quitaNegaciones q)
quitaNegaciones (Disy p q) = Disy (quitaNegaciones p) (quitaNegaciones q)
quitaNegaciones p = p


{-

-- Primer Intento de fnn, hace fnn pero aveces no aplica las reglas de negacion sobre T y F

-- Funcion auxiliar que elimina las equivalencias de una formula
quitaSyss :: Prop -> Prop
quitaSyss (Var p) = (Var p)
quitaSyss (T) = (T)
quitaSyss (F) = (F)
quitaSyss (Neg (T)) = (F)
quitaSyss (Neg (F)) = (T)
quitaSyss (Neg p) = Neg (quitaSyss p) 
quitaSyss (Conj p q) = Conj (quitaSyss p) (quitaSyss q) 
quitaSyss (Disy p q) = Disy (quitaSyss p) (quitaSyss q) 
quitaSyss (Impl p q) = Impl (quitaSyss p) (quitaSyss q) 
quitaSyss (Syss p q) = Conj (Impl (quitaSyss p) (quitaSyss q)) (Impl (quitaSyss q) (quitaSyss p))

-- Funcion auxiliar que elimina las implicaciones de una formula
quitaImpl :: Prop -> Prop
quitaImpl (Var p) = (Var p)
quitaImpl (T) = (T)
quitaImpl (F) = (F)
quitaImpl (Neg (T)) = (F)
quitaImpl (Neg (F)) = (T)
quitaImpl (Neg p) = Neg (quitaImpl p) 
quitaImpl (Conj p q) = Conj (quitaImpl p) (quitaImpl q) 
quitaImpl (Disy p q) = Disy (quitaImpl p) (quitaImpl q) 
quitaImpl (Impl p q) = Disy (Neg (quitaImpl p)) (quitaImpl q)
quitaImpl (Syss p q) = Conj (Impl (quitaImpl p) (quitaImpl q)) (Impl (quitaImpl q) (quitaImpl p))

-- Funciones auxiliares que aplican la doble negacion a una formula y la distribucion de conjunciones/disyunciones
-- Para de esta forma si nos encontamos con por ejemplo un (¬¬p) lo convertimos en p y este no se quede como (¬¬p)
meteNegacion :: Prop -> Prop
meteNegacion (Var p) = (Var p)
meteNegacion (T) = (T)
meteNegacion (F) = (F)
meteNegacion (Neg (T)) = (F)
meteNegacion (Neg (F)) = (T)
meteNegacion (Neg (Neg (T))) = (F)
meteNegacion (Neg (Neg (F))) = (T)
meteNegacion (Neg p) = meteNegacion' p
meteNegacion (Conj p q) = Conj (meteNegacion p) (meteNegacion q) 
meteNegacion (Disy p q) = Disy (meteNegacion p) (meteNegacion q) 
 
meteNegacion' :: Prop -> Prop
meteNegacion' (Var p) = Neg (Var p)
meteNegacion' (T) = (T)
meteNegacion' (F) = (F)
meteNegacion' (Neg (T)) = (F)
meteNegacion' (Neg (F)) = (T)
meteNegacion' (Neg p) = meteNegacion p 
meteNegacion' (Conj p q) = Disy (meteNegacion' p) (meteNegacion' q) 
meteNegacion' (Disy p q) = Conj (meteNegacion' p) (meteNegacion' q) 
-}
 


{-
7)
Define la funcion tablaDeVerdad que recibe una Prop y nos devuelve la tabla de verdad
de dicha formula
-- Ejemplo: tablaDeVerdad (Conj (Var "p") (Var "q")) =
                                                    p | q | [Conj p  q]
                                                    -----------------
                                                    True  | True  | True
                                                    True  | False | False
                                                    False | True  | False
                                                    False | False | False

-- Ejemplo2: tablaDeVerdad (Disy (Var "p") (Var "q")) =
                                                    p | q | {Disy p  q}
                                                    -----------------
                                                    True  | True  | True
                                                    True  | False | True
                                                    False | True  | True
                                                    False | False | False

-- Ejemplo3: tablaDeVerdad (Syss (Conj (Var "x") T) (Disy F (Var "y")) ) =
                                                    x | y | ?Syss [Conj x  T]  {Disy F  y}?
                                                    -------------------------------------
                                                    True  | True  | True
                                                    True  | False | False
                                                    False | True  | False
                                                    False | False | True
-}
-- Funcion de la tabla de verdad que recibe una formula (PROP) y nos devuelve la tabla de verdad de dicha formula
tablaDeVerdad :: Prop -> IO ()
tablaDeVerdad p = do
    let vars = eliminaRepetidos $ listaVariables p
    let rows = combinacionesDeValoresVerdad vars
    putStrLn $ intercalate " | " vars ++ " | " ++ show p
    putStrLn $ replicate (length vars + 4 + length (show p)) '-'
    mapM_ (\r -> putStrLn $ intercalate " | " (map (\(x,b) -> show b) r) ++ " | " ++ show (eval p r)) rows


-- Funcion auxiliar que nos devuelve una lista de las variables de una formula
listaVariables :: Prop -> [String]
listaVariables (Var x) = [x]
listaVariables T = []
listaVariables F = []
listaVariables (Neg p) = listaVariables p
listaVariables (Conj p q) = eliminaRepetidos $ listaVariables p ++ listaVariables q
listaVariables (Disy p q) = eliminaRepetidos $ listaVariables p ++ listaVariables q
listaVariables (Impl p q) = eliminaRepetidos $ listaVariables p ++ listaVariables q
listaVariables (Syss p q) = eliminaRepetidos $ listaVariables p ++ listaVariables q


-- Funcion auxiliar que genera todas las posible combinaciones de valores de verdad para una lista de variables
-- en la forma de una lista de estados, es decir, una lista de listas de pares (variable, valor de verdad)
combinacionesDeValoresVerdad :: [String] -> [Estado]
combinacionesDeValoresVerdad [] = [[]]
combinacionesDeValoresVerdad (x:xs) = [(x,True):r | r <- rs] ++ [(x,False):r | r <- rs]
    where rs = combinacionesDeValoresVerdad xs


-- Implementacion de la funcion intercalate de Data.List para no tener que importarla
-- concatena una lista de listas [a] utilizando una lista separadora [a] para intercalar entre cada una de las listas. 
-- Devuelve una única lista resultante [a].
intercalate :: [a] -> [[a]] -> [a]
intercalate _ [] = []
intercalate _ [x] = x
intercalate xs (x:ys) = x ++ xs ++ intercalate xs ys


-- Función Auxiliar que evalua toma una expresión proposicional (Prop) y un estado (Estado) que asigna valores de verdad a las variables
-- y devuelve el resultado de evaluar la expresión en ese estado, utilizando las reglas de la lógica proposicional.
eval :: Prop -> Estado -> Bool
eval (Var x) v = fromJust (lookup x v) -- Usamos lookup para buscar el valor de verdad de la variable x en el estado 
eval T _ = True                        -- Usamos fromJust para obtener el valor de verdad de la variable x en el estado 
eval F _ = False
eval (Neg p) v = not (eval p v)
eval (Conj p q) v = eval p v && eval q v
eval (Disy p q) v = eval p v || eval q v
eval (Impl p q) v = not (eval p v) || eval q v
eval (Syss p q) v = eval p v == eval q v


-- Implementacion de la funcion fromJust de Data.Maybe para no tener que importarla
-- Devuelve el valor contenido en un Maybe, si es Nothing devuelve un error
fromJust :: Maybe a -> a
fromJust (Just x) = x
fromJust Nothing = error "Maybe.fromJust: Nothing"



