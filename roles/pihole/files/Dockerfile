#########################################
# Build stage
#########################################
FROM pihole/pihole
COPY webpage.sh /opt/pihole/webpage.sh
COPY basic-install.sh /root/ph_install.sh

RUN apt-get update && apt-get remove speedtest-cli && apt-get install -y wget curl &&\
  curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash && \
  sudo apt-get install speedtest speedtest-cli && \
  ln -s /usr/bin/speedtest /bin && \
  apt install -y sqlite3 jq  php7.3-sqlite && \
  cd /var/www/html && \
  mv admin org_admin && \
  git clone https://github.com/arevindh/AdminLTE admin && \
  cd /opt/pihole/ && \
  cp /var/www/html/admin/scripts/pi-hole/speedtest/speedtest.db /etc/pihole/ && \
  /bin/chmod 755 webpage.sh && /bin/chown pihole webpage.sh && \
  curl -sSl https://raw.githubusercontent.com/mmotti/pihole-regex/master/install.py | sudo python3 && \
  rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
