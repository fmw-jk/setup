#!/usr/bin/env bash

# Script for executing commands on all cob-stud-pc's.

# checking input parameters
if [ "$#" -lt 1 ]; then
	echo "ERROR: Wrong number of parameters"
	echo "Usage: $0 command"
	exit 1
fi

client_list="
$ROBOT-pc1
$ROBOT-pc2
$ROBOT-pc3"

for client in $client_list; do
	echo "-------------------------------------------"
	echo "Executing <<"$*">> on $client"
	echo "-------------------------------------------"
	echo ""
	ssh $client "$*"
	ret=${PIPESTATUS[0]}
	if [ $ret != 0 ] ; then
		echo "command return an error (error code: $ret), aborting..."
		exit 1
	fi
	echo ""
done
