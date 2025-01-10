#!/bin/bash
USER="$2"

USER2=$(grep -wE "^#vm $USER" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
exp=$(grep -wE "^#vm $USER" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)


  sed -i "/^#vm $USER $exp/,/^},{/d" /etc/xray/config.json
  sed -i "/^#vmg $USER $exp/,/^},{/d" /etc/xray/config.json
  rm -rf /var/www/html/vmess-$USER.txt
  rm -rf /etc/vmess/${USER}IP
  rm -rf /etc/vmess/${USER}login
  rm -rf /etc/cron.d/trialvmess$USER
  systemctl restart xray