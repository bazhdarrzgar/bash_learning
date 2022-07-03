#!/bin/bash

echo "Welcome ${USER^} To My MINI Project"

echo

echo "Time now is : "time=$(date +%H:%M:%S) # lower case or upper case not problem
echo "Date now is: " time=$(date +%D:%M:%Y) # lower case or upper case not problem

echo
echo

PS3="



Which you want to do in my project 😊 ?: "
select what_option in 'Get detail about my system' 'changing shell' 'changing directory ( root )' 'calculator' 'detail about permission file' 'backup' 'send path to environment variable' 'create file' 'create folder';

do
    # echo "This is day of the week $day"
    # break
    
    case "$what_option" in
        "")
        echo "You didn't enter anything!";;
        
        'Get detail about my system')
            echo
            echo
            echo
            echo
        
            echo "This some detail about your terminal:"
            echo
            echo "this is the type shell you are using ( $SHELL )"
            echo
            echo "Your directory is in here ( $PWD )"
            echo
            echo "Your old directory is ( $OLDPWD )"
            echo
            echo "This is your home directory $HOME"
            echo
            echo "You are currently login with this user: $USER"
            echo
            echo "Your Hostname in this computer is $HOSTNAME"
            echo
            echo "Your Hosttype in this computer is $HOSTTYPE"
            echo
            echo "This is PS1 String value for now $PS1"
            echo
            echo "This path that is in environment variable path $PATH"
            
        ;;
        'changing shell')
            echo
            echo
            echo
            echo
            PS3="
            
which shell you want to use (recommend to use Bash 1) ?: "
            select shell_change in 'bash shell' 'shell it self' 'fish shell';
            
            do
                # echo "This is day of the week $day"
                # break
                
                case "$shell_change" in
                    "") echo "You didn't enter anything!";;
                    'bash shell') echo; chsh -s /bin/bash; echo "[ done ] this is bash shell";;
                    'shell it self') echo; chsh -s /bin/sh; echo "[ done ] this is shell";;
                    'fish shell') echo; chsh -s /bin/fish; echo "[ done ] this is fish shell";;
                    *) echo "you have entered invalid option";;
                esac
                break
                
            done
        ;;
        'changing directory ( root )')
            echo
            echo
            echo
            echo
            PS3="
            
where you want to go ?: "
            select change_directory in 'root';
            
            do
                # echo "This is day of the week $day"
                # break
                
                case "$change_directory" in
                    "") echo "You didn't enter anything!";;
                    'root') sudo su ;;
                    'nothig to do') echo "[ done ]";;
                    *) echo "you have entered invalid option";;
                esac
                break
                
            done
        ;;
        'calculator')
            echo
            echo
            echo
            read -p "type the equation here: " your_equation
            echo
            echo
            echo "                          scale=10; $your_equation" | bc
            echo
            echo
            echo
            echo '
        if you want run this just in your terminal then foll this:

        1)

        echo "scale=10; your_equation" | bc


        2)

        or create file and put this script on it and export to the environment variable in this direction that you are on it
        ---

            #!/bin/bash

            read -p "please enter the equation you want to calculate:   " number
            echo "scale=10; $number" | bc

        ---
            '
        ;;
        
        'detail about permission file')
            echo "

            chmod 744 file_name ( (owner read & write & Excute) and for (Public & Group just read)  )
            ===
            -rwxr--r--
            ===

            chmod 754 file_name ( (owner read & write & Excute) and for (Group just read and excute) and for (Public just read) )

            ===
            -rwxr-xr--
            ===

            chmod +x file_name ( all previledge but just public can not write )

            ===
            -rwxrwxr-x
            ===

            chmod 777 file_name ( all previledge )

            ===
            -rwxrwxrwx
            ===
            "
        ;;
        'backup')
            echo 
            echo 
            echo 
            echo 
            read -p "this place you want make backup enter full path: " path_s
            echo 
            read -p "this place that you want to put backup: " path_d
            echo 
            read -p "type yes if you want done operation or no to cancell: " yes_no
            echo 
            echo 
            
            if [ $yes_no = "yes" ]; then
                tar -cf $path_d/backup_"$(date +%d-%m-%y_%h-%m-s)".tar $path_s/* 2>/dev/null
                
            else
                echo "backup operation is cancelled"
            fi
            
        ;;
        
        'send path to environment variable')
            read -p ' you should follow this rule to send path:


            export PATH="$PATH:$HOME/your_path/.."

            please enter this path that you want to send: ' send_path
            echo
            read -p "
            type yes if you want done operation or no to cancell: " yes_no
            
            if [ $yes_no = "yes" ]; then
                
                echo $send_path >> ~/.profile
                source ~/.profile
            echo "
            [[ done ]] backup operation is done"
                
            else
            echo
            echo
            echo
            echo "
            [[ fail ]] backup operation is cancelled"
            fi
        ;;
        
        'create file')
            echo
            echo
            echo
            echo
            read -p "what is name file: " namefile
            echo
            read -p "what extension you want: " extension_file
            echo
            echo
            
            PS3="

how much file you want to create ?: "

            select number_of_file in 1_10 1_50 1_100 'custome name file (manual)';
            
            do
                # echo "This is day of the week $day"
                # break
                
                case "$number_of_file" in
                    "") echo "You didn't enter anything!";;
                    1_10) touch ${namefile}{1..10}.${extension_file} ;;
                    1_50) touch ${namefile}{1..50}.${extension_file} ;;
                    1_100) touch ${namefile}{1..100}.${extension_file} ;;
                    
                    "custome name file (manual)")
                        echo
                        echo
                        echo
                        echo "please enter name and follow by extension"
                        
                        echo
                        read -p "type the file name sparated by space after finish press enter: " my_array_file
                        echo
                        numbers_file=($my_array_file)
                        touch ${numbers_file[@]}
                    ;;
                    *) echo "you have entered invalid option";;
                esac
                break
            done
        ;;
        
        'create folder')
            echo
            echo
            echo
            echo
            read -p "what is name file: " name_folder
            echo
            PS3="

how much folder you want to create ?: "

            select number_of_folder in 1_10 1_50 1_100 'custome name (manual)';
            
            do                
                case "$number_of_folder" in
                    "") echo "You didn't enter anything!";;
                    1_10) mkdir ${name_folder}{1..10} ;;
                    1_50) mkdir ${name_folder}{1..50} ;;
                    1_100) mkdir ${name_folder}{1..100} ;;
                    
                    "custome name (manual)")
                        echo
                        echo
                        read -p "type the folder name sparated by space after finish press enter: " my_array_folder
                        numbers=($my_array_folder)
                        mkdir ${numbers[@]}
                        echo
                        echo "done"
                    ;;
                    
                    *) echo "you have entered invalid option";;
                esac
                break
            done
        ;;
        
        *) echo "you have entered invalid option";;
    esac
    break
    
done



echo
echo
echo
echo

exit 0
