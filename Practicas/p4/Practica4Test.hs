module Practica4Test where

import Control.Monad (liftM)
import GHC.Base (liftM3)
import Practica4
import Test.QuickCheck
import Test.QuickCheck.Modifiers (OrderedList)

buscaAB :: Eq a => a -> Arbol a -> Bool
buscaAB _ Vacio = False
buscaAB x (H n) = n == x
buscaAB x (AB raiz izq der)
  | x == raiz = True
  | otherwise = buscaAB x izq || buscaAB x der

altura :: Arbol a -> Int
altura Vacio = 0
altura (H _) = 1
altura (AB _ izq der) = 1 + max (altura izq) (altura der)

contar :: Arbol a -> Int
contar Vacio = 0
contar (H _) = 1
contar (AB _ i d) = 1 + contar i + contar d

instance Arbitrary a => Arbitrary (Arbol a) where
  arbitrary = sized arbol
    where
      arbol 0 = return Vacio
      arbol n =
        oneof
          [ return Vacio,
            liftM H arbitrary,
            liftM3 AB arbitrary subarbol subarbol
          ]
        where
          subarbol = arbol (n `div` 2)

prop_fromList_member :: [Int] -> Bool
prop_fromList_member xs = all (`buscaAB` t) xs
  where
    t = listaAArbol xs

prop_minimo :: NonEmptyList Int -> Bool
prop_minimo (NonEmpty xs) = minimo arbol == minimum xs
  where
    arbol = listaAArbol xs

prop_maximo :: NonEmptyList Int -> Bool
prop_maximo (NonEmpty xs) = maximo arbol == maximum xs
  where
    arbol = listaAArbol xs

prop_inorder :: [Int] -> Bool
prop_inorder xs = all (`buscaAB` arbol) (inorder arbol)
  where
    arbol = listaAArbol xs

prop_postorderRaizUltimo :: [Int] -> Property
prop_postorderRaizUltimo xs = case arbol of
  Vacio -> property True
  H n -> property True
  AB x _ _ -> last (postorder arbol) === x
  where
    arbol = listaAArbol xs

prop_mapT_preserva_estructura :: Arbol Int -> Bool
prop_mapT_preserva_estructura t = altura t == altura (mapT (+ 1) t)

prop_filterT_elimina_elementos :: Int -> Arbol Int -> Bool
prop_filterT_elimina_elementos x t = not (buscaAB x (filterT (/= x) t))

prop_filterT_preserva_estructura :: Arbol Int -> Bool
prop_filterT_preserva_estructura t = altura t >= altura (filterT (> 0) t)

prop_contarPor_0 :: NonNegative Int -> Bool
prop_contarPor_0 (NonNegative n) = contarPor (== 0) (listaAArbol [0 .. n]) == 1

prop_contarPor_contar :: Fun Int Bool -> Arbol Int -> Bool
prop_contarPor_contar (Fun _ f) a = contarPor f a <= contar a

prop_listaPor :: Fun Int Bool -> Arbol Int -> Bool
prop_listaPor (Fun _ f) a = all f (listaPor f a)