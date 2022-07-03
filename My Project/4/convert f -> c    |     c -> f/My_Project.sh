#!/bin/bash

while getopts "f:c:" opt; 

do
	case "$opt" in 

		c) result_c_to_f=$( echo "scale=2; ($OPTARG * (9 / 5)) + 32" | bc );;
		
		f) result_f_to_c=$( echo "scale=2; ($OPTARG - 32) * (5/9)" | bc );;
		
		\?);;

esac
done

echo 
echo "c to f convert: $result_c_to_f f"
echo 
echo "f to c convert: $result_f_to_c c"
echo 
