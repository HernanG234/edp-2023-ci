#!/bin/bash

fecha_hora=$(date +"%d_%m_%y:%H_%M_%S")

cpu_uso=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

ram_uso=$(free -m | awk '/Memoria:/ {print $3}')

procesos=$(ps aux | wc -l)

disk_libre=$(df --output=avail -h / | sed -n '2p')

# Cración el informe
report="Uso de CPU: $cpu_uso%\nUso de RAM: $ram_uso MB\nNúmero de procesos: $procesos\nEspacio libre en disco: $disk_libre"

#guardado del informe en archivo
echo -e "$report" > "outputs/report_$fecha_hora.txt"

echo "Informe guardado en outputs/report_$fecha_hora.txt"
