{-# LANGUAGE TemplateHaskell #-}
module Practica5Tests
where
import Practica5


import Control.Applicative
import Control.Monad (liftM, liftM2)
import GHC.Base (liftM3)
import Data.List (nub)
import Test.QuickCheck

import Test.QuickCheck.Modifiers (NonEmptyList (..))



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



prop_filtraTieneLongitudPar :: [String] -> Bool
prop_filtraTieneLongitudPar lista = menosLength && todosPar
    where 
        menosLength = length (filtraTieneLongitudPar lista) <= length lista
        todosPar = all even (map length (filtraTieneLongitudPar lista))

prop_concatenaConEspacios :: [String] -> Property
prop_concatenaConEspacios lista = not (null lista) ==> trim (concatenaConEspacios lista) == trim (unwords lista)

isSpace :: Char -> Bool
isSpace c = c == ' '

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

preorder :: Arbol a -> [a]
preorder Vacio = []
preorder (H a) = [a]
preorder (AB a i d) = [a] ++ preorder i ++ preorder d


prop_foldT :: (Eq b) =>  Fun (b ,a) b -> b -> Arbol a -> Bool
prop_foldT (Fun _ f) a0 arbol = (foldlT (curry f) a0 arbol) == (foldl (curry f) a0 $ preorder arbol)

prop_foldlTConcat :: Arbol String -> Bool
prop_foldlTConcat arbol = foldlTConcat
    where 
        foldlTConcat = foldlT (++) [] arbol == (foldr (++) [] $ preorder arbol)


input = Conj (Syss (Var "x") (Neg (F))) (Impl (Disy (Var "a") (Var "b")) F )
res_arbolProp = "(\"[Conj ?Syss x  !Neg F!?  <Impl {Disy a  b}  F>]\" (\"?Syss x  !Neg F!?\" (H: \"x\")  (H: \"<->\")  (\"!Neg F!\" (H: \"~\")  (H: \"F\")  _))  (H: \"^\")  (\"<Impl {Disy a  b}  F>\" (\"{Disy a  b}\" (H: \"a\")  (H: \"V\")  (H: \"b\"))  (H: \"->\")  (H: \"F\")))"

prop_arbolProp :: Bool
prop_arbolProp  = show (propAArbolString input) == res_arbolProp


prop_vars :: Prop -> Bool
prop_vars prop = noRepetidos
    where 
      noRepetidos = length (vars prop) == length (nub (vars prop))


instance Arbitrary Prop where
    arbitrary = sized aux 
        where 
            aux 0 = oneof [pure T, pure F, Var <$> arbitrary]
            aux n =
                oneof
                [
                    pure T,
                    pure F,
                    Var <$> arbitrary,
                    Neg <$> arbitrary,
                    Conj <$> subProp <*> subProp,
                    Disy <$> subProp <*> subProp,
                    Impl <$> subProp <*> subProp,
                    Syss <$> subProp <*> subProp
                ]
                where
                    letras = elements ['a'..'z']
                    subProp = aux (n `div` 2)

prop_ffn :: Prop -> Property
prop_ffn prop  = not (null (vars prop)) ==> interpret 
    where
        interpret = interpretacion (fnn prop) edo == interpretacion ( prop) edo
        edo = zip (vars prop) (repeat True)

-- Ignoren el return [], solo es un problema del alcance con Haskell
return []
runTests = $quickCheckAll