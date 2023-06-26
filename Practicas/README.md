<div align="center">

# Prácticas 📜🗝️

##   Curso de Estructuras Discretas 2023-2
 
###  <em> Prácticas realizadas durante el curso: </em>
</div>

> -  Práctica 01: <em> Recursión sobre los naturales. </em>
> -  Práctica 02: <em> Trabajando con enteros, vectores y matrices. </em>
> -  Práctica 03: <em> Listas. </em>
> -  Práctica 04: <em> Árboles. </em>
> -  Práctica 05: <em> Folds y lambdas. </em>
> -  Práctica 06: <em> Álgebra de Boole y circuitos lógicos. </em>




Las prácticas en su mayoría fueron enfocadas a programacion de codigo, sin embargo tambien se abordo el diseño de circuitos digitales, para los circuitos el software empleado fue [Logisim](http://www.cburch.com/logisim/), para la programacion de codigo en Haskell se empleo el software [Haskell](https://www.haskell.org/), ambos software son de uso libre y se pueden descargar desde sus respectivas paginas oficiales, para poder ejecutar Logisim basta con tener la paqueteria de [JAVA](https://www.oracle.com/java/technologies/downloads/) instalada, ademas de que en caso de que al darle doble click a los circuitos, estos no se ejecuten, bastará con ejecutar el siguiente comando:

LOGISIM:
```
java -jar logisim-generic-2.7.1.jar
```

En el caso de Haskell, la estructura de compilación y ejecución de un programa es:

Haskell :
```
ghci NombreDelArchivo.hs
```

Habiendo ejecutado el anterior dentro de la carpeta que alberga el archivo, tendremos una pantalla como la siguiente:

```
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling NombreDelArchivo ( NombreDelArchivo.hs, interpreted )
Ok, one module loaded.
*NombreDelArchivo>
```

Con esto ya podremos hacer uso de las funciones que esten presentes en el archivo.


# Tests.

En las practicas presentes se utilizaron pruebas unitarias que verificaban el correcto funcionamiento del codigo, para poder tener acceso a las pruebas unitarias
es necesario instalar la biblioteca de QuickCheck en caso de no tenerla (Haskell no tiene esta biblioteca por defecto).


## Instalando QuickCheck
Primero debemos revisar si tenemos cabal instalado (el cual debería ya estar instalado), esto lo hacemos con el comando:

```
> cabal --version
cabal-install version 2.4.0.0
compiled using version 2.4.0.1 of the Cabal library 
```

Una vez que hemos verificado que tenemos cabal instalado, procedemos a instalar QuickCheck con el siguiente comando:

```
> cabal install QuickCheck
```

Esto debería desplegar la siguiente pantalla:

    cabal install QuickCheck
    Warning: The install command is a part of the legacy v1 style of cabal usage.

    Please switch to using either the new project style and the new-install
    command or the legacy v1-install alias as new-style projects will become the
    default in the next version of cabal-install. Please file a bug if you cannot
    replicate a working v1- use case with the new-style commands.

    For more information, see: https://wiki.haskell.org/Cabal/NewBuild

    Warning: /home/jason/.cabal/config: Unrecognized stanza on line 140
    /home/jason/.cabal/config: Unrecognized field installdir on line 117
    Warning: The package list for 'hackage.haskell.org' is 89 days old.
    Run 'cabal update' to get the latest list of available packages.
    Resolving dependencies...
    Downloading  splitmix-0.1.0.4
    Downloaded   splitmix-0.1.0.4
    Starting     splitmix-0.1.0.4
    Building     splitmix-0.1.0.4
    Completed    splitmix-0.1.0.4
    Downloading  QuickCheck-2.14.2
    Downloaded   QuickCheck-2.14.2
    Starting     QuickCheck-2.14.2
    Building     QuickCheck-2.14.2
    Completed    QuickCheck-2.14.2
