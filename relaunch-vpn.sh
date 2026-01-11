#!/bin/env bash

cd /home/jackfrost/git/ansible-nas/
if [ "$1" == "all" ]; then
  echo "Relaunching VPN container."
  ansible-playbook --ask-vault-pass -i inventories/my-ansible-nas/inventory -D  -e docker_recreate=1 -t expressvpn  nas.yml
  echo "Waiting for container to start."
  sleep 10
fi


ansible-playbook --ask-vault-pass -i inventories/my-ansible-nas/inventory -D  -e docker_recreate=1 -t transmission,sabnzbd,searxng nas.yml 
