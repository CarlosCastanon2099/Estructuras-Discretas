module Main where

import Data.List

data Prop
  = Var String
  | T
  | F
  | Neg Prop
  | Conj Prop Prop
  | Disy Prop Prop
  | Impl Prop Prop
  | Syss Prop Prop
  deriving (Eq)

instance Show Prop where
  show (Var x) = x
  show T = "T"
  show F = "F"
  show (Neg p) = "¬ " ++ show p
  show (Conj x y) = show x ++ " /\\ " ++ show y
  show (Disy x y) = show x ++ " \\/ " ++ show y
  show (Impl x y) = show x ++ " -> " ++ show y
  show (Syss x y) = show x ++ " <->  " ++ show y

type Estado = [(String, Bool)]

-- [1, 2, 3 ,4, 4, ] -> [2, 4, 4]
-- Tienes que usar lambdas y la funcion filter.
foo :: [Int] -> [Int]
foo xs = filter (\x -> (mod x 2) == 0) xs

-- [1, -1, 2, -10] -> 14
goo :: [Int] -> Int
goo xs = foldl (\acc x -> if x > 0 then acc + x else acc - x) 0 xs

-- ["xs", "ys"] -> "x:xs, y:ys, "
foo1 :: [String] -> String
foo1 xs = foldl (\acc a -> acc ++ (head a) : a) "" xs

lambda1 :: (Int -> Int -> Int) -> [Int] -> Int
lambda1 f l = foldl (\x acc -> (f (f x acc) acc)) 0 l

eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x : xs) = x : eliminaRepetidos (filter (/= x) xs)

permutaciones :: Eq a => [a] -> [[a]]
permutaciones _ = error ""

-- [("p",True),("p",True)]
repetidos :: Estado -> Bool
repetidos [] = True
repetidos [x] = True
repetidos (x : y : xs) = fst x /= fst y && repetidos xs

variables :: Prop -> [String]
variables _ = error ""

-- Función que obtiene los estados de una proposición.
-- (Disy (Var "p") (Var "q")) -> ["p", "q"] ->
--                [[("p", True), ("q", True)],
--                [("p", False), ("q", True)],...]
estados :: Prop -> [[(String, Bool)]]
estados prop = eliminaRepetidos $ map sort (filter repetidos [[x, y] | x <- e, y <- e])
  where
    vars = variables prop
    e = [(x, y) | x <- vars, y <- [True, False]]

{- estados T = [[("", True)]]
estados F = [[("", False)]]
estados (Var x) = [[(x, True)], [(x, False)]]
estados (Neg (Var x)) = [[(x, False)], [(x, True)]]
estados (Conj (Var x) (Var y)) = [[(x, True), (y, True)],
                                  [(x, True), (y, False)],
                                  [(x, True)]] -}

main = do
  print "Hi"