FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl lsb-release zfs-dkms zfsutils-linux wget && apt-get -y update
RUN rm -rf /var/lib/apt/lists/*

RUN curl -s https://api.github.com/repos/rouben/zfswatcher/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - && \
  dpkg -i zfswatcher*.deb  && \
  rm zfswatcher*.deb

COPY zfswatcher /opt/bin/zfswatcher
RUN chmod 755 /opt/bin/zfswatcher
ENTRYPOINT ["/opt/bin/zfswatcher"]
