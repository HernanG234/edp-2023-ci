FROM ubuntu

RUN apt update -y

ADD ["./menu","/opt/src/menu"]

ENTRYPOINT ["cron"]
