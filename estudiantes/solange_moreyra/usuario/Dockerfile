FROM ubuntu

RUN apt update -y
RUN apt install -y cron
RUN apt install -y vim

ADD ["./menu","/opt/src/menu"]

ENTRYPOINT ["cron"]
