module Main where

{- <expr> ::= <variable>
        |  T
        |  F
        |  ¬ <expr>
        |  <expr> ^ <expr>
        |  <expr> v <expr>
        |  <expr> -> <expr>
        |  <expr> <-> <expr>
        |  (<expr>) -}

data Prop
  = T
  | F
  | Var String
  | Neg Prop
  | Conj Prop Prop
  | Disy Prop Prop
  | Impl Prop Prop
  | Syss Prop Prop
  deriving (Eq)

instance Show Prop where
  show :: Prop -> String
  show T = "T"
  show F = "F"
  show (Var x) = x
  show (Neg p) = "(¬" ++ show p ++ ")"
  show (Conj p q) = "(" ++ show p ++ " ^ " ++ show q ++ ")"
  show (Disy p q) = "(" ++ show p ++ " v " ++ show q ++ ")"
  show (Impl p q) = "(" ++ show p ++ " -> " ++ show q ++ ")"
  show (Syss p q) = "(" ++ show p ++ " <-> " ++ show q ++ ")"

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

main = do
  print "Hi"