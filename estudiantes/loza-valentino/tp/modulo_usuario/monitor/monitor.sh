#!/bin/bash

timestamp=$(date +%d_%m_%Y-%H_%M_%S)

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

ram_usage=$(free -m | awk '/Mem:/ {print $3}')

process_count=$(ps aux | wc -l)

disk_free=$(df -h / | awk 'NR==2 {print $4}')

output_dir="./outputs"

mkdir -p "$output_dir"

report_file="$output_dir/report_$timestamp.txt"

echo "Informe de Monitoreo - $timestamp" > "$report_file"
echo "Uso de CPU: $cpu_usage%" >> "$report_file"
echo "Uso de RAM: $ram_usage MB" >> "$report_file"
echo "Número de Procesos en Ejecución: $process_count" >> "$report_file"
echo "Espacio Libre en el Disco: $disk_free" >> "$report_file"

echo "Informe generado en $report_file"

