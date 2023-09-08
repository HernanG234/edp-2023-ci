#!/bin/bash


# 5. Imprimir "Hola `<nombre de usuario>`" a stdout (por consola).
# Del ejercicio 4, buscar la variable de entorno que tiene esta información.

var=($USER)

echo "Hola $var"


