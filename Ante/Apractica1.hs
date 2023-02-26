
--Ejercicios de la practica 1

-- 1
absoluto :: Float -> Float 
absoluto x = if (x > 0) then x else -x

-- 2
incremental :: Int -> Int -> Int -> Int ->
Bool 
incremental x y z = x <= y && y <= z && z <= a

-- 3
semiperimetro :: Float -> Float -> Float -> Float
semiperimetro a b c = (a + b + c)/2

-- 4
area :: Float -> Float -> Float -> Float 
area a b c = sqrt (s*(s-a)*(s-b)*(s-c))
where s = (semiperimetro a b c)

-- 5
cuadratica :: Float -> Float -> Float -> Float -> Float
cuadratica a b c v = (a*(v^2)) + (b*v) + c

-- 6
hipotenusa :: Int -> Int -> Int
hipotenusa b h = ((b*b)+(h*h))

-- 7
normaVectorial :: (Float,Float) -> Float
normaVectorial (x,y) = sqrt((x^2)+(y^2))

-- 9
sumaFraciones :: (Int,Int) -> (Int,Int) -> (Int,Int)
sumaFraciones (a,b) (c,d) = ((a*d)+(b*c),(b*d))

-- 10
productoPunto :: (Float,Float) -> (Float,Float) -> Float
productoPunto (x1,y1) (x2,y2) = ((x1*x2) + (y1*y2))

-- 11
distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt(((x2-x1)^2)+((y2-y1)^2))

-- 12
pendienteRecta :: (Float,Float) -> (Float,Float) -> Float
pendienteRecta (x1,y1) (x2,y2) = (y2-y1)/(x2-x1)
