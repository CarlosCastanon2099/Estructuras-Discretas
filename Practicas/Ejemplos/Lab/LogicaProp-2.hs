module Lab where 

{-
La siguiente es una lista de Prop:

[True, False] x no son prop porque los constructores de True y False son T y F


[`!Neg "x" !`, `<Impl "x" "y">`, `{Disy "x" "y"}`] x  no es una lista de prop

[Neg (Var "x"), Impl (Var "x") (Var "y"), Disy (Var "x") (Var "y")] esta si es

-}

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


data Arbol a = Vacio 
    | H a 
    | AB a (Arbol a) (Arbol a)
    deriving (Eq, Show)


{-
    EQUIVALENCIAS
    Syss = Si y solo si = Bicondicional = <->
-}

-- La firma de show es  
-- Show a = a -> String
{- | Identidad:

    p o falso da p 
    p y verdadero da p

-}
neutros :: Prop -> Prop
neutros (Disy z F) = z
neutros (Disy F z) = z
neutros (Conj x T) = x 
neutros (Conj T x) = x 
neutros _ = error "neutros no se aplica a esa proposicion"

{- | Vacuidad:


    Conjuncion de falso y lo que sea da falso.
    Disyuncion de verdadero y lo que sea da verdadero.

    Falso implica T 
-}
porVacuidad :: Prop -> Prop
porVacuidad (Conj F _ ) = F 
porVacuidad (Conj _ F ) = F 
porVacuidad (Disy T _ ) = T 
porVacuidad (Disy _ T ) = T
porVacuidad (Impl F _ ) = T


{-| sinDoblesNeg 

    Neg(Neg x)  es lo mismo que x
-}
sinDoblesNeg :: Prop -> Prop
sinDoblesNeg (Neg (Neg x)) =  x


{- | Distributividad.
    p o (q y r) = (p o q) y (p o r)
    p y (q o r) = (p y q) o (p y r)
-}

distributiva :: Prop -> Prop
distributiva (Disy p (Conj q r)) = Conj (Disy p q) (Disy p r)
distributiva (Disy (Conj q r) p) = Conj (Disy p q) (Disy p r)

distributiva (Conj p (Disy q r)) = Disy (Conj p q) (Conj p r)
distributiva (Conj (Disy q r) p) = Disy (Conj p q) (Conj p r)

{- | De Morgan.
    Neg (p o q) = (Neg p) y (Neg q)
    Neg (p y q) = (Neg p) o (Neg q)
-}
deMorgan :: Prop -> Prop
deMorgan (Neg (Disy p q)) = Conj (Neg p) (Neg q)
deMorgan (Neg (Conj p q)) = Disy (Neg p) (Neg q)

{- | sin implicacion ni equivalencia.
    p implica q = Neg p o q


P → Q ≡ ¬P ∨ Q (18) <- 
P ↔ Q ≡ (¬P ∨ Q) ∧ (P ∨ ¬Q) (19)
P <-> Q ≡ (P ∧ Q) ∨ (¬P ∧ ¬Q) (20)

P ↔ Q ≡ (P → Q) ∧ (Q → P )
-}

sinImplniSyss :: Prop -> Prop
sinImplniSyss (Impl p q) = Disy (Neg p) q
--sinImplniSyss (Syss p q) = Conj (Disy (Neg p) q) (Disy p (Neg q))
sinImplniSyss (Syss p q) = Disy (Conj p q) (Conj (Neg p) (Neg q))
--sinImplniSyss (Syss p q) = Conj (Disy (Neg p) q) (Disy (Neg q) p)

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








{- | Recibe una lista de tuplas (Estados) y regresa la lista eliminando los repetidos.
    Ejemplo: [(a,b),(a,c),(a,b)] -> [(a,b),(a,c)] (elimina el ultimo (a,b)
    Nota: No se puede usar nub (funcion que elimina repetidos de una lista
    de cualquier tipo
    Nota2 : Se deben usar funciones de orden superior.
-}
eliminaRepetidos :: Eq a => Eq b => [(a,b)] -> [(a,b)]
eliminaRepetidos _ = error "falta implementar"


{- 
Recibe una proposicion y regresa una lista con todos los estados posibles.
Hay que revisar que no tenga repetidos.
-}

-- type Estado = [(String, Bool)]
estados :: Prop -> Estado
estados T = [(" ",True)]
estados F = [(" ",False)]
estados (Var x) = [(x, True) , (x, False)]



{- | Recibe un estado y dos proposiciones y nos devuelve si bajo ese estado
ambas proposiciones son equivalentes (se interpretan igual)
-}
equiv :: Estado -> Prop -> Prop -> Bool
equiv _ _ _ = error "falta implementar"

