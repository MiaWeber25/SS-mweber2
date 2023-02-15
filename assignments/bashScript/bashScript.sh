#! /bin/bash

# backup
# new users
# Disk usage / CPU levels
# firewall setup / monitoring
# defensive security
# reporting 
# offensive security: scanning, checking for system diagnostic/logs etc. 

myIP = &(echo hostname -I | out -f1 -d' ')
echo sudo nmap -sT -p- $myIP 
echo sudo nmap -sU -p- $myIP