* [Table of Contents](#table-of-contents)
	- [Three Core Component To wright Bash script](#first)
	- [How to Write Bash Script In File](#second)
	- [First Practic](#third)
	- [Writing Professional Comments](#four)
	- [How to take permission to the file](#five)
	- [What you learn](#six)
	- [MAKING YOUR SCRIPTS ACCESSIBLE FROM ANY FOLDER](#seven)

<a name="first"></a>

## Three Core Component To wright Bash script

* to test you are using bash type:

```bash

* Write

echo $SHELL

* Output 

/bin/bash

```

* if not get this output type this to get into bash

```bash

chsh -s /bin/bash

```



---------------------- 

<a name="second"></a>

## How to Write Bash Script In File

* know if we use bash script

#!/bin/bash

* know if we use python script

#!/usr/bin/python3


---------------------- 

<a name="third"></a>

## First Practic

```bash

mkdir ~/bash_course

cd ~/bash_course

nano our_first_script

----
#!/bin/bash
----

file our_first_script

====
our_first_program: Bourne-Again shell script, ASCII text executable
====

nano our_first_script

----
#!/usr/bin/python3
----

file our_first_script

====
our_first_program: Python script, ASCII text executable
====

nano our_first_script

----
#!/bin/bash

echo "this is my first script"

exit 0

----


chmod +x our_first_script

ls 

./our_first_script

```

### What i learn

* All bash scripts have 3 core componenets:

	- The shebang line (#!/bin/bash)
	- Commands
	- Exit statement (0=successful; 1-255 = unsuccessful)
	
* You learned how to give scripts execute permissions with the chmod commands.


------------------------ 

<a name="four"></a>

## Writing Professional Comments

* how to write comment 

```bash

# 

```
* Learn How to add 5 pieces of professional information to your scripts

	1. The Author 
	2. Creation Date
	3. Last Modified Date
	4. Script Description
	5. Script Usage

* Test Example 

```bash 

#!/bin/bash

# Author: Alex Andra 
# Date Created: 27/Jun/2022
# Last Modification: 27/Jun/2022

# Description 
# Print "hello world"

# Usage: our_first_script


echo "hello world"

exit 0


```

---------------------- 

<a name="five"></a>

## How to take permission to the file

* Using chmod 

By default, go with 744 (rwxr--r--) or 754 (rwxr-xr--)

* Website to find know what is mean other number: 

	- https://www.coderstool.com/chmod-permissions-calculator

```bash 

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

```

-------------------------

<a name="six"></a>

### What you learn

* Read and interpret file permissions 

* Use chmod to change file permisions

* Recommended to use 744


* demo about backup

```bash 

#!/bin/bash 

# Author: Alex Andra
# Date created: 27/Jun/2022
# Last Modification: 27/Jun/2022

# Description:
# Creates a backup in ~bash_course folder of all files in the home directory

# Usage: backup_script

tar -cvf ~/Documents/test/bash/first_lesson/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar ~/* 2>dev/null

# tar -cvf ~/bash_course/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar ~/* 2>/dev/null

exit 0

```


```bash 

chmod 754 backup_file

./backup_file

```

----------------------------- 

<a name="seven"></a>

## MAKING YOUR SCRIPTS ACCESSIBLE FROM ANY FOLDER

```bash

# See the $PATH environment

echo $PATH       or       echo "$PATH"

# edit .profile

nano ~/.profile

# adding this line of path code

export PATH="$PATH:$HOME/Documents/test/bash/first_lesson"

export PATH="$PATH:/path/to/script_directory

# Reload the ~/.profile file

source ~/.profile

# move something to this directory that part of system path you can run any file in any folder if you just put this file in this directory 

mv my_script script_directory

# run your script in anywhere in anytime

my_script

```

### Summary

* The PATH variable tells the shell where jto search for executable files

* We can add folders to our PATH variable by modifying the .profile file

* We can make our scripts accessible system-wide by putting them into a folder covered by our PATH

	- Important note: Try to avoid giving your scripts names that may coinfict with another command on the system.