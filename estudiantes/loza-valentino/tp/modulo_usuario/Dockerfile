FROM ubuntu:latest

RUN apt-get update && apt-get install -y cron ffmpeg imagemagick

ADD clasificador_archivos/ /app/clasificador_archivos/
ADD compresor/ /app/compresor/
ADD downloader/ /app/downloader/
ADD monitor/ /app/monitor/
ADD menu/ /app/monitor/
