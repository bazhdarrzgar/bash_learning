#!/bin/bash
echo
echo

echo "welcome $USER"
echo
echo
echo
PS3="

Which option you like today: "
select welcome_alex in 'knowing the time' 'create ssh key' 'connect to the server' 'move you file to the server' 'featch some information about your computer' 'configure depedence for crontab' 'some info about cron and anacrontab';

do

    
    case "$welcome_alex" in
        "") echo "You didn't enter anything!";;
        "create ssh key")
        echo
        echo
        echo "follow the quetion to create your ssh key"
        echo
        ssh-keygen
        ;;
        "connect to the server")
        echo '
        
        Q: how to connect to the server ?

        [name the server]@[ip the server]

        '
        read -p "type your server name: " ssh_server_name
        ssh $ssh_server_name
        
        echo
        ;;
        
        "move you file to the server")
        echo '
        
        scp source target

        
        # Example:

        scp ~/ip_script.sh root@138.68.137.214:~/

        '
        echo
        
        read -p "type your server name: " ssh_servername
        read -p "which file you want to upload (file path follow by the name): " source_file_or_folder
        read -p "where you want to put in the server (path): " destinamtion_file_or_folder

        scp $source_file_or_folder $ssh_servername:$destinamtion_file_or_folder
        ;;

        'featch some information about your computer') 

        echo 
        echo "
        you can use this script in to featch information in computer server but this script should be in the server and call the script like something like this:

        scp root@138.68.137.214:~/performance.log ~/Desktop


        "
            date >> ~/performance.log

            ping -c 1 google.com &> /dev/null

            if [ "$?" -eq 0 ]; then
                echo "Internet: Connected" >> performance.log
            else 
                echo "Internet: Disconnected" >> performance.log
            fi

            echo "RAM Usages : " >> performance.log
            free -h | grep "Mem" >> performance.log

            echo "Swap Usages : " >> performance.log
            free -h | grep "Swap" >> performance.log

            echo "Disk Usages : " >> performance.log
            df -h >> performance.log

            echo ""
        ;;

        'configure depedence for crontab')
        echo '
        ## install all this with sudo:

        sudo apt -y update
        sudo apt -y upgrade
        sudo apt -y install at
        sudo service atd start
        sudo service atd restart
        service atd status
        service cron start
        service cron restart
        service cron status
        '

        sudo su

        ;;

        'knowing the time')
        echo
        date
        echo
        ;;

        'some info about cron and anacrontab')
        echo '
        ## open ana cron edit file

        sudo nano /etc/anacrontab  


        ## Open crontab edit file

        sudo nano /etc/crontab

        crontab -e


        ## some info about time


            * * * * *

            every minute




            5 4 * * *
                
            At 04:05



            At 00:05 in August

            5 0 * 8 *



            At 14:15 on day-of-month 1

            15 14 1 * *



            At 22:00 on every day-of-week from Monday through Friday

            0 22 * * 1-5



            At minute 23 past every 2nd hour from 0 through 20

            23 0-20/2 * * *



            At 04:05 on Sunday

            5 4 * * sun



            At minute 0 past hour 0 and 12 on day-of-month 1 in every 2nd month

            0 0,12 1 */2 *


            At 04:00 on every day-of-month from 8 through 14

            0 4 8-14 * *




            */5 4 * * *

            At every 5th minute past hour 4




            At minute 5 past every 4th hour

            5 */4 * * *




            whereas * * */2 * 1 runs on every second day of the month only if its also a Monday (intersection).

            if you need to run X every 90 minutes, create one crontab entry that runs X every 3 hours on the hour (0 */3 * * *), and a second crontab entry that runs X every 3 hours with an offset (30 1/3 * * *).


        '
        ;;
        *) echo "you have entered invalid option";;
    esac
    break
done