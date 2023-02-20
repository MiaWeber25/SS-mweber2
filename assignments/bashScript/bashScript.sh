#! /bin/bash 
# By: Mia Weber 02/20/2023 
# Script to check open ports against list of correct ports to be open. Based on user provided flags will kill processes and log to provided file. 

compareFile=${@: -1} # The file to compare the open ports to. Last argument.

didKill=0 # Used in log flag statement to determine if it needs to report processes that were killed. 

couldKill=() # Array to store the port # and PID of processes that it could kill (based on file comparison) 

readarray -t<<<`IP=$(hostname -I | cut -f1 -d' ') sudo netstat -lntup | grep "LISTEN" | sed -r "s/.*$IP:([0-9]+).* ([0-9]+)\/.*/\1,\2/"` 
# Read the parsed results of the netstat command into the array of all open port #s

for PORT in "${MAPFILE[@]}" 
do

DATA=$( echo "${PORT}" | cut -d"," -f1)
DATA2=$( echo "${PORT}" | cut -d"," -f2)

# Check to see if the port # is listed in the compare file. Add port info to couldKill array if not listed in file.
if echo "$DATA" | grep -qf - $compareFile
then
	echo "IN THE FILE- PROTECT!" >> /dev/null 
else 
	#echo "NOT IN THE FILE- POTENTIAL TO KILL!"
	couldKill+=("${PORT}")
fi
done



# Switch statement for command line flags
while getopts 'hkl:' OPTION; do
case "$OPTION" in
	h)
		# Help command line flag -> print help menu
		echo "-h, --help                       show brief help"
		echo "-k, --kill                       kill unwanted processes on corresponding ports"
		echo "-l, --log <filename>             log actions to specified log file. Will log in format: port#, PID"
		echo "Comparison file must be passed last after any and all flags"	
		;;
	k)
		# Killing command line flag -> kill the processes based on the elements in couldKill array's PID
		for element in "${couldKill[@]}"
		do 
			PID=`echo ${element} | cut -d "," -f2`
			kill -9 ${PID[0]}
			didKill=1
		done
		;;
	l)	
		# Logging command line flag -> log the correct info to the provided log file
		logFile="$OPTARG"
		#chmod 666 /tmp/$logFile
		#tail -n5 /var/log/$logFile > /var/log/test.new mv /var/log/test.new /var/log/$logFile
		echo "*****new entry*****" >> /tmp/$logFile
			echo "OPEN PORTS: ${MAPFILE[@]}" >> /tmp/$logFile
			echo "ELIGIBLE PORTS TO KILL: ${couldKill[@]}" >> /tmp/$logFile
	
			if [[ $didKill == 1 ]]; then 
				#echo "KILLED"
				echo "KILLED: ${couldKill[@]}" >> /tmp/$logFile
			else 
				#echo "NO KILL"
				echo "DID NOT KILL" >> /tmp/$logFile
			fi 
			;;
		?)
			# Command line flags were incorrectly provided
			echo "script usage: $(basename /$0) [-k] [-l <filename>] [-h]" >&2
			exit 1
			;;
	esac
done
shift "$(($OPTIND -1))"
