#!/bin/bash

# Ruta relativa al directorio del script
base_dir="."

# Comprimir la carpeta outputs en un archivo outputs.tar
tar -cvf "$base_dir/outputs.tar" -C "$base_dir" outputs
