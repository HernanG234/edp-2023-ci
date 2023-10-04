FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y ffmpeg
RUN apt-get install -y imagemagick

ADD ["etc/","/etc/"]
ADD ["opt","/opt/"]

RUN crontab /etc/cron.d/generator

ENTRYPOINT ["cron", "-f"]
