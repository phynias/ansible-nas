#!/bin/env bash

echo -ne "WAN:\t\t"
wan=$(curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')
echo "-${wan}-"

echo -ne "sabnzbd:\t"
sab=$(docker exec sabnzbd curl --max-time 2 -s https://greeneggsnspam.com/r.php -k 2>&1| tr -d '[:space:]')
echo "-${sab}-"

echo -ne "transmission:\t"
tran=$(docker exec transmission curl --max-time 2 -s https://greeneggsnspam.com/r.php -k 2>&1| tr -d '[:space:]')
echo "-${tran}-"

if [[ "$sab" == "$wan" ]] || [[ "$tran" == "$wan" ]] || [[ "$sab" == "" ]] || [[ "$tran" == "" ]] || [[ $sab == *"response"* ]]; then
  echo "ALERT!!  sabnzbd/transmission not behind vpn!!!!!!"
  echo "Attempting to fix..."
  docker exec -i expressvpn expressvpn autoconnect true
  docker exec -i expressvpn expressvpn disconnect
  docker exec -i expressvpn expressvpn connect
  docker exec -i expressvpn iptables -A xvpn_dns_ip_exceptions -d \1.1.1.1/32 -p udp -m udp --dport 53 -j ACCEPT 
  docker exec -i expressvpn iptables -A xvpn_dns_ip_exceptions -d \192.168.1.200/32 -p udp -m udp --dport 53 -j ACCEPT 

  echo "Restarting containers..."
  docker restart sabnzbd
  docker restart transmission
  sleep 5

  wan=$(curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')
  sab=$(docker exec sabnzbd curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')
  tran=$(docker exec transmission curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')

  if [ "$sab" == "$wan" ] | [ "$tran" == "$wan" ]; then
    echo "Attempting fix #2..."
    /home/jackfrost/git/ansible-nas/relaunch-vpn.sh all
    sleep 5
    wan=$(curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')
    sab=$(docker exec sabnzbd curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')=
    tran=$(docker exec transmission curl -s https://greeneggsnspam.com/r.php -k| tr -d '[:space:]')
  fi

  if [ "$sab" == "$wan" ] | [ "$tran" == "$wan" ]; then
    echo "Still doesn't look good!!!"
    echo "Stopping...."
    docker stop sabnzbd
    docker stop transmission
  else
    echo "Looks good now!"
  fi
else
  echo "All good!"
fi
