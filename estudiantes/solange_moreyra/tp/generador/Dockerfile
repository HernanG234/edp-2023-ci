FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y ffmpeg
RUN apt-get install -y imagemagick

ADD ["etc/","/etc/"]
ADD ["apt","/apt/"]

RUN crontab /etc/cron.d/generador

ENTRYPOINT ["cron", "-f"]
