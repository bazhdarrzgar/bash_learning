#!/bin/bash

echo "use file.txt and folder.txt to put your text that you want to create it"
echo 
echo 
PS3="Creating file or folder 😊 ?"

select what_option in 'file' 'folder';

do
    case "$what_option" in
        "") echo "You didn't enter anything!" ;;
 
		"file")
			readarray -t file < files.txt

			for for_file in "${file[@]}"; 

			do
				if [ -f "$for_file" ]; then
					echo "$for_file is already exists"
				else
					touch "$for_file"
					echo "$for_file was created successfully"
				fi
			done
			break
			;;
		
		"folder")
			
			readarray -t folder < folder.txt

			for for_folder in "${folder[@]}"; 

			do
				if [ -d "$for_folder" ]; then
					echo "$for_folder is already exists"
				else
					mkdir "$for_folder"
					echo "$for_folder was created successfully"
				fi
			done
			break
		;;

		*) echo "you have entered invalid option";;
    esac
	break
done




