{-# LANGUAGE TemplateHaskell #-}
module Practica3Tests
where
import Practica3

import Test.QuickCheck

import Data.List
import qualified Data.Set as S
import Control.Applicative

prop_contieneTest ::(Eq a) => a -> [a] -> Bool
prop_contieneTest a as= elem a as == contiene a as


prop_eliminaRepetidos :: (Ord a)=> (Eq a) => [a] -> Bool
prop_eliminaRepetidos as = (nub (sort as) ) == sort (eliminaRepetidos as)



prop_unionListas :: (Ord a) => (Eq a) => [a] -> [a] -> Bool
prop_unionListas l1 l2 = (S.union l1' l2') == S.fromList (unionListas l1 l2)
    where 
        l1' = S.fromList l1 
        l2' = S.fromList l2

prop_interseccionListas :: (Ord a) => (Eq a) => [a] -> [a] -> Bool 
prop_interseccionListas l1 l2 = S.intersection l1' l2' == S.fromList(interseccionListas l1 l2)
    where 
        l1' = S.fromList l1 
        l2' = S.fromList l2

prop_mapea :: (Eq b) => Fun a b -> [a] -> Bool
prop_mapea (Fun _ f) l = (map f l) == (mapea f l )

prop_zipeaWith :: Eq c => Fun (a, b) c -> [a] -> [b] -> Bool
prop_zipeaWith (Fun _ f) l1 l2 = (zipWith (curry f) l1 l2) == (zipeaWith (curry f ) l1 l2)



prop_filtra :: (Eq a) => Fun a Bool -> [a] -> Bool
prop_filtra (Fun _ f) l = (filter f l) == (filtra f l)


prop_minimoLista :: [Int] -> Property
prop_minimoLista l = not (null l) ==> minimoLista l == minimum l


aprobados  :: [(String, Int, String)]

aprobados = [("Martin",7,"Felicidades!"),("Ritchie",7,"Felicidades!"),
            ("Wayne",9,"Felicidades!"),("Ameline",9,"Felicidades!"),
            ("Estrella",7,"Felicidades!"),("Perla",9,"Felicidades!"),
            ("Anselma",10,"Felicidades!"),("June",10,"Felicidades!")]

reprobados  :: [(String, Int, String)]
reprobados = [("Benedict",6,"Necesitas esforzarte +"),("Paola",6,"Necesitas esforzarte +"),
                      ("Karolina",2,"Necesitas esforzarte +"),("Lissy",3,"Necesitas esforzarte +"),
                      ("Clari",4,"Necesitas esforzarte +"),("Anna",1,"Necesitas esforzarte +"),
                      ("Harriott",2,"Necesitas esforzarte +"),("Bryant",6,"Necesitas esforzarte +"),
                      ("Noah",5,"Necesitas esforzarte +"),("Jerri",3,"Necesitas esforzarte +"),
                      ("Shandra",3,"Necesitas esforzarte +"),("Costanza",3,"Necesitas esforzarte +"),
                      ("Ashlin",6,"Necesitas esforzarte +"),("Susannah",6,"Necesitas esforzarte +"),
                      ("Renie",4,"Necesitas esforzarte +"),("Whittaker",1,"Necesitas esforzarte +"),
                      ("Madelle",1,"Necesitas esforzarte +"),("Marv",4,"Necesitas esforzarte +"),
                      ("Gwenore",3,"Necesitas esforzarte +"),("Crysta",3,"Necesitas esforzarte +"),
                      ("Merola",2,"Necesitas esforzarte +"),("Trent",6,"Necesitas esforzarte +")] 
prop_calificaciones :: Bool 
prop_calificaciones = and res
    where

        
        res1 = (fst $ calificaciones listaAlumnos) == aprobados 
        res2 = (snd $ calificaciones listaAlumnos ) == reprobados 
        res = [res1,res2]

-- Ignoren el return [], solo es un problema del alcance con Haskell
return []
runTests = $quickCheckAll