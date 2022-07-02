* [Table of Contents](#table-of-contents)
	- [LIST OPERATORS](#first)
	- [TEST COMMANDS + CONDITIONAL OPERATORS](#second)
	- [Syntax for if statements](#third)
	- [IF STATEMENTS - COMBINING CONDITIONS](#four)
	- [CASE STATEMENTS](#five)

<a name="first"></a>

## LIST OPERATORS

```

- Operator 		- Example   	- Meaning


- &
- command1 & command2
- Sends command1 into a subshell to run “asynchronously” in the background, and continues to process command2 in the current shell.

--------------

- ;
- command1 ; command2
- Runs command1 and command2, i.e. one after the other. The shell will wait for command1 to complete before starting command2.

--------------

- &&
- command1 && command2
- The “and” operator. The shell will only run command2 if command1 is successful (i.e. returns an exit code of 0).

--------------

- ||
- command1 || command2
- The “or” operator. The shell will only run command2 if command1 is un successful (i.e. returns a non-zero exit code).

```

------------------

<a name="second"></a>

## TEST COMMANDS + CONDITIONAL OPERATORS


```bash


OPERATOR       |    EXAMPLE 		|   MEANING


-eq    [ 2 -eq 2 ]   Successful if the two numbers are equal

-ne    [ 2 -ne 2 ]   Successful if the two numbers are not equal

=     [ $a = $b ]     Successful if the two strings are equal

!=    [ $a != $b ]   Successful if the two strings are not equal

-z    [ -z $c ]      Successful if a string is empty

-n    [ -n $c ]      Successful if a string is not empty

-e    [ -e /path/to/file ]        Successful if a file system entry /path/to/file exists

-f    [ -f /path/to/file ]        Successful if a file system entry /path/to/file exists and is a regular file

-d    [ -d /path/to/file ]        Successful if a file system entry /path/to/file exists and is a directory

-x    [ -x /path/to/file ]           Successful if a file system entry /path/to/file exists and is executable by the current user

```

-----------------

<a name="third"></a>

## Syntax for if statements

```bash

if test1 ; then
Commands... # only run if test1 passes

elif test2 ; then
	Commands... # only run if test1 fails and test2 passes

elif testN ; then
	Commands... # only run if all previous tests fail, but testN passes

else
	Commands... # only run if all tests fail

fi




#!/bin/bash

read -p "Please enter a number" number

if [ $number -gt 0 ] ; then
	echo "Your number is greater than 0"

elif [ $number -lt 0 ] ; then
	echo "Your number is less than 0"

else
	echo "Your number is 0!"

fi

```

-----------------

<a name="four"></a>

## IF STATEMENTS - COMBINING CONDITIONS

```bash

#!/bin/bash

a=$(cat file1.txt) # "a" equals contents of file1.txt
b=$(cat file2.txt) # "b" equals contents of file2.txt
c=$(cat file3.txt) # "c" equals contents of file3.txt

if [ "$a" = "$b" ] && [ "$a" = "$c" ] ; then
	rm file2.txt file3.txt

else
	echo "File1.txt did not match both files"

fi






#!/bin/bash
a=$(cat file1.txt) # "a" equals contents of file1.txt
b=$(cat file2.txt) # "b" equals contents of file2.txt
c=$(cat file3.txt) # "c" equals contents of file3.txt
if [ "$a" = "$b" ] || [ "$a" = "$c" ]; then
	rm file2.txt file3.txt

else
	echo "File1.txt did not match either file"

fi

```

------------------

<a name="five"></a>

## CASE STATEMENTS

```bash

case "$variable" in # don't forget the $ and the double quotes!

	pattern1)
	Commands ...
;;
	pattern2)
	Commands ...
;;
	patternN)
	Commands ...
;;
	*)
	Commands ... # run these if no other pattern matches
;;

esac





#!/bin/bash

read -p "Please enter a number: " number

case "$number" in
	
	"") echo "You didn't enter anything!"
	[0-9]) echo "you have entered a single digit number" ;;
	[0-9][0-9]) echo "you have entered a two digit number" ;;
	[0-9][0-9][0-9]) echo "you have entered a three digit number" ;;
	*) echo "you have entered a number that is more than three digits" ;;

esac

```
