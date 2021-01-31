#!/usr/bin/bash

cp /etc/resolv.conf /tmp/resolv.conf
su -c 'umount /etc/resolv.conf'
cp /tmp/resolv.conf /etc/resolv.conf
service expressvpn start
/usr/bin/expect /tmp/expressvpnActivate.sh
expressvpn preferences set send_diagnostics false
expressvpn preferences set force_vpn_dns false
expressvpn connect $SERVER
exec "$@"
