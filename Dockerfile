FROM ubuntu:latest

RUN apt-get update && apt-get install wget -y

ARG SNAPCASTVERSION=0.19.0
ARG SNAPCAST_FILE="0.19.0-1"

RUN wget 'https://github.com/badaix/snapcast/releases/download/v'$SNAPCASTVERSION'/snapserver_'$SNAPCAST_FILE'_amd64.deb'

RUN dpkg -i --force-all 'snapserver_'$SNAPCAST_FILE'_amd64.deb'
RUN apt-get -f install -y

RUN mkdir -p /root/.config/snapcast/

EXPOSE 1704
EXPOSE 1780

ENTRYPOINT ["snapserver"]
