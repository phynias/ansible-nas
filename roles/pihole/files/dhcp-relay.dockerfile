FROM debian:bullseye
RUN  DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get upgrade -y && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-relay && \
apt-get clean && rm -rf /var/lib/apt/lists/*

ARG INTERFACE_UPSTREAM
ARG INTERFACE_DOWNSTREAM
ARG SERVER

RUN export INTERFACE_UPSTREAM=${INTERFACE_UPSTREAM} &&  \
export INTERFACE_DOWNSTREAM=${INTERFACE_DOWNSTREAM} && \
export SERVER=${SERVER}

EXPOSE 67/udp

CMD exec dhcrelay -4 -d -id $INTERFACE_DOWNSTREAM -iu $INTERFACE_UPSTREAM $SERVER 2>&1
