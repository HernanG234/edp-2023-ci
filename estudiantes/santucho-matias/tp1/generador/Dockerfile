FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    cron \
    ffmpeg \
    imagemagick
    
#WORKDIR /app

COPY generador_archivos /app/generador_archivos
COPY outputs_generador /app/outputs
ADD ["etc/","/etc/"]

RUN crontab /etc/cron.d/generador
CMD ["bash", "/app/generador_archivos"]
CMD ["cron", "-f"]
