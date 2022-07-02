* [Table of Contents](#table-of-contents)
	- [Debuggin using user interface](#first)
	- [Error Message Structure + How to Solve Common Error](#second)
	- [How to find help](#third)

<a name="first"></a>

## Debuggin using user interface

* [shellcheck](www.shellcheck.com)

* this is solve problem you can use www.shellcheck.com for seeing the problem


```bash 

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







* ????

#!/bin/bash
## Example: ShellCheck can detect many different kinds of quoting issues

if ! grep -q "backup=true.*" "$HOME/.myconfig"
then
  echo "Backup not enabled in $HOME/.myconfig, exiting"
  exit 1
fi

tar -cf "$1/my_backup_$(date "+%d-%m-%Y_$H-%M-%S").tar" "$HOME"






#!/bin/sh
## Example: a typical script with several problems
for f in $("ls *.m3u")
do
  grep -qi "hq.*mp3 $f" && echo "Playlist $f contains a HQ file in mp3 format"
done





#!/bin/sh
## Example: The shebang says 'sh' so shellcheck warns about portability
##          Change it to '#!/bin/bash' to allow bashisms
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


```

<a name="second"></a>

## Error Message Structure + How to Solve Common Error

```bash

ls 1234

===
ls: cannot access '1234': No such file or directory
===


---                              
#!/bin/bash

readarray -t urls < urls.txt

forfor_url in "${urls[@]}";
do
         webname=$(echo $for_url | cut -d "." -f 2)

         curl --head "$for_url" > "$webname".txt
done

---

./for_loop

===
# error message
./for_loop: line 3: urls.txt: No such file or directory
./for_loop: line 5: forfor_url: command not found
./for_loop: line 7: syntax error near unexpected token do
./for_loop: line 7: do
===






touch urls.txt

---                              
#!/bin/bash

readarray -t urls < urls.txt
# firx this error between for_url and for
for for_url in "${urls[@]}";
do
         webname=$(echo $for_url | cut -d "." -f 2)

         curl --head "$for_url" > "$webname".txt
done

---

./for_loop

===
# now error now
===




cat 1234

===
cat: 1234: No such file or directory
===



touch 1234/test

===
touch: cannot touch '1234/test': No such file or directory
===


mkdir hello
mkdir hello

===
mkdir: cannot create directory ‘hello’: File exists
===

---
#!/bin/bash

if [ ! -d 1234 ]; then
	mkdir 1234
fi
---



touch /root/1234

===
touch: cannot touch '/root/1234': Permission denied
===





sudo touch /root/1234

===
[sudo] password for soyansoon: 
===





sudo ls /root 

===
1234
===





# looking at root directory
ls -l /

===
total 2097268
lrwxrwxrwx   1 root root          7 Feb 14 20:03 bin -> usr/bin
drwxr-xr-x   4 root root       4096 Jun 22 02:48 boot
drwxrwxr-x   2 root root       4096 Feb 14 20:04 cdrom
-rw-r--r--   1 root root        588 Jun 15 13:44 crud
drwxr-xr-x  22 root root       5360 Jun 30 21:34 dev
-rw-r--r--   1 root root          0 May 14 23:03 directory-to-open
drwxr-xr-x 153 root root      12288 Jun 27 12:56 etc
drwxr-xr-x   3 root root       4096 Feb 14 20:05 home
lrwxrwxrwx   1 root root          7 Feb 14 20:03 lib -> usr/lib
lrwxrwxrwx   1 root root          9 Feb 14 20:03 lib32 -> usr/lib32
lrwxrwxrwx   1 root root          9 Feb 14 20:03 lib64 -> usr/lib64
lrwxrwxrwx   1 root root         10 Feb 14 20:03 libx32 -> usr/libx32
drwx------   2 root root      16384 Feb 14 20:03 lost+found
drwxr-xr-x   3 root root       4096 Feb 17 00:01 media
drwxr-xr-x   2 root root       4096 Aug 19  2021 mnt
drwxr-xr-x  11 root root       4096 Apr 30 20:30 opt
dr-xr-xr-x 407 root root          0 Jun 30 21:34 proc
drwx------  13 root root       4096 Jun 23 00:52 root
drwxr-xr-x  37 root root       1000 Jun 30 21:37 run
lrwxrwxrwx   1 root root          8 Feb 14 20:03 sbin -> usr/sbin
drwxr-xr-x  29 root root       4096 Jun 26 18:44 snap
drwxr-xr-x   2 root root       4096 Aug 19  2021 srv
-rw-------   1 root root 2147483648 Feb 14 20:03 swapfile
dr-xr-xr-x  13 root root          0 Jun 30 21:34 sys
drwxrwxrwt  22 root root      32768 Jun 30 21:49 tmp
drwxr-xr-x  14 root root       4096 Aug 19  2021 usr
drwxr-xr-x  15 root root       4096 Feb 15 00:37 var
===





nonexistent

===
nonexistent: command not found
===

```

------------------

<a name="third"></a>

## How to find help

* internal command ( come with system )

* external command ( come with outside the system )

```bash

type -a cd

===
cd is a shell builtin
===


type -a ls

===
ls is aliased to ls --color=auto
ls is /usr/bin/ls
ls is /bin/ls
===

```

* Asking for help

```bash

help   man   info

# help is for internal command
# man for external command
# info for both of it




help cd

===
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.
    
    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.
.
.
.
===



help ls

===
bash: help: no help topics match ls.  Try help help or man -k ls or info ls.
===





man ls 

===
LS(1)                                                                                           User Commands                                                                                         

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...


.
.
.
===




# use link method for link the word
info ls

===
Next: dir invocation,  Up: Directory listing

10.1 ‘ls’: List directory contents
==================================

The ‘ls’ program lists information about files (of any type, including
directories).  Options and file arguments can be intermixed arbitrarily,
.
.
.
* Which files are listed::         # link word
* What information is listed::     # link word
.
.
* wc invocation::               Print newline, word, and byte counts.
* sum invocation::              Print checksum and block counts.
* cksum invocation::            Print CRC checksum and byte counts.
.
.
===




# -d tell you about what this command for 
help -d cd 

===
cd - Change the shell working directory.
===





man cd

===
No manual entry for cd
===




# for more info about help use:

help help

# for more information about man use:

man man

# for more information about info use:

info info

# you can use some trick with external command like:

man info

info man

# this is not work with help

```


```bash

# work with key point using man 
man -k compress

===
7z (1)               - A file archiver with high compression ratio format
7za (1)              - A file archiver with high compression ratio format
7zr (1)              - A file archiver with high compression ratio format
bunzip2 (1)          - a block-sorting file compressor, v1.0.8
.
.
.
===


# you can search using man just by placing one slash / + name_this_word you want to search for it
# Example: /partition

```