#!/bin/bash

# Obtiene la ruta del directorio del script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Construye la ruta relativa al volumen
VOLUME_PATH="$SCRIPT_DIR/outputs"

# Ejecuta el contenedor Docker
docker run -d -p 21:21 -p 21000-21010:21000-21010 --network mi_network -e USERS="tuiaedpuser|tuiaedpuser" -v "$VOLUME_PATH":/ftp/tuiaedpuser --name ftp delfer/alpine-ftp-server

