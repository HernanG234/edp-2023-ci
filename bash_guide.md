Super Mega Guía de Bash
===
### Subsecciones!

Las subsecciones que se detallan abajo corresponden a las diapositivas de la Unidad 5 - BASH de la materia Entorno de Programación de la Tecnicatura Universitaria en Inteligencia Artificial de la UNR.

1. **Diapos 1 a la 29**: Primer script, ejecucion, metacaracteres, `Ctrl+C`, `Ctrl+Z`, `Ctrl+D`, `Ctrl+R`, Quotation ('',"",\,\`\`), redirecciones, variables, variables de entorno, `PATH`.
2. **Diapos 29 a 50**: Construcciones condicionales: `test`, `[ ]`, `true`/`false`, operadores aritmeticos `$(())`, `bc`, operadores lógicos (`&&`,`||`,`!`), i`f/elif/else/fi`, chequeos de archivos (`-e`,`-f`,`-r`|`w`|`x`,etc), parámetros posicionales (`$#`,`$@`,`$*`, `shift`)
3. **Diapos 51 a 58**: case, expresiones regulares y globbing, `if [[ $var1 =~ $regex ]]`.
4. **Diapos 59 a 73**: `for`, `while`, `until`, `select`
5. **Diapos 74 a 85**: Funciones!
6. **Diapos 86 a 100**: filtros (`cat`, `wc`, `tr`, `uniq`, `sort`...), `grep`, `awk`, `sed`.

## Ejercicios
### Sección 1.
0. Imprimir "Hola mundo" a stdout.

1. Hacer un script de bash que imprima "Hola Mundo!".

2. Darle permisos de ejecución del script anterior al usuario.

3. Ejecutar el script. Existen dos formas, probar ambas. 

4. Investigar las variables de entorno que ya están definidas. (Ver `printenv`!)

5. Imprimir "Hola `<nombre de usuario>`" a stdout (por consola). Del ejercicio 4, buscar la variable de entorno que tiene esta información.

6. Idem anterior pero que escriba la salida a un archivo `archivo.6`.

7. Ejecutar el comando "yes" y deternerlo con Ctrl+C.

8. Ejecutar el comando "yes" y deternerlo con Ctrl+Z. Reanudarlo en primer plano con "fg", deternerlo con Ctrl+C.

9. Hacer un script que luego de ejecutarse en un directorio genere el siguiente arbol:
```
~$ tree
.
└── dir.a
    ├── dir.b
    │   ├── file.a
    │   └── file.b
    └── dir.c
        └── link.a -> ../dir.b/file.a

4 directories, 3 files
```

10. Hacer un script `ej.9.sh` que imprima "Hola mundo $var" a `stdout`. La variable `var` se define al comienzo del script.

11. Crear `ej.10.sh` y ejecutar este script:
```bash
#!/bin/bash

NOMBRE1=Ariel
NOMBRE2=Ari*
NOMBRE3="Ari *"

echo "Hola *"
echo 'Hola *'
echo 'Hola \*'
echo "Hola \*"
echo "Hola $NOMBRE1"
echo "Hola $NOMBRE2"
echo "Hola \$NOMBRE1"
echo 'Hola $NOMBRE2'
echo "Hola `echo $NOMBRE1`"
echo "Hola `echo $NOMBRE2`"
echo "Hola `echo $NOMBRE3`"
```
Predecir que ocurrirá en cada caso antes de ejecutarlo. Chequear e interpretar que ocurrió.

12. Hacer un script `ej.11.sh` que imprima "Hola mundo $var" a `stdout`. La variable `var` se ingresa como primer argumento.

13. Item anterior pero imprimiendo la salida a un `archivo.13`.

14. Imprimir el contenido de la variable PATH a un archivo `PATH.bkp`

15. Copiar el script del ejercicio 5 ("Hola `<nombre de usuario>`") en `bin/hola` (`bin` es un directorio, crearlo, `hola` es el nombre del archivo). Agregar esta ruta al `PATH`.

16. Crear el siguiente script como `ej.16.sh`:
```bash
#!/bin/bash
touch a
ls a
ls b
```
Ejecutarlo, observar comportamiento. Redirigir la salida `1` a `ej.16.out` y la salida dos a `ej.16.err`.

17. Ejecutar el script anterior pero esta vez descartar ambas salidas. (Chequear diapositiva 18)

### Sección 2.

0. Hacer un script que reciba un número y determine si es par o impar.

1. Hacer un script que reciba dos números y determine si el primero es divisible por el segundo.

2. Hacer un script que reciba un año y determine si es un año bisiesto o no. Ver https://es.wikipedia.org/wiki/A%C3%B1o_bisiesto.

3. Extender el script anterior para que imprima la cantidad de días, horas, minutos y segundos que abarca ese año.

4. Hacer un script que reciba el nombre de un archivo e imprima en pantalla si este tiene permisos de lectura, escritura o ejecución.

5. Hacer un script que en el directorio actual valide el resultado del Ejercicio 9 (Sección 1).

6. Hacer un script que reciba como argumento una ruta (absoluta o relativa), chequear que la misma existe en el sistema de archivos y luego imprimir en pantalla si es de alguno de los siguientes tipos:
   * "archivo": archivo regular.
   * "directorio": directorio.
   * "device": block device o character device.
   * "link": hard link o symbolic link.
   * "otro": ninguno de los casos anteriores.

7. Hacer un script que recibe como primer argumento un comando de bash y luego cualquier cantidad variable de argumentos. El script debe llamar al comando de bash con todos estos argumentos. Ayuda: ver el comando `shift` y la variable `$@`.

8. Crear y ejecutar el siguiente script:
```bash
#!/bin/bash
FILESDIR=random_files
mkdir -p $FILESDIR
EXTS=(".sh" ".txt" ".mp3" ".wav" ".c" ".py" ".mp4" ".mkv" ".doc" ".ppt" ".png" ".gif")

for i in {1..10}; do
    # Generate a random file name with extension
    RANDEXT=${EXTS[$RANDOM % ${#EXTS[@]} ]}
    RANDNAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
    FILENAME=$RANDNAME$RANDEXT
    
    # Create an empty file with the generated name
    touch $FILESDIR/$FILENAME
done
```

Analizar qué hace pragmáticamente (correrlo y ver qué pasa). 
Ordenar los archivos creados segun su extensión (utilizando `case`), según las siguientes categorías.

```
sorted_files
    ├── code
    │   └── <language> (crear un dir para cada lenguaje que se encuentre)
    ├── docs
    │   ├── presentations (.ppt)
    │   └── text (.doc y .txt)
    └── media
        ├── audio (.mp3, .wav)
        ├── images (.jpg, .png, .gif)
        └── video (.mp4, .mkv)

```

### Sección 3
1. Crea un script que liste todos los archivos en el directorio actual que comienzan con una letra mayúscula.

2. Modifica el script anterior para que solo liste los archivos con extensión .txt.

3. Crea un script que liste todos los directorios en el directorio actual. (ver `ls -d`)

4. Modifica el script anterior para que solo liste los directorios con un nombre que contenga la letra e.

5. Crea un script que busque la palabra "manzana" en un archivo e imprima la línea en la que aparece. (ver `grep`). Corra este comando para tener un archivo de ejemplo:
```
curl https://demo.hedgedoc.org/s/NS-deBAHz/download > manzana.txt
```

6. Modifica el script anterior para que también busque la palabra "colesterol".

7. Crea un script que busque cualquier número de teléfono en un archivo que esté en el formato XXX-XXX-XXXX.

8. Crea un script que busque cualquier dirección de correo electrónico en un archivo.

9. Crea un script que solicite al usuario que ingrese un número entre 1 y 5 e imprima un mensaje según el número ingresado.

10. Crea un script que solicite al usuario que ingrese una letra e imprima un mensaje según si la letra es una vocal o una consonante.

11. Crea un script que solicite al usuario que ingrese una contraseña y verifique si cumple con los siguientes criterios: al menos 8 caracteres, contiene al menos una letra mayúscula, contiene al menos una letra minúscula y contiene al menos un número.

12. Crea un script que solicite al usuario que ingrese una oración e imprima un mensaje según si la oración termina con un punto, signo de exclamación o signo de interrogación.

### Sección 4
1. Escribe un script que imprima todos los números pares del 1 al 30.

2. Crea un script que solicite al usuario ingresar un número y luego calcule la suma de todos los números desde 1 hasta ese número.

3. Diseña un script que cuente y muestre la cantidad de archivos que hay en un directorio específico. Pasar por parametro el directorio a evaluar y verificar que sea un directorio.

4. La Secuencia de Fibonacci queda definida por la ecuaciones f(0)=0 , f(1)=1 y f(n)=f(n-1)+f(n-2); con n>=2. Quedando una secuencia infinita: 0,1,1,2,3,5,8... . Crear un script que imprima los primeros 20 números de la Secuencia de Fibonacci.

5. Crea un script que solicite al usuario ingresar un número y calcule su factorial (el producto de todos los números enteros positivos desde 1 hasta el número ingresado). No salir del script hasta que se introduzca la x o X.

6. Crear un script que dibuje un cuadrado con asteriscos y tenga de lado 4 asteriscos
```
* * * *
* * * *
* * * *
* * * *
```

7. Crear un script que dibuje un triangulo con asteriscos y tenga de base 4 asteriscos
```
*
* *
* * *
* * * *
```

9. Crear un script que dibuje un triangulo con asteriscos y tenga de base 4 asteriscos, pero la punta este en el medio de la base
```
   *
  * * 
 * * *
* * * *
```

### Sección 5
En todos los ejercicios, validar los argumentos de entrada, devolver distintos exit codes en los casos en que los argumentos sean inválidos.

1. Cree una función que imprima "¡Hola, mundo!" cuando se llame.

2. Cree una función que tome dos argumentos y muestre su suma.

3. Cree una función que tome un nombre de archivo como argumento y cuente el número de líneas en el archivo.

4. Cree una función que tome un número entero como argumento y verifique si es par o impar.

5. Cree una función que tome un archivo como argumento y verifique si existe.

6. Cree una función que tome una cadena de texto (string) como argumento y muestre cada carácter en una nueva línea. (Ver `${#VAR}` y `${VAR:a:b}`)

7. Cree una función que tome dos números como argumentos y devuelva su producto.

8. Cree una función que tome un directorio como argumento y liste todos los archivos en el directorio.

9. Cree una función que tome una cadena como argumento y devuelva la cadena en orden inverso.

### Sección 6
Para resolver los ejercicios de esta sección necesitamos algunos archivos adicionales con información de ejemplo para poder filtrar. Corran el siguiente script para generarlos:

```bash
#!/bin/bash

# Create the main directory and subdirectories
mkdir -p directorio/subdirectorio1
mkdir -p directorio/subdirectorio2
mkdir -p directorio/subdirectorio3
mkdir -p directorio/subdirectorio4

# Create files in the main directory
touch directorio/{archivo1.txt,archivo2.txt}

# Create files in subdirectory 1
touch directorio/subdirectorio1/{archivo3.txt,archivo4.txt}

# Create files in subdirectory 3
touch directorio/subdirectorio3/{archivo5.txt,archivo6.txt}

# Create the access.log file
echo "192.168.0.1 - - [25/Abr/2023:12:34:56 -0700] \"GET /index.html HTTP/1.1\" 200 1234
192.168.0.2 - - [25/Abr/2023:12:35:01 -0700] \"POST /submit.php HTTP/1.1\" 302 -
192.168.0.1 - - [25/Abr/2023:12:36:02 -0700] \"GET /images/logo.png HTTP/1.1\" 200 5432
192.168.0.3 - - [25/Abr/2023:12:36:45 -0700] \"GET /about.html HTTP/1.1\" 200 9876" > access.log

# Create the archivo.txt file
echo "Este es un ejemplo de archivo de texto.
Contiene varias líneas de texto para probar los ejercicios de bash.
Se puede utilizar para buscar palabras, contar líneas, etc.

123
456
789" > archivo.txt

# Create the archivo.csv file
echo "Nombre,Edad,Ciudad
Ana,25,Madrid
Pedro,32,Barcelona
María,28,Madrid
Luis,30,Valencia" > archivo.csv

# Create the emails.txt file
echo "Este es un ejemplo de archivo que contiene direcciones de correo electrónico.
Puedes extraer todas las direcciones de correo electrónico utilizando el comando grep y la expresión regular proporcionada en el ejercicio.
Por ejemplo, john.doe@example.com, jane.smith@example.com, etc." > emails.txt
```

1. Convertir el archivo CSV `archivo.csv` a un archivo separado por tabs.

    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    cat archivo.csv | tr ',' '\t'
    ```
    </details>

2. Encontrar todos los archivos modificados en los últimos 7 días en el directorio `~/Downloads`.

    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    find ~/Downloads/ -type f -mtime -7
    ```
    </details>

3. Eliminar líneas duplicadas de un archivo y ordenar el resultado.
    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    cat archivo.txt | sort | uniq
    ```
    </details>

4. Reemplazar todas las apariciones de una palabra por otra en múltiples archivos.

    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    sed -i 's/palabra_antigua/palabra_nueva/g' archivo1.txt archivo2.txt
    ```
    </details>

5. Contar el número de procesos en ejecución para cada usuario.

    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    ps -ef | awk '{print $1}' | sort | uniq -c
    ```
    </details>

6. Encontrar todos los directorios vacíos creados por el script en `directorio`.
    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    find directorio/ -type d -empty
    ```
    </details>

7. Encontrar el número de direcciones IP únicas en el archivo `access.log`.
    <details>
    <summary>Respuesta sugerida (No la vean eeeeh):</summary>
    
    ```bash
    cat access.log | awk '{print $1}' | sort | uniq | wc -l
    ```
    </details>

8. Listar las 5 palabras más frecuentes en el archivo de texto `archivo.txt`.
    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    cat archivo.txt | tr -s '[:space:]' '\n' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -rn | head -n 5
    ```
    </details>

9. Extraer todas las direcciones de correo electrónico del archivo de texto `emails.txt`.
    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    grep -Eio '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b' emails.txt
    ```
    </details>

10. Calcular la suma de los números en el archivo `archivo.txt`.
    <details>
    <summary>Respuesta sugerida:</summary>
    
    ```bash
    grep -Eo '[0-9]+' archivo.txt | awk '{ sum += $0 } END { print "The sum of the numbers in archivo.txt is:", sum }'
    ```
    </details>
