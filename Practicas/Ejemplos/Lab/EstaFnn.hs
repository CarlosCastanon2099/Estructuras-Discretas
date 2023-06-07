module EstaFnn where 


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



estaFnn :: Prop -> Bool
estaFnn T = True 
estaFnn F = True 
estaFnn (Var _) = True 
estaFnn (Neg  (Var x)) = True 
estaFnn (Neg T) = True 
estaFnn (Neg F) = True 
estaFnn (Neg _ ) = False 
estaFnn (Conj a b) = estaFnn a && estaFnn b
estaFnn (Disy a b) = estaFnn a && estaFnn b
estaFnn (Impl a b) = estaFnn a && estaFnn b
estaFnn (Syss a b) = estaFnn a && estaFnn b


esBinaria :: Prop -> Bool
esBinaria (Conj a b) = True
esBinaria (Disy a b) = True
esBinaria (Impl a b) = True
esBinaria (Syss a b) = True 

