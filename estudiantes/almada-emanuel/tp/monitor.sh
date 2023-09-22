#!/bin/bash 

echo"USO DE CPU EN  %" 
top | grep '%Cpu(s)'
echo"USO DE MEMORIA EN MEBIBYTES"
top | grep 'MiB Mem' 
echo"NÚMERO DE PROCESOS CORRIENDO EN EL SISTEMA" 
ps -e | tail -n+2 | wc -l 
echo"ESPACIO DISPONIBLE TOTAL Y USADO EN DISCO; EXPRESADO EN GB Y EN %"
df -x devtmpfs -x tmpfs --total -h | grep total | awk '{ print $4 " " $5 }'

