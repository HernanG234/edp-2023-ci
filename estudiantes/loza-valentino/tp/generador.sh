#!/bin/bash

generate_text() {
	base64 /dev/urandom | head -c 500 > file.txt
	echo "Texto aleatorio generado correctamente: file.txt"
}

generate_sound() {
	ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
	echo "Sonido aleatorio generado correctamente: out.wav"
}

generate_images() {
	convert -size 100x100 xc: +noise Random noise.png
	echo "Imagen aleatoria generada correctamente: noise.png"
}



