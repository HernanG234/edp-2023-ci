FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    file 

WORKDIR /app

COPY downloader /app/downloader
COPY clasificador_archivos /app/clasificador_archivos
COPY compresor /app/compresor
COPY monitor /app/monitor
COPY menu /app/menu

RUN mkdir -p /app/descargas /app/outputs_clasificador /app/outputs

CMD ["bash", "/app/menu"]  


