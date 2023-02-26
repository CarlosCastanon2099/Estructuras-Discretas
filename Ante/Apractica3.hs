-- Ejer. Ejemplos
primerElemento :: [a] -> a
primerElemento (x:xs) = x

ultimoElemento :: [a] -> a
ultimoElemento [x] = x
ultimoElemento (x:(z:zs)) = ultimoElemento (z:zs)

data Var = A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z deriving (Show, Eq, Ord)
data Formula = Prop Var |Neg Formula |Formula :&: Formula |Formula :|: Formula |Formula :=>: Formula |Formula :<=>: Formula deriving (Show, Eq, Ord)
infixl 9 :&:
infixl 9 :|:
infixl 7 :=>:
infixl 8 :<=>:

data Tree a = Void | Node (Tree a) a (Tree a) deriving (Show, Eq)


-- Ejercicios
-- 1
-- La funcion verifica si una lista es palindromo. 
-- Ejemplo de uso : palindromo "anitalavalatina"

palindromo :: Eq a => [a] -> Bool
palindromo xs = case xs of 
                        [] -> True 
                        [x] -> True
                        a -> (last a) == (head a) && (palindromo (drop 1 (take (length a - 1) a)))


-- 2
-- La funcion debe calcular la diferencia simetrica entre dos listas.
-- Ejemplo de uso : diferenciaSimetrica [2,5,3] [4,2,3,7]

diferenciaSimetrica :: Eq a => [a] -> [a] -> [a]
diferenciaSimetrica xs ys = diferencia xs ys ++ diferencia ys xs

-- Auxiliares de 2 
compa :: Eq a => [a] -> a -> Bool
compa [] x = False
compa (x:xs) y = if x == y then True else compa xs y

diferencia :: Eq a => [a] -> [a] -> [a] 
diferencia [] ys = []
diferencia (x:xs) ys = if compa ys x then diferencia xs ys else [x] ++ diferencia xs ys


-- 3
-- La funcion devuelve una lista con todas las variables de una formula. La lista no debe contener repetidos.
-- Ejemplo de uso: variables ((Prop A) :&: (Prop B))

variables :: Formula -> [Var]
variables (Prop x) = [x]
variables (Neg x) = devolucion (variables x)
variables (x :&: y) = devolucion (variables x ++ variables y)
variables (x :|: y) = devolucion (variables x ++ variables y)
variables (x :=>: y) = devolucion (variables x ++ variables y)
variables (x :<=>: y) = devolucion (variables x ++ variables y)


-- Auxiliar de 3 
devolucion :: Eq a => [a] -> [a]
devolucion [] = []
devolucion (x:xs) = if compa xs x then devolucion xs else (x:devolucion xs)



-- 4
-- La funcion recibe una formula y devuelve la formula equivalente sin condicionales, bicondicionales y la negacion solo esta frente a variables proposicionales. 
-- Ejemplo de uso: equivalencia ((Prop P) :=>: (Prop Q))

equivalencia :: Formula -> Formula
equivalencia x = formulaNegada (cambio x) False

-- Auxiliares de 4

cambio :: Formula -> Formula 
cambio (Prop x) = Prop x
cambio (Neg x) = Neg (cambio x)
cambio (x :&: y) = cambio x :&: cambio y
cambio (x :|: y) = cambio x :|: cambio y
cambio (x :=>: y) = Neg (cambio x) :|: cambio y
cambio (x :<=>: y) = cambio (x :=>: y) :&: cambio (y :=>: x)

formulaNegada :: Formula -> Bool -> Formula
formulaNegada (Prop x) negado = if negado then Neg (Prop x) else Prop x
formulaNegada (Neg x) negado = formulaNegada x (not negado)
formulaNegada (x :&: y) negado = if negado then formulaNegada x True :|: formulaNegada y True else formulaNegada x False :&: formulaNegada y False
formulaNegada (x :|: y) negado = if negado then formulaNegada x True :&: formulaNegada y True else formulaNegada x False :|: formulaNegada y False


-- 5
-- La funcion recibe una formula y una lista con parejas formadas por una variable y su valor booleano
-- La funcion devuelve la interpretacion de la formula usando la lista de parejas
-- Puedes asumir que todas las variables tienen su valor en la lista de parejas

interpretacion :: Formula -> [(Var,Bool)] -> Bool
interpretacion x lista = interprete (cambio x) lista

-- Auxiliares de 5

interprete :: Formula -> [(Var,Bool)] -> Bool 
interprete (Prop x) lista = rfc x lista
interprete (Neg x) lista = not (interprete x lista)
interprete (x :&: y) lista = interprete x lista && interprete y lista
interprete (x :|: y) lista = interprete x lista || interprete y lista

rfc :: Var -> [(Var,Bool)] -> Bool 
rfc x ((y,z):ys) = if x == y then z else rfc x ys


-- 6
-- La funcion recibe un arbol, un elemento del tipo del arbol y devuelve True si el elemento esta en el arbol
-- en otro caso devuelve False

contiene :: (Eq a) => Tree a -> a -> Bool
contiene (Void) y = False
contiene (Node l x r) y = x == y || contiene l y || contiene r y


-- 7
-- funcion que recibe un arbol binario T y devuelve su altura.

altura :: Tree a -> Int
altura (Void) = 0
altura (Node l x r) = if altura l >= altura r then 1 + altura l else 1 + altura r









