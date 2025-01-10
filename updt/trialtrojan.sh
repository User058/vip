#!/bin/bash
USER="$2"

USER2=$(grep -wE "^#trg $USER" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
exp=$(grep -wE "^#trg $USER" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)

sed -i "/^#tr $USER $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#trg $USER $exp/,/^},{/d" /etc/xray/config.json
rm -rf /var/www/html/trojan-$USER.txt
rm -rf /etc/trojan/${USER}IP
rm -rf /etc/trojan/${USER}login
rm -rf /etc/cron.d/trialtrojan$USER
systemctl restart xray