#!/bin/bash
USER="$2"

USER2=$(grep -wE "^#vl $USER" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
exp=$(grep -wE "^#vl $USER" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)

sed -i "/^#vl $USER $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#vlg $USER $exp/,/^},{/d" /etc/xray/config.json
rm -rf /var/www/html/vless-$USER.txt
rm -rf /etc/vless/${USER}IP
rm -rf /etc/vless/${USER}login
rm -rf /etc/cron.d/trialvless$USER
systemctl restart xray