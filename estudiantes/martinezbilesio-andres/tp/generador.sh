

# Programa generador de archivos capaz de generar distintos tipo de archivos

opcion=$(echo $((RANDOM%3)))
mkdir output

case $opcion in
    0)
        base64 /dev/urandom | head -c 500 > file.txt
        hash=$(sha256sum file.txt | cut -d ' ' -f 1)
        mv file.txt "output/$hash"
    ;;
    1)
        ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
        hash=$(sha256sum out.wav | cut -d ' ' -f 1)
        mv out.wav "output/$hash"
    ;;
    2)
        convert -size 100x100 xc: +noise Random noise.png
        hash=$(sha256sum noise.png | cut -d ' ' -f 1)
        mv noise.png "output/$hash"
    ;;
    *)
        echo "Opción no válida: $opcion"
    ;;
esac
