#! /bin/bash
# By: Mia Weber 02/18/2022
# Script to verify that the log file written to from bashScript.sh is being updated every min (therefore cron is working as scheduled).

current=`date +%s`
last_modified=`stat -c "%Y" /tmp/portKiller.log`

if [ $(($current-$last_modified)) -gt 60 ]; then
	echo "running as scheduled" >> /tmp/verifykiller.log
else 
	echo "not running as scheduled" >> /tmp/verifykiller.log
fi
