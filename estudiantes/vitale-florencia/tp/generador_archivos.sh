
#!/bin/bash

echo "Generador de archivos aleatorio"
opciones=("Archivo de texto" "Archivo de sonido" "Archivo de imagen")
opcion_aleatoria=${opciones[$RANDOM % ${#opciones[@]}]}
echo "Se generó un $opcion_aleatorio"

case "$opcion_aleatoria" in
    "Archivo de texto")
        # Generar un archivo de texto
        base64 /dev/urandom | head -c 500 > file.txt
        echo "Archivo de texto 'file.txt' creado."
        ;;
    "Archivo de sonido")
        # Generar un archivo de sonido
        ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
        echo "Archivo de sonido 'out.wav' creado."
        ;;
    "Archivo de imagen")
        # Generar un archivo de imagen
        convert -size 100x100 xc: +noise Random noise.png
        echo "Archivo de imagen 'noise.png' creado."
        ;;
    *)
        echo "Opción no válida. Algo salió mal."
        ;;
esac
