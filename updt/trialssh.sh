#!/bin/bash

USER="$2"


USERdel -f $USER
exp=$(grep -wE "^### $USER" "/etc/xray/ssh" | cut -d ' ' -f 3 | sort | uniq)
pass=$(grep -wE "^### $USER" "/etc/xray/ssh" | cut -d ' ' -f 4 | sort | uniq)
sed -i "s/### $USER $exp $pass//g" /etc/xray/ssh 
rm -rf /var/www/html/ssh-$USER.txt
rm -rf /etc/xray/sshx/${USER}IP
rm -rf /etc/xray/sshx/${USER}login
rm -rf /etc/cron.d/trialssh$USER
systemctl restart sshd