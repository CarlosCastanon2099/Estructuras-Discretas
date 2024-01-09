<div align="center">
  
# **Practica 5** 🐯🎳
  

[![](https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif)](https://www.youtube.com/watch?v=k6EQAOmJrbw)

</div>
  
---

## **Uso**



Compilar mediante:

```Ruby
ghci Practica5.hs
```

Una vez compilado, tendremos acceso a las siguientes funciones:

📌 tablaDeVerdad

La Función tablaDeVerdad recibe una proposicion y regresa su tabla de verdad
  - Ejemplos de uso:

```Haskell
*Practica5> tablaDeVerdad (Conj (Var "p") (Var "q"))
p | q | [Conj p  q]
-----------------
True  | True  | True
True  | False | False
False | True  | False
False | False | False

*Practica5> tablaDeVerdad (Disy (Var "p") (Var "q"))
p | q | {Disy p  q}
-----------------
True  | True  | True
True  | False | True
False | True  | True
False | False | False

*Practica5> tablaDeVerdad (Syss (Conj (Var "x") T) (Disy F (Var "y")) )
x | y | ?Syss [Conj x  T]  {Disy F  y}?
-------------------------------------
True  | True  | True
True  | False | False
False | True  | False
False | False | True
```

📌 filtraTieneLongitudPar

La Función filtraTieneLongitudPar recibe una lista de Strings y regresa una lista que contiene solo a los string con una longitud par.
  - Ejemplo de uso:

```Haskell
*Practica5> filtraTieneLongitudPar ["a", "se", "non","casa"]
["se","casa"]
```

📌 concatenaConEspacios

La Función concatenaConEspacios recibe una lista de strings y regresa un string que es la concatenacion de todos los string con un espacio entre cada palabra.
  - Ejemplo de uso:

```Haskell
*Practica5> concatenaConEspacios ["hola","mundo","a","todos"]
"hola mundo a todos "
```

📌 foldlT

La Función foldlT recibe una funcion f(b-> a -> b), un valorInicial a, un Arbol a y regresa un
valor b que es el resultado de irle aplicando la funcion f a todo el arbol.
  - Ejemplos de uso:

```Haskell
*Practica5> foldlT (+) 10 (AB 1 (H 2) (H 3))
16

*Practica5> foldlT (++) "x" (AB "1" (AB "2" (H "6") Vacio ) (AB "3" (H "4") (H"5")) )
"x126345"

*Practica5> foldlT (-) 0 (AB 1 (AB 2 (H 3) ( H 4) ) (H 5))
-15
```

📌 propAArbolString

La Función propAArbolString recibe una proposicion y arma su arbol de sintaxis.
  - Ejemplos de uso:

```Haskell
*Practica5> propAArbolString (Disy (Var "x") (Var "y"))
("{Disy x y}" (H: "x")  (H: "V")  (H: "y"))

*Practica5> propAArbolString (Syss (Var "x") (Var "y"))
("?Syss x y?" (H: "x")  (H: "<->")  (H: "y"))
```

📌 vars

La Función vars recibe una proposicion y regresa una lista que contiene todas las variables que aparecen en la proposicion sin repetidos.
  - Ejemplos de uso:

```Haskell
*Practica5> vars (Disy (Neg (Var "x")) (Var "y"))
["x","y"]

*Practica5> vars (Disy (Neg (Var "x")) (Conj (Neg (Var "x")) (T)))
["x"]

*Practica5> vars (Disy (Neg (Var "x")) (Conj (Neg (Var "x")) (Syss (Var "y") (Var"z"))))
["x","y","z"]
```

📌 fnn

La Función fnn recibe una proposicion y regresa la misma proposicion en su Forma Normal Negativa.
  - Ejemplos de uso:

```Haskell
*Practica5> fnn (Neg (Disy (Var "x") T) )
[Conj !Neg x!  F]

*Practica5> fnn (Syss (Conj (Var "x") T) (Disy F (Var "y")) )
[Conj {Disy {Disy !Neg x!  F}  {Disy F  y}}  {Disy [Conj T  !Neg y!]  [Conj x  T]}]
```



