#!/bin/bash
echo
echo

echo "welcome $USER"
echo
echo
echo
PS3="

Which option you like today: "
select welcome_alex in "checkshell_solution" "check_problem";

do

    
    case "$welcome_alex" in
        "") echo "You didn't enter anything!";;

        "check_problem") 

        select number_problem in 1 2 3 4;
        
        do

        case "$number_problem" in

            "") echo "You didn't enter anything!";;
            1)
            echo '
                    
        
     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 1)

            #!/bin/bash
            ## Example: ShellCheck can detect some higher level semantic problems

            while getopts "nf:" param
            do
            case "$param" in
                f) file="$OPTARG" ;;
                v) set -x ;;
            esac
            done

            case "$file" in
            *.gz) gzip -d "$file" ;;
            *.zip) unzip "$file" ;;
            *.tar.gz) tar xzf "$file" ;;
            *) echo "Unknown filetype" ;;
            esac

            if [[ "$$(uname)" == "Linux" ]]
            then
            echo "Using Linux"
            fi

'

;;

            2)
                        echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 2)

            #!/bin/bash
            ## Example: ShellCheck can detect many different kinds of quoting issues

            if ! grep -q backup=true.* "~/.myconfig"
            then
            echo ''Backup not enabled in $HOME/.myconfig, exiting''
            exit 1
            fi

            tar -cf "$1/my_backup_$(date "+%d-%m-%Y_$H-%M-%S").tar" "$HOME"

'

;;


            3)

                        echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 3)

            #!/bin/sh
            ## Example: a typical script with several problems
            for f in $(ls *.m3u)
            do
            grep -qi hq.*mp3 $f \
                && echo -e ''Playlist $f contains a HQ file in mp3 format''
            done

'

;;


            4)

                        echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 4)

            #!/bin/sh
            ## Example: The shebang says sh so shellcheck warns about portability
            ##          Change it to #!/bin/bash to allow bashisms
            for n in {1..$RANDOM}
            do
            str=""
            if (( n % 3 == 0 ))
            then
                str="fizz"
            fi
            if [ $[n%5] == 0 ]
            then
                str="$strbuzz"
            fi
            if [[ ! $str ]]
            then
                str="$n"
            fi
            echo "$str"
            done

        '
;;
        *) echo "you have entered invalid option";;
esac
break
done
        ;;

        "checkshell_solution") 
        select number_solution in 1 2 3 4;
        do
        case "$number_solution" in
        
            "") echo "You didn't enter anything!";;
            1)

                                echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 1)

            #!/bin/bash
            ## Example: ShellCheck can detect some higher level semantic problems

            while getopts "nf:" param
            do
            case "$param" in
                f) file="$OPTARG" ;;
                n) set -x ;;
                \?);;
            esac
            done

            case "$file" in
            *.tar.gz) tar xzf "$file" ;;
            *.gz) gzip -d "$file" ;;
            *.zip) unzip "$file" ;;
            *) echo "Unknown filetype" ;;
            esac

            if [[ "$(uname)" == "Linux" ]]
            then
            echo "Using Linux"
            fi

'

;;
            2)

                                echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 2)

            #!/bin/bash
            ## Example: ShellCheck can detect many different kinds of quoting issues

            if ! grep -q "backup=true.*" "$HOME/.myconfig"
            then
            echo "Backup not enabled in $HOME/.myconfig, exiting"
            exit 1
            fi

            tar -cf "$1/my_backup_$(date "+%d-%m-%Y_$H-%M-%S").tar" "$HOME"

'

;;

            3)

                                echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 3)

            #!/bin/sh
            ## Example: a typical script with several problems
            for f in $("ls *.m3u")
            do
            grep -qi "hq.*mp3 $f" && echo "Playlist $f contains a HQ file in mp3 format"
            done

'

;;

            4)
                                echo '
        

     ## checkshell game problem and solution in this link below
     ### Website: www.shellcheck.com


## 4)

            #!/bin/sh
            ## Example: The shebang says sh so shellcheck warns about portability
            ##          Change it to #!/bin/bash to allow bashisms
           for n in ${1..RANDOM}
            do
            str=""
            if ( n % 3 = 0 )
            then
                str="fizz"
            fi
            if [ "$(n%5)" = 0 ]
            then
                str="strbuzz"
            fi
            if ( ! $str )
            then
                str="$n"
            fi
            echo "$str"
            done

        '
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