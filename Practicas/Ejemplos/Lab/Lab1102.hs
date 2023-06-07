
{-
Este module pueden ignorarlo, se usa cuando empiezan a trabajar con funciones
en otro archivo
-}
module Lab1102
where
{-
Noten que no hay identacion todavia, las funciones se declaran "al mismo nivel"
que la palabra "module"
-}


{-
Lo que hace esta funcion solamente es saludas a los numeros del n al 1,
y al final saludarlos a todos. 
El caso base es cuando llegamos a 0 (por lo que no le metan numeros negativos
porque muere.)
El caso recursivo es cuando nos pasan otro numero. Lo que hace es>
"Hola a: " <Chin no se como volver a n un string, entonces se lo paso a una funcion
auxiliar que me ayude a resolver el problema>  y despues el caso recursivo con el numero
menos 1
-}
funcionMain :: Int -> String 
funcionMain 0 = "    Hola a todos"
funcionMain n = (" Hola a: " ++ funcionAuxiliar n) ++ (funcionMain (n-1))

{-
funcionMain 3 = " Hola a:" (funcionAuxiliar n) ++ (funcionMain (3-1))
funcionMain 3 = " Hola a:" ++(funcionAuxiliar n) ++ (funcionMain (3-1))
funcionMain 3 = " Hola a: 3" ++ (funcionMain 2)


funcionMain 2 = " Hola a:" (funcionAuxiliar 2) ++ (funcionMain (2-1))
funcionMain 2 = " Hola a: 2" ++ (funcionMain (1))
funcionMain 1 = " Hola a: 1" ++ (funcionMain (0))
funcionMain 0 = " Hola a todos "


funcionMain 3 = "Hola a: 3" ++  "Hola a: 2" ++ "Hola a: 1" ++ "Hola a todos"
"


-}

{-
La funcion solamente transforma un Int en un string, show es una funcion
que vuelve a los tipos que lo tengan implementado su representacion en una cadena
(Por ejemplo si creas un nuevo tipo tendrias que decirle como hacer su representacion en string)
-}
funcionAuxiliar :: Int -> String 
funcionAuxiliar n = show n