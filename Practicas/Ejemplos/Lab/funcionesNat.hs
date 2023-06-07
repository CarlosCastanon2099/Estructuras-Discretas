

main = print $ potNat (Suc ( Suc (Suc Cero))) (Suc (Suc Cero))


-- El conjunto de Nat se define recursivamente como
--    Cero es un Nat
--    Si x es un Nat entonces (Suc x) es un Nat

data Nat = Cero | Suc Nat deriving(Show,Eq)

sumaNat :: Nat -> Nat -> Nat
sumaNat n Cero = n
sumaNat n (Suc m) = Suc (sumaNat n m)

{-  sumaNat (Suc(Suc Cero)) (Suc(Suc(Suc Cero))) = Suc (sumaNat (Suc(Suc Cero)) (Suc(Suc Cero))) 
                                                 = (Suc (Suc (Suc (Suc(Suc Cero)))) ) 
    sumaNat (Suc(Suc Cero)) (Suc(Suc Cero)) = Suc (sumaNat (Suc(Suc Cero)) (Suc Cero)) = (Suc (Suc (Suc(Suc Cero))))
    sumaNat (Suc(Suc Cero)) (Suc Cero) = Suc (sumaNat (Suc(Suc Cero)) Cero) = (Suc (Suc(Suc Cero)))  

-}

prodNat :: Nat -> Nat -> Nat
prodNat n Cero = Cero
prodNat n (Suc m) = sumaNat n (prodNat n m)


par::Nat -> Bool
par Cero = True
par (Suc Cero) = False
par (Suc (Suc n)) = par n 

{-
par (Suc (Suc (Suc (Suc Cero)))) = par (Suc (Suc Cero))
                                 = par Cero = True

par (Suc (Suc (Suc (Suc (Suc Cero))))) = par (Suc (Suc (Suc Cero)))
                                       = par (Suc Cero) = False

-}

par2::Nat -> Bool
par2 Cero = True
par2 (Suc n) = impar2 n

impar2::Nat -> Bool
impar2 Cero = False
impar2 (Suc n) = par2 n

{- par2 (Suc (Suc (Suc (Suc Cero)))) = impar2 (Suc (Suc (Suc Cero)))
                                  = par2 (Suc (Suc Cero))
                                  = impar2 (Suc Cero)
                                  = par2 Cero
                                  = True

impar2 (Suc (Suc (Suc (Suc Cero)))) = par2  (Suc (Suc (Suc Cero)))
                                    = impar2 (Suc (Suc Cero))
                                    = par2 (Suc Cero)
                                    = impar2 Cero
                                    = False
-}

-- fact n = 1*2*3*4*...*n
factNat::Nat -> Nat
factNat Cero = (Suc Cero)
factNat (Suc n) = prodNat (Suc n) (factNat n)

-- potNat n m = n^m
potNat:: Nat -> Nat -> Nat
potNat Cero Cero    = error "No está definida"
potNat n    Cero    = (Suc Cero)
potNat n    (Suc m) = prodNat n (potNat n m)

restaNat Cero (Suc n) = error "No definida"
restaNat   n   Cero    = n
restaNat (Suc n) (Suc m) = restaNat n m