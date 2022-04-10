FROM arm32v7/debian
RUN  DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get upgrade -y && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-relay && \
apt-get clean && rm -rf /var/lib/apt/lists/*

ARG INTERFACE_UPSTREAM
ENV INTERFACE_UPSTREAM=${INTERFACE_UPSTREAM}
ARG INTERFACE_DOWNSTREAM
ENV INTERFACE_DOWNSTREAM=${INTERFACE_DOWNSTREAM}

ARG SERVER
ENV SERVER=${SERVER}

RUN export INTERFACE_UPSTREAM=${INTERFACE_UPSTREAM} &&  \
export INTERFACE_DOWNSTREAM=${INTERFACE_DOWNSTREAM} && \
export SERVER=${SERVER}

EXPOSE 67/udp

CMD dhcrelay -4 -d -id $INTERFACE_DOWNSTREAM -iu $INTERFACE_UPSTREAM $SERVER
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
