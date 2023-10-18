# !/bin/bash

# Directorio de salida principal
output_dir="/tp/outputs"

# Función para generar el informe de monitoreo
generar_informe() {
    # Obtener la fecha y hora actual en el formato DD_MM_YY:HH_MM_SS
    timestamp=$(date +'%d_%m_%y:%H_%M_%S')

    # Ruta completa del archivo de informe
    report_file="$output_dir/report_$timestamp.txt"

    # Obtener el uso de CPU
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

    # Obtener el uso de RAM
    ram_usage=$(free -m | awk '/Mem/ {print $3}')

    # Obtener el número de procesos en ejecución
    process_count=$(ps aux | wc -l)

    # Obtener el espacio libre en disco en porcentaje
    disk_usage=$(df -h / | awk '/\// {print $5}')

    # Crear el informe
    echo "Informe de Monitoreo - $timestamp" > "$report_file"
    echo "Uso de CPU: $cpu_usage%" >> "$report_file"
    echo "Uso de RAM: $ram_usage MB" >> "$report_file"
    echo "Número de procesos en ejecución: $process_count" >> "$report_file"
    echo "Espacio libre en el disco: $disk_usage" >> "$report_file"

    echo "Informe generado y guardado en: $report_file"
}

# Llamar a la función para generar el informe
generar_informe
