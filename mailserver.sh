#!/bin/bash
FULL=`cat /etc/mailserver/hostname`
SHORT=`echo $FULL | cut -d. -f1`
echo $SHORT > /etc/hostname
echo $FULL > /etc/mailname
perl -i -0 -pe  "s/## hostname.*//s" /etc/hosts
echo -e "## hostname\n127.0.1.1 $FULL $SHORT" >> /etc/hosts

sed -i "s/myhostname = .*/myhostname = $FULL/g" /etc/postfix/main.cf
sed -i 's/mynetworks = .*/mynetworks = 127.0.0.0\/8 172.17.0.0\/16 [::ffff:127.0.0.0]\/104 [::1]\/128/g' /etc/postfix/main.cf
sed -i 's/#myorigin/myorigin/g' /etc/postfix/main.cf
# remove old rules
#perl -i -0 -pe  "s/### MATCH USERS.*//s" /etc/ssh/sshd_config
# sshd rules
#echo "### MATCH USERS" >> /etc/ssh/sshd_config
#cat /etc/useraccess/sshd_config >> /etc/ssh/sshd_config
