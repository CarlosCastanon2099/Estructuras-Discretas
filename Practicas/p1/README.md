<div align="center">
  
# **Practica 1** 🎇🌉
  

[![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDRiZTA3MmU5NjBiYjc4YzQyZjFlZjU1NTJlZTVjM2I1NzkxZjYxNyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/GeimqsH0TLDt4tScGw/giphy-downsized.gif)](https://www.youtube.com/watch?v=crjugtkXZN4)

</div>
  
---

## **Uso**



Compilar mediante:

```
ghci Practica1.hs
```

Una vez compilado, tendremos acceso a las siguientes funciones:

📌 numerosNaturales

La Función numerosNaturales despliega los primeros 100 numeros naturales

```
*Main> numerosNaturales
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]
```

📌 multiplosDeDiez

La Función multiplosDeDiez despliega los primeros 100 multiplos de diez

```
*Main> multiplosDeDiez
[10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,1000]
```

📌 listaPrimos

La Función listaPrimos despliega todos los numeros que sean primos hasta un numero n
  - Ejemplo de uso:
```
*Main> listaPrimos 100
[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
```

---
<div align="center">
  
Recordando el concepto matematico sobre quienes eran los sucesores del 0, recordemos que:

 
0 = 0
  
Suc Cero = 1
  
Suc (Suc Cero) = 2
  
Suc (Suc (Suc Cero)) = 3
  
Suc (Suc (Suc (Suc Cero))) = 4

Suc (Suc (Suc (Suc (Suc Cero)))) = 5
  
Suc (Suc (Suc (Suc (Suc (Suc Cero))))) = 6
  
Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))) = 7
  
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero))))))) = 8
  
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))) = 9
  
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero))))))))) = 10
  
Suc (Suc (Suc (Suc ... (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))))) = n
  
</div>

📌 natToInt

La funcion natToInt recibe un numero natural n en su forma de sucesor de 0 y devuelve el mismo numero como un entero (Int).
  - Ejemplos de uso:
```
*Main> natToInt ( Suc ( Suc ( Suc ( Suc Cero ))))
4

*Main> natToInt (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))))) )
11
```


📌 intToNat

La funcion natToInt recibe un entero (Int) y devuelve el mismo numero como un numero natural n en su forma de sucesor de 0.
  - Ejemplos de uso:
```
*Main> intToNat 8
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))

*Main> intToNat 31
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero))))))))))))))))))))))))))))))
```


📌 combinaciones

La funcion combinaciones recibe dos numero naturales en su forma de sucesor de 0 y devuelve el numero de combinaciones de n elementos tomados de k en k.

En otras palabras, vamos a aplicarles a esos dos numeros esta formula (combinaciones n k) = n! / (k!(n-k)!  y el resultado será otro numero natural.
  - Ejemplo de uso:
```
*Main> combinaciones ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc Cero ))
Suc (Suc (Suc Cero))
```

📌 mcd

La funcion mcd recibe dos numeros naturales y devuelve como resultado su maximo comun divisor.
  - Ejemplo de uso:
```
*Main> mcd ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc ( Suc Cero )))
Suc (Suc (Suc Cero))
```

📌 mcm

La funcion mcm recibe dos numeros naturales y devuelve como resultado su minimo comun multiplo.
  - Ejemplo de uso:
```
*Main> mcm ( Suc ( Suc ( Suc Cero ))) ( Suc ( Suc Cero ))
Suc (Suc (Suc (Suc (Suc (Suc Cero)))))
```

📌 fibonacci

La funcion fibonacci recibe un numero natural n y devuelve el n-esimo elemento de la serie de Fibonacci.
  - Ejemplo de uso:
```
*Main> fibonacci (Suc ( Suc ( Suc ( Suc ( Suc ( Suc Cero ))))))
Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))
```
---

📌 factorial

La funcion factorial calcula el factorial de un numero entero positivo en formato int.
  - Ejemplos de uso:
```
*Main> factorial 4
24

*Main> factorial 10
3628800
```

📌 comb

La funcion comb calcula el coeficiente binomial (combinatoria) de dos numeros enteros positivos en formato int usando:

comb n k = n! / (k!(n-k)!.
  - Ejemplos de uso:
```
*Main> comb 10 3
120

*Main> comb 20 9
167960
```

📌 mcd'

La funcion mcd' recibe dos numeros enteros positivos y devuelve como resultado su maximo comun divisor.
  - Ejemplo de uso:
```
*Main> mcd' 40 60
20
```

📌 mcm'

La funcion mcm' recibe dos numeros enteros positivos y devuelve como resultado su minimo comun multiplo.
  - Ejemplo de uso:
```
*Main> mcm' 6 8
24
```


📌 fibonacci'

La funcion fibonacci' calcula el enesimo numero n dentro de la sucesion de fibonacci en formato int
  - Ejemplo de uso:
```
*Main> fibonacci' 11
89

*Main> fibonacci' 24
46368
```

