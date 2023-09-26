FROM ubuntu:latest
RUN apt-get update && apt-get install -y cron
ADD generador_archivos/cront /etc/cron.d/mycron
RUN crontab /etc/cron.d/mycron
RUN chmod 0644 /etc/cron.d/mycron
ADD generador_archivos/ /app/generador_archivos

ENTRYPOINT ["cron" , "-f"]
