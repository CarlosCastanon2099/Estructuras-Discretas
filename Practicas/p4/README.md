<div align="center">
  
# **Practica 4** 🪩🕺
  

[![](https://media.giphy.com/media/lkbNG2zqzHZUA/giphy.gif)](https://www.youtube.com/watch?v=PEnJbjBuxnw)

</div>
  
---

## **Uso**



Compilar mediante:

```Ruby
ghci Practica4.hs
```

Una vez compilado, tendremos acceso a las siguientes funciones:

📌 listaAArbol

La Función listaAArbol recibe una lista xs, la funcion regresa un árbol binario que contenga todos los elementos de xs.
  - Ejemplo de uso:

```Haskell
*Practica4> listaAArbol [1,2,3,4,5]
AB 1 (AB 3 (H 5) (H 4)) (H 2)
```

📌 minimo

La Función minimo recibe un árbol y regresa el elemento más pequeño del árbol.
  - Ejemplos de uso:

```Haskell
*Practica4> minimo (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11)))
4

*Practica4> minimo (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (H 4))))
-1
```

📌 arbolALista

La Función arbolALista extrae de un arbol binario sus elementos y los guarda en una lista.
  - Ejemplo de uso:

```Haskell
*Practica4> arbolALista (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11)))
[4,5,6,8,9,10,11]
```

📌 maximo

La Función maximo recibe un árbol y regresa el elemento más grande del árbol.
  - Ejemplos de uso:

```Haskell
*Practica4> maximo (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11)))
11

*Practica4> maximo (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5)))))
5
```

📌 inorder

La Función inorder recibe un árbol para despues recorrer todos sus elementos, iniciando
por su subárbol izquierdo, despues la raíz y al final su subárbol derecho, para entonces
devolver una lista que contenga los elementos visitados en ese orden.
  - Ejemplos de uso:

```Haskell
*Practica4> inorder (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11)))
[4,5,6,8,9,10,11]

*Practica4> inorder (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5)))))
[-1,1,2,3,4,5]
```

📌 postorder

La Función postorder recibe un árbol para despues recorrer todos sus elementos, iniciando
por su subárbol izquierdo, despues su subárbol derecho y finalmente su raíz, para entonces
devolver una lista que contenga los elementos visitados en ese orden.
  - Ejemplos de uso:

```Haskell
*Practica4> postorder (AB 1 (H (-1)) (AB 2 Vacio (AB 3 Vacio (AB 4 Vacio (H 5)))))
[-1,5,4,3,2,1]

*Practica4> postorder (AB 8 (AB 5 (H 4) (H 6)) (AB 10 (H 9) (H 11)))
[4,6,5,9,11,10,8]
```

📌 contarPor

La Función contarPor recibe como argumentos a un booleano y un árbol, está regresa el número de nodos del árbol que cumplen con la condición del booleano.
  - Ejemplos de uso:

```Haskell
*Practica4> contarPor (> 3) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9)))
5

*Practica4> contarPor (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9)))
4
```

📌 listaPor

La Función listaPor tiene los mismos parametros de entrada que contarPor, solo que
ahora regresa una lista con los elementos del árbol que cumplen con la condición del booleano.
  - Ejemplos de uso:

```Haskell
*Practica4> listaPor (> 3) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9)))
[4,6,7,8,9]

*Practica4> listaPor (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 8 (H 7) (H 9)))
[2,4,6,8]
```

📌 mapT

La Función mapT recibe una función, un árbol y regresa otro árbol
cuyos elementos son el resultado de aplicar la función a cada uno de los elementos
del árbol recibido como parametro.
  - Ejemplos de uso:

```Haskell
*Practica4> mapT (+1) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10)))
AB 7 (AB 4 (H 3) (H 5)) (AB 10 (H 9) (H 11))

*Practica4> mapT show (AB 10 (AB 7 (H 6) (H 8)) (AB 13 (H 12) (H 14)))
AB "10" (AB "7" (H "6") (H "8")) (AB "13" (H "12") (H "14"))

*Practica4> mapT (*7) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10)))
AB 42 (AB 21 (H 14) (H 28)) (AB 63 (H 56) (H 70))
```

📌 filterT

La Función filterT recibe un un booleano, un arbol y regresa otro árbol cuyos elementos son aquellos del árbol recibido como
parametro que cumplen que al aplicar el booleano sobre ellos, estos devuelven True.
  - Ejemplos de uso:

```Haskell
*Practica4> filterT (>9) (AB 10 (AB 7 (H 6) (H 8)) (AB 13 (H 12) (H 14)))
AB 10 (AB 13 Vacio (H 14)) (H 12)

*Practica4> filterT (\x -> (mod x 2) == 0) (AB 6 (AB 3 (H 2) (H 4)) (AB 9 (H 8) (H 10)))
AB 2 (AB 6 (H 10) (H 8)) (H 4)
```
