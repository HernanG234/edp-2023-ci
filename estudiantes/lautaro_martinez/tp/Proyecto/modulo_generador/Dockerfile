# Imagen base de Linux
FROM ubuntu:latest

# Instala las dependencias (ffmpeg e imagemagick)
RUN apt-get update && apt-get install -y ffmpeg imagemagick

# Copia script al contenedor
COPY generador.sh /generador.sh

# Permisos
RUN chmod +x /generador.sh

# Comando de ejecucion
CMD ["/generador.sh"]

