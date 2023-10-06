FROM ubuntu

RUN apt-get update
RUN apt-get install -y ffmpeg
RUN apt-get install -y cron
RUN apt-get install -y imagemagick 

ADD ["crontask/","crontask/"]
ADD ["outputs/","outputs/"]
ADD ["/generador.sh","script/generador.sh"]


RUN crontab /crontask/filesgen

ENTRYPOINT ["cron","-f"]
