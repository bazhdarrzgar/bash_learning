#!/bin/bash

total_second=""

while getopts "m:s:h:" opt; 

do
	case "$opt" in 
		h) total_second=$(( $total_second + $OPTARG * 60 * 60 ));;
		m) total_second=$(( $total_second + $OPTARG * 60 ));;
		s) total_second=$(( $total_second + $OPTARG ));;
		\?);;
esac
done

while [ $total_second -gt 0 ]; do
	echo "$total_second"
	total_second=$(( $total_second - 1 ))
	sleep 1s
done

echo "Time's up!"
