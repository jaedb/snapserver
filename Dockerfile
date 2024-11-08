FROM python:3.11-alpine

ARG LIBRESPOT_VERSION=0.6.0-r0
ARG SNAPCAST_VERSION=0.28.0-r1

# Add testing libraries: source of the librespot binary
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories

RUN apk add --no-cache \
    bash \
    librespot=${LIBRESPOT_VERSION} \
    snapcast=${SNAPCAST_VERSION} \
    wget \
    sed \
    # Python dependencies
    python3 \
    py3-pip \
    pkgconfig \
    py3-gobject3

# Install python dependencies for control scripts
RUN python3 -m pip install \
    python-mpd2 \
    musicbrainzngs \
    websocket-client

EXPOSE 1704
EXPOSE 1780

ENTRYPOINT ["snapserver"]
