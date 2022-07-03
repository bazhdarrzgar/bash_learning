#!/bin/bash

echo "Please Check the urls.txt and put this url that you want get header information"
read -p "beganning the operation [ yes or no ]: " start

if [ $start = "yes" ]; then


	readarray -t urls < urls.txt

	for for_url in "${urls[@]}";

	do
		# cutting any name that before ( . and after . ) using cut -d "specify the value" number_of_value_you_want_delete_in_sample using ( -f ) and follow by ( number)
		webname=$(echo $for_url | cut -d "." -f 2)

		# curl basic information header using ( --head ) for this url we have and put it in file name is "$webname.txt" for each link we have
		curl --head "$for_url" > "$webname".txt

	done

else 
	echo
	echo "operation is cancelled"
fi
