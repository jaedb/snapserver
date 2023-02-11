FROM python:3.9-slim-bullseye

RUN apt-get update && apt-get install wget pkg-config build-essential python3-gi python3-gi-cairo gir1.2-gtk-3.0 libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev libpython3-dev libdbus-1-dev libgirepository1.0-dev -y
RUN pip3 install python-mpd2 PyGObject dbus-python musicbrainzngs websocket-client

ARG SNAPCASTVERSION=0.27.0
ARG SNAPCAST_FILE="0.27.0-1"

RUN wget 'https://github.com/badaix/snapcast/releases/download/v'$SNAPCASTVERSION'/snapserver_'$SNAPCAST_FILE'_amd64.deb'
RUN dpkg -i --force-all 'snapserver_'$SNAPCAST_FILE'_amd64.deb'
RUN apt-get -f install -y
RUN mkdir -p /root/.config/snapcast/

EXPOSE 1704
EXPOSE 1780

ENTRYPOINT ["snapserver"]
