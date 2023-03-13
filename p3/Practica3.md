
# Practica 3

## Listas 
____


### eliminaRepetidos 
Escribe la funcion **eliminaRepetidos** que recibe una lista **l** y regresa otra con los elementos de 
**l** sin que haya elementos repetidos

    eliminaRepetidos [1,2,1,3,1,2,5,6,4,2]
    [1,2,3,5,6,4]

    eliminaRepetidos "parangaracutirimicuaro"
    parngcutimo


### unionListas.

Escribe la funcion **unionListas** que toma dos listas y regresa la union de ambas listas (sin repetidos).

    unionListas [1,2,3,4,9] [2,2,2,4,1,3,5,7,4]
    [1,2,3,4,9,5,7]
    
    unionListas "amorosa" "guajira"
    amorsguji

### interseccionListas
Escribe la funcion **interseccionListas** que toma dos listas y regresa su interseccion (sin repetidos)

    interseccionListas [1,2,3,5] [5,6,7,8,1,2]
    [1,2,5]

    interseccionListas "aeiou" ['a'..'z']
    "aeiou"

### mapea
Escriba la funcion **mapea** que recibe una funcion **f** (a -> b) y una lista **l** de tipo a y regresa una lista de tipo b
que es el resultado de aplicarle **f** a cada uno de los elementos de  **l**

    mapea (*10) [1..10]
    [10,20,30,40,50,60,70,80,90,100]


### zipeaWith
Escriba la funcion **zipeaWith** que recibe una funcion **f** (a -> b -> c), una lista **l1** de tipo a y una lista **l2** de tipo b y 
regresa una lista de tipo c que es el resultado de aplicarle **f** a cada uno de los elementos de  **l1** y **l2**


    zipeaWith (*) [1..10] [1..10]
    [1,4,9,16,25,36,49,64,81,100]

    zipeaWith (++) ["Hola", "Adios"] [" Audrey", " Andrea"]
    ["Hola Audrey","Adios Andrea"]

    zipeaWith (-) [0,1,2] [100,50,23]
    [-100,-49,-21]
    
### filtra
Escriba la funcion **filtra** que recibe una funcion **f** (a -> Bool) y una lista **l** de tipo a y regresa 
una lista de los elementos de **l** que cumplan f.

    filtra (> 10 ) [1..20]
    [11,12,13,14,15,16,17,18,19,20]


### minimoLista
Escriba la funcion **minimoLista** que recibe una lista *l*  de tipo Int y regresa el elemento mas chico de esa lista.

    minimioLista [10,12,4,2,7,99]
    2

### aprobados
Escribe la funcion **aprobados** que recibe una lista de tuplas (String, Int) las cuales representan los nombres y calificaciones de un grupo de alumnos. En esta practica, esta lista la devuelve la funcion: **listaAlumnos**.

Regresa una tupla cuya primer entrada es una lista de tripletas que contienen:
    
- Los nombres de los alumnos que obtuvieron una calificacion mayor a 6, y un mensaje de felicidades.
- Su calificacion.
- Un mensaje de felicitacion.

La segunda tiene la misma estructura, solo que contiene a los alumnos con una calificacion menor o igual a 6 y un mensaje de que se esfuercen mas.

Debes usar las funciones **mapea** y **filtra**.

Hints:
- Crea funciones auxiliares para que sean parte de los parametros con que mandas a llamar tanto a mapea como a filtra (o usa lambdas si te sientes confiado)

- La funcion fst y snd lo unico que hace es devolver el primer y el segundo elemento de una tupla respectivamente.

        fst (1,2)
        1

        snd (12,53)
        53

- Para usar la misma funcion para separar entre aprobados y reprobados puedes usar el operador . (compone funciones) y el not, pero no es obligatorio.
Puedes simplemente definir dos funciones distintas.
Para componer funciones, por ejemplo: 

        ( (+1) . (*6) ) 1
        7
        Lo que hace es primero aplicarle el *6 al 1 y despues sumarle 1, por eso el resultado es 7.

        mapea ( (+1) . length ) ["Siempre", "que te", "pregunto", "que como", "cuando y donde"]
        [8,7,9,9,15]

        Porque lo que hace primero es aplicarle a cada elemento la funcion length y despues sumarle 1.

