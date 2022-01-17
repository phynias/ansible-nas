FROM debian:bullseye-slim

ENV CODE="code"
ENV SERVER="smart"
ENV HEALTHCHECK=""
ENV BEARER=""
ENV NETWORK="on"
ARG APP=expressvpn_3.13.0.8-1_amd64.deb

COPY files/ /expressvpn/

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    expect curl ca-certificates iproute2 wget jq iptables 

RUN wget -q "https://www.expressvpn.works/clients/linux/${APP}" -O /expressvpn/${APP} \
    && dpkg -i /expressvpn/${APP} \
    && rm -rf /expressvpn/*.deb \
    && rm -rf /var/lib/apt/lists/* 
RUN apt-get purge --autoremove -y wget \
    && rm -rf /var/log/*.log

HEALTHCHECK --start-period=30s --timeout=5s --interval=2m --retries=3 CMD bash /expressvpn/healthcheck.sh

ENTRYPOINT ["/bin/bash", "/expressvpn/start.sh"]
