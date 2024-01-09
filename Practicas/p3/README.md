<div align="center">
  
# **Practica 3** 🪄🏟️
  

[![](https://media.giphy.com/media/7oZ21DQBDoZ2/giphy.gif)](https://www.youtube.com/watch?v=_ao2u7F_Qzg)

</div>
  
---

## **Uso**



Compilar mediante:

```Ruby
ghci Practica3.hs
```

Una vez compilado, tendremos acceso a las siguientes funciones:

📌 eliminaRepetidos

La Función eliminaRepetidos toma una lista y regresa otra lista pero sin elementos repetidos
  - Ejemplos de uso:

```Haskell
*Practica3> eliminaRepetidos [1,2,1,3,1,2,5,6,4,2]
[1,2,3,5,6,4]

*Practica3> eliminaRepetidos "parangaracutirimicuaro"
"parngcutimo"
```

📌 unionListas

La Función unionListas toma dos listas y regresa la union de ambas listas (sin repetidos).
  - Ejemplos de uso:

```Haskell
*Practica3> unionListas [1,2,3,4,9] [2,2,2,4,1,3,5,7,4]
[1,2,3,4,9,5,7]

*Practica3> unionListas "amorosa" "guajira"
"amorsguji"
```

📌 interseccionListas

La Función interseccionListas toma dos listas y regresa su interseccion (sin repetidos).
  - Ejemplos de uso:

```Haskell
*Practica3> interseccionListas [1,2,3,5] [5,6,7,8,1,2]
[1,2,5]

*Practica3> interseccionListas "aeiou" ['a'..'z']
"aeiou"
```

📌 mapea

La Función mapea recibe una funcion f (a -> b) y una lista l de tipo a y regresa una lista de tipo b 
que es el resultado de aplicarle f a cada uno de los elementos de l
  - Ejemplos de uso:

```Haskell
*Practica3> mapea (*10) [1..10]
[10,20,30,40,50,60,70,80,90,100]

*Practica3> mapea (+5) [1..50]
[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55]
```

📌 zipeaWith

La Función zipeaWith recibe una funcion f (a -> b -> c), una lista l1 de tipo a y una lista l2 de tipo b 
regresa una lista de tipo c que es el resultado de aplicarle f a cada uno de los elementos de l1 y l2
  - Ejemplos de uso:

```Haskell
*Practica3> zipeaWith (++) ["Hola", "Dona"] [" Maximo", " Azucar"]
["Hola Maximo","Dona Azucar"]

*Practica3> zipeaWith (*) [1..10] [1..10]
[1,4,9,16,25,36,49,64,81,100]

*Practica3> zipeaWith (+) [11,23,70] [5,9,29]
[16,32,99]

*Practica3> zipeaWith (-) [0,1,2] [100,50,23]
[-100,-49,-21]
```

📌 filtra

La Función filtra recibe una funcion f (a -> Bool) y una lista l de tipo a, regresa una lista de los elementos de l que cumplan f.
  - Ejemplos de uso:

```Haskell
*Practica3> filtra (< 10 ) [1..30]
[1,2,3,4,5,6,7,8,9]

*Practica3> filtra (> 10 ) [1..20]
[11,12,13,14,15,16,17,18,19,20]

*Practica3> filtra (== 'a') "parangaracutirimicuaro"
"aaaaa"

*Practica3> filtra (== 10) [1..100]
[10]
```

📌 minimoLista

La Función minimoLista recibe una lista l de tipo Int y regresa el elemento mas chico de esa lista.
  - Ejemplos de uso:

```Haskell
*Practica3> minimoLista [10,12,4,2,7,99]
2

*Practica3> minimoLista [1234,10,20,17,12,4,7,999,5]
4
```

📌 calificaciones

La Función calificaciones usa a la funcion listaAlumnos la cual contiene una lista de alumnos con sus nombres y calificaciones, para que entonces al mandar a llamar a la funcion calificaciones 
Esta regrese una tupla cuya primer entrada es una lista de tripletas que contienen:

-Los nombres de los alumnos que obtuvieron una calificacion mayor a 6, y un mensaje de felicidades.

-Su calificacion.

-Un mensaje de felicitacion.

La segunda tiene la misma estructura, solo que contiene a los alumnos con una calificacion menor o igual a 6 y un mensaje de que se esfuercen mas.
  - Ejemplo de uso:

```Python
*Practica3> calificaciones listaAlumnos
([("Martin",7,"Felicidades!"),("Ritchie",7,"Felicidades!"),("Wayne",9,"Felicidades!"),("Ameline",9,"Felicidades!"),("Estrella",7,"Felicidades!"),("Perla",9,"Felicidades!"),("Anselma",10,"Felicidades!"),("June",10,"Felicidades!")],[("Benedict",6,"Necesitas esforzarte +"),("Paola",6,"Necesitas esforzarte +"),("Karolina",2,"Necesitas esforzarte +"),("Lissy",3,"Necesitas esforzarte +"),("Clari",4,"Necesitas esforzarte +"),("Anna",1,"Necesitas esforzarte +"),("Harriott",2,"Necesitas esforzarte +"),("Bryant",6,"Necesitas esforzarte +"),("Noah",5,"Necesitas esforzarte +"),("Jerri",3,"Necesitas esforzarte +"),("Shandra",3,"Necesitas esforzarte +"),("Costanza",3,"Necesitas esforzarte +"),("Ashlin",6,"Necesitas esforzarte +"),("Susannah",6,"Necesitas esforzarte +"),("Renie",4,"Necesitas esforzarte +"),("Whittaker",1,"Necesitas esforzarte +"),("Madelle",1,"Necesitas esforzarte +"),("Marv",4,"Necesitas esforzarte +"),("Gwenore",3,"Necesitas esforzarte +"),("Crysta",3,"Necesitas esforzarte +"),("Merola",2,"Necesitas esforzarte +"),("Trent",6,"Necesitas esforzarte +")])
```

📌 listaAlumnos

La Función listaAlumnos contiene a la lista de alumnos y sus calificaciones

```Haskell
listaAlumnos :: [(String, Int)]
listaAlumnos = [("Benedict",6),("Martin",7),("Paola",6),("Karolina",2),("Lissy",3),
                ("Clari",4),("Ritchie",7),("Anna",1),("Harriott",2),("Wayne",9),
                ("Bryant",6),("Noah",5),("Jerri",3),("Shandra",3),("Ameline",9),
                ("Costanza",3),("Ashlin",6),("Estrella",7),("Perla",9),("Susannah",6),
                ("Anselma",10),("Renie",4),("Whittaker",1),("Madelle",1),("June",10),
                ("Marv",4),("Gwenore",3),("Crysta",3),("Merola",2),("Trent",6)]
```