El mensaje de felicidades es: "Felicidades!"
El mensaje de esforzarse es: "Necesitas esforzarte +"

    calificaciones listaAlumnos 
    ([("Martin",7,"Felicidades!"),("Ritchie",7,"Felicidades!"),("Wayne",9,"Felicidades!"),("Ameline",9,"Felicidades!"),("Estrella",7,"Felicidades!"),("Perla",9,"Felicidades!"),("Anselma",10,"Felicidades!"),("June",10,"Felicidades!")],[("Benedict",6,"Necesitas esforzarte +"),("Paola",6,"Necesitas esforzarte +"),("Karolina",2,"Necesitas esforzarte +"),("Lissy",3,"Necesitas esforzarte +"),("Clari",4,"Necesitas esforzarte +"),("Anna",1,"Necesitas esforzarte +"),("Harriott",2,"Necesitas esforzarte +"),("Bryant",6,"Necesitas esforzarte +"),("Noah",5,"Necesitas esforzarte +"),("Jerri",3,"Necesitas esforzarte +"),("Shandra",3,"Necesitas esforzarte +"),("Costanza",3,"Necesitas esforzarte +"),("Ashlin",6,"Necesitas esforzarte +"),("Susannah",6,"Necesitas esforzarte +"),("Renie",4,"Necesitas esforzarte +"),("Whittaker",1,"Necesitas esforzarte +"),("Madelle",1,"Necesitas esforzarte +"),("Marv",4,"Necesitas esforzarte +"),("Gwenore",3,"Necesitas esforzarte +"),("Crysta",3,"Necesitas esforzarte +"),("Merola",2,"Necesitas esforzarte +"),("Trent",6,"Necesitas esforzarte +")])

    fst $ calificaciones listaAlumnos
    [("Martin",7,"Felicidades!"),("Ritchie",7,"Felicidades!"),("Wayne",9,"Felicidades!"),("Ameline",9,"Felicidades!"),("Estrella",7,"Felicidades!"),("Perla",9,"Felicidades!"),("Anselma",10,"Felicidades!"),("June",10,"Felicidades!")]

    snd $ calificaciones listaAlumnos 
    [("Benedict",6,"Necesitas esforzarte +"),("Paola",6,"Necesitas esforzarte +"),("Karolina",2,"Necesitas esforzarte +"),("Lissy",3,"Necesitas esforzarte +"),("Clari",4,"Necesitas esforzarte +"),("Anna",1,"Necesitas esforzarte +"),("Harriott",2,"Necesitas esforzarte +"),("Bryant",6,"Necesitas esforzarte +"),("Noah",5,"Necesitas esforzarte +"),("Jerri",3,"Necesitas esforzarte +"),("Shandra",3,"Necesitas esforzarte +"),("Costanza",3,"Necesitas esforzarte +"),("Ashlin",6,"Necesitas esforzarte +"),("Susannah",6,"Necesitas esforzarte +"),("Renie",4,"Necesitas esforzarte +"),("Whittaker",1,"Necesitas esforzarte +"),("Madelle",1,"Necesitas esforzarte +"),("Marv",4,"Necesitas esforzarte +"),("Gwenore",3,"Necesitas esforzarte +"),("Crysta",3,"Necesitas esforzarte +"),("Merola",2,"Necesitas esforzarte +"),("Trent",6,"Necesitas esforzarte +")]


Para verificar sus funciones usen el archivo Practica2Test.hs
Una vez cargado dentro de ghci, deberan de ejecutar:
    
    quickCheck <NombreDelTestAComprobar>
    Por ejemplo:
    Si quieren propar su funcion contiene escriben: 
    quickCheck prop_contieneTest 
