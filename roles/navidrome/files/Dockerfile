FROM alpine:3.19

ENV SUBSONIC_VERSION=6.1.6
ENV SUBSONIC_BIN=/opt/subsonic
ENV SUBSONIC_HOME=/data

ARG UID
ARG GID

# Download Subsonic
ADD https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-${SUBSONIC_VERSION}-standalone.tar.gz /tmp/subsonic.tar.gz

# Install Java and audio tools
#RUN echo "@commuedge https://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
#RUN echo "@commuedge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
RUN apk --update add --no-cache tini nss openjdk8-jre openssl openssl-dev ffmpeg lame && \
    rm -rf /var/cache/apk/*

# Set up Subsonic binaries
RUN mkdir -p ${SUBSONIC_HOME} && \
    mkdir -p ${SUBSONIC_BIN} && \
    tar zxvf /tmp/subsonic.tar.gz -C ${SUBSONIC_BIN} && \
    rm -rf /tmp/*

# Modify startup script
## Don't redirect logs and don't fork main process
RUN sed -i "s/ > \${LOG} 2>&1 &//" ${SUBSONIC_BIN}/subsonic.sh
## Create symlinks for transcoding tools (because Subsonic has hard-coded paths for these)
RUN sed -i '/# Create Subsonic home directory./i \
	mkdir -p ${SUBSONIC_HOME}/transcode && ln -fs /usr/bin/ffmpeg /usr/bin/lame ${SUBSONIC_HOME}/transcode\n' ${SUBSONIC_BIN}/subsonic.sh

VOLUME [/music]
VOLUME [/books]
VOLUME [/podcasts]
VOLUME [/playlists]
VOLUME [/data]

RUN    addgroup -g ${GID} -S subsonic && adduser -u ${UID} -S subsonic -G subsonic
ADD    startup.sh /startup.sh
RUN    mkdir -p /data && chown subsonic:subsonic /data && chmod 755 /startup.sh
RUN    chown -R subsonic:subsonic /opt/subsonic

EXPOSE 4040
EXPOSE 4141
USER   subsonic

CMD ["/sbin/tini","--","/startup.sh"]
