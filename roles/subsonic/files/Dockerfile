FROM alpine:3.7

ENV SUBSONIC_VERSION=6.1.6
ENV SUBSONIC_BIN=/opt/subsonic
ENV SUBSONIC_HOME=/data

# Download Subsonic
ADD https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-${SUBSONIC_VERSION}-standalone.tar.gz /tmp/subsonic.tar.gz

# Install Java and audio tools
RUN apk --update add --no-cache openjdk8-jre-base ffmpeg lame && \
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
VOLUME [/data]
VOLUME [/books]
RUN addgroup -S downloads -g 1001 && adduser -u 1001 -S downloads -G downloads
ADD    startup.sh /startup.sh
RUN    mkdir -p /data && chown downloads:downloads /data && chmod 755 /startup.sh
RUN    chown -R downloads:downloads /opt/subsonic

EXPOSE 4040
USER   downloads

ENTRYPOINT ["/startup.sh"]
