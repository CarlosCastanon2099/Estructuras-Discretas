<div align="center">
  
# **Practica 2** 🎯🏹
  

[![](https://media.giphy.com/media/3oEjHP8ELRNNlnlLGM/giphy.gif)](https://www.youtube.com/watch?v=p_vo3NghjYc)

</div>
  
---

## **Uso**



Compilar mediante:

```
ghci Practica2Completa.hs
```

Una vez compilado, tendremos acceso a las siguientes funciones:

📌 productoPunto3D

La Función productoPunto3D recibe dos tripletas que representan vectores de numeros enteros y nos devuelve su producto punto 3D.

Recordemos que dado un vector A = (x1, y1, z1)  y un vector  B = (x2, y2, z2)

Su producto punto esta dado por la formula: A * B = (x1 * x2) + (y1 * y2) + (z1 * z2)
  - Ejemplos de uso:
```
*Practica2Completa> productoPunto3D (1,2,3) (4,5,6)
32

*Practica2Completa> productoPunto3D (1,4,6) (91,12,3)
157

*Practica2Completa> productoPunto3D (4,4,2) (9,6,7)
74
```

📌 productoPunto

La Función productoPunto recibe dos listas de enteros de longitud n  y  m  respectivamente, las cuales representan vectores de numeros enteros y nos devuelve su producto punto. 
  - Ejemplo de uso:
```
*Practica2Completa> productoPunto [4,4,2,12,2] [9,6,7,1,4]
94
```

📌 juntaListaElementos

La Función juntaListaElementos recibe dos listas de elementos y regresa una lista de duplas con las parejas obtenidas de emparejar cada elemento de cada lista con su pareja de la otra lista.
  - Ejemplo de uso:
```
*Practica2Completa> juntaListaElementos [1,2,3] [4,5,6]
[(1,4),(2,5),(3,6)]
```

📌 productoCruz

La funcion productoCruz toma 2 tripletas de enteros que representan dos vectores y nos devuelve su producto cruz.

Recordemos que el producto cruz es:
<p align="center"><img width="900" src="/GIFS/Matriz0.png" alt="Producto Cruz"></p>

Y se calcula con:
<p align="center"><img width="1000" src="/GIFS/Matriz1.png" alt="Calculo de Producto Cruz"></p>

  - Ejemplos de uso:
```
*Practica2Completa> productoCruz (1,4,6) (9,5,3)
(-18,51,-31)

*Practica2Completa> productoCruz (6,4,3) (2,5,7)
(13,-36,22)
```


📌 restaVectores

La funcion restaVectores recibe 2 tripletas de enteros que serán n y m, la presente regresa n - m
  - Ejemplos de uso:
```
*Practica2Completa> restaVectores (0,0,0) (2,5,7)
(-2,-5,-7)

*Practica2Completa> restaVectores (2,5,7) (0,0,0)
(2,5,7)

*Practica2Completa> restaVectores (6,4,3) (2,5,7)
(4,-1,-4)
```


📌 normalATriangulo

La funcion normalATriangulo recibe 3 tripletas de enteros que representan los puntos de un triangulo y regresa un vector ortogonal a la superficie del triangulo.

En donde si los puntos estan dados por P1, P2, P3 y a cada punto le corresponde una cordenada (x,y,z)

Y considerando a dos vectores V y W tales que V = P2 - P1 y W = P3 - P1 ademas de que el vector N es la superficie normal

Tendremos que el vector ortogonal sera (Nx,Ny,Nz) 

En donde Nx = (Vy * Wz) - (Vz * Wy) , Ny = (Vz * Wx) - (Vx * Wz) , Nz = (Vx * Wy) - (Vy * Wx)
  - Ejemplos de uso:
```
*Practica2Completa> normalATriangulo  (1,4,6) (4,2,5) (7,2,8)
(-6,-12,6)

*Practica2Completa> normalATriangulo  (3,7,2) (1,3,2) (2,5,4)
(-8,4,0)
```

📌 divisoresPropios

La funcion divisoresPropios recibe un entero y regresa una lista con sus divisores propios.

Un divisor propio de un número es cualquier divisor que no es el mismo número que el que divide.
  - Ejemplos de uso:
```
*Practica2Completa> divisoresPropios 99
[1,3,9,11,33]

*Practica2Completa> divisoresPropios 42
[1,2,3,6,7,14,21]

*Practica2Completa> divisoresPropios 21
[1,3,7]
```

📌 sumaPares

La funcion sumaPares suma los primeros n numeros pares.

Entiendase por n numeros pares, los primeros n numeros pares, en otras palabras si por ejemplo le pasamos un 10 esto nos
regresa los primeros 10 numeros pares y despues los suma, en otras palabras:

2 + 4 + 6 + 8 + 10 + 12 + 14 + 16 + 18 + 20 = 110
  - Ejemplos de uso:
```
*Practica2Completa> sumaPares 10
110

*Practica2Completa> sumaPares 32
1056
```

📌 primo

La funcion primo devuelve el n-esimo numero primo.
  - Ejemplos de uso:
```
*Practica2Completa> primo 8
19

*Practica2Completa> primo 17
59
```

📌 sumaDigitos

La funcion sumaDigitos calcula la suma de los digitos de un numero
  - Ejemplos de uso:
```
*Practica2Completa> sumaDigitos 17
8

*Practica2Completa> sumaDigitos 321579
27

*Practica2Completa> sumaDigitos 12345
15
```

📌 imprimeUnEntero

La funcion imprimeUnEntero recibe un entero (puede ser positivo o negativo) y regresa su representacion en String, esto sin hacer uso de la funcion show.

  - Ejemplos de uso:
```
*Practica2Completa> imprimeUnEntero 2099
"2099"

*Practica2Completa> imprimeUnEntero (-1234)
"-1234"

*Practica2Completa> imprimeUnEntero 98412
"98412"
```


