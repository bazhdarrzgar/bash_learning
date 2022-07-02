* [Table of Contents](#table-of-contents)
	- [Chaining Commands with List Operators](#first)
	- [Test Commands + Conditional Operators](#second)
	- [If Statements](#third)
	- [If Statements Part 2](#four)
	- [If Statements - Project Solution](#five)
	- [Case Statements](#six)
	- [Case Statements-Project Solution](#seven)


<a name="first"></a>

## Chaining Commands with List Operators

```bash

echo 123 & echo 456

===
# both of this is run because both of this operation is true

# remember the 456 is print first and after that 123 because & operator first check 123 if this true not print to the prompt check for the 456 if this is true then print 456 and go to the left for the 123 and print this also
[1] 7665
456
123
[1]+  Done                    echo 123
===




echo 123; echo 456

===
123
456
===



ls random_directory; echo 123

===
ls: cannot access 'random_directory': No such file or directory
123
===



echo 123 && echo 456

===
# double && operator is like & but fixt some issues that people not need to have like print in right to left this double && operator will print from left to right
123
456
===





ls random_directory && echo 456

===
# in double && operator if first operation and second operation is not true then print first result operation to the prompt
ls: cannot access 'random_directory': No such file or directory
===





ls random_directory && ls random_directory 

===
# in double && operator if first operation and second operation is not true then print first result operation to the prompt
ls: cannot access 'random_directory': No such file or directory
===




echo 123 && ls random_directory 

===
# in double && operator if second operation  operation is true and second operation is not true then print first and second result operation to the prompt
123
ls: cannot access 'random_directory': No such file or directory
===



ls random_directory || ls random_directory

===
# in or operator if eather first and second operation is not true then it will print both of this to the prompt
ls: cannot access 'random_directory': No such file or directory
ls: cannot access 'random_directory': No such file or directory
===




echo 123 || ls random_directory

===
# in or operator if first true and second not true the first print
123
===


ls random_directory || echo 123

===
# in or operator if first not true and second true then first and second will be print
ls: cannot access 'random_directory': No such file or directory
===


echo 123 || echo 456

===
# in or operator it should be on of the operation is true in this case echo 123 is come first and true then it will print to the prompt if not true then or go to the second operation if this is true print to the prompt 
123
===




ls random_directory && echo 123 || echo 456

===
# ( ls random_directory && echo 123 ) || echo 456
# this two in bracke work first and after that result this bracket will go demage with or operator
ls: cannot access 'random_directory': No such file or directory
456
===




#  run commandA if succefull run commandB if not run commandC
commandA && commandB || commandC

```

------------------- 

<a name="second"></a>

## Test Commands + Conditional Operators


```bash

# -eq 	    ( equal )
# -ne 		( not equal )
# -gt  		( greater than )
# -lt 		( less than )
# -geq 		( greater than or equal )
# -leq 		( less than or equal )
# -z        ( if variable is null is 0 if not 1 )
# -n        ( if variable is null is 1 if not 0 )
# -e 		( exist )
# -f 		( check if name is regular file )
# -d  		( check if name is regular folder )
# -x        ( check if file is exist and have excute permission )
# -r  		( checks if file is readable )
# -w        ( check if file is write )
# -nt       ( checks if file is newer than another file )


# echo $? = 0 ( if success )
# echo $? = 1 ( if not success )
[ 2 -eq 2 ]; echo $?

===
0
===




[ 1 -eq 2 ]; echo $?

===
1
===




[ 1 -ne 2 ]; echo $?

===
0
===




[ 2 -ne 2 ]; echo $?

===
1
===





a=hello

b=goodbye

[[ $a = $b ]]; echo $?

===
1
===


[[ $a != $b ]]; echo $?

===
0
===




# check if this variable is null or not null if null return 0 if not null return 1
[[ -z $c ]]; echo $?

===
0
===


c=hello

[[ -z $c ]]; echo $?

===
1
===


[[ -n $c ]]; echo $?

===
0
===




[[ -e today.txt ]]; echo $?

===
1
===


touch today.txt

[[ -e today.txt ]]; echo $?

===
0
===	




[[ -f hello.txt ]]; echo $?

===
1
===


touch hello.txt

[[ -f hello.txt ]]; echo $?

===
0
===





[[ -f hello ]]; echo $?

===
1
===


mkdir hello

[[ -f hello ]]; echo $?

===
0
===



[[ -x today.txt ]]; echo $?

===
1
===


touch today.txt

chmod 744

[[ -x today.txt ]]; echo $?

===
0
===

```

---------------------- 

<a name="third"></a>

## If Statements

```bash

#!/bin/bash

if [ 1 -eq 1 ]; then
	echo test passed

fi




./if

===
test passed
===

```


```bash

#!/bin/bash

if [ 2 -eq 1 ]; then
	echo test passed

else
	echo test failed

fi




./if

===
test failed
===

```


```bash

#!/bin/bash

if [ 2 -eq 1 ]; then
	echo test passed

elif [ 1 -eq 1 ]; then
	echo second test passed

else
	echo test failed

fi




./if

===
test failed
===

```

------------------- 

<a name="four"></a>

## If Statements Part 2

```bash

#!/bin/bash

a=$(cat file1.txt)
b=$(cat file2.txt)
c=$(cat file3.txt)

if [ $a = $b ] && [ $a = $c ]; then
	rm file2.txt file3.txt

else
	echo "File do not match"

fi




echo "Same" > file1.txt 
echo "Same" > file2.txt 
echo "Same" > file3.txt 


./if_combine

===
# file2.txt and file3.txt should be delete
===



echo "Same" > file2.txt
echo "Different" > file3.txt

./if_combine

===
File do not match
===

```


```bash

#!/bin/bash

a=$(cat file1.txt)
b=$(cat file2.txt)
c=$(cat file3.txt)

if [ $a = $b ] || [ $a = $c ]; then
	rm file2.txt file3.txt

else
	echo "File do not match"

fi





echo "Same" > file1.txt 
echo "Same" > file2.txt 
echo "Different" > file3.txt



./if_combine

===
# file2.txt and file3.txt should be delete
===



echo "Different_1" > file1.txt 
echo "Different_2" > file2.txt
echo "Different_3" > file3.txt

./if_combine

===
File do not match
===

```

---------------------- 

<a name="five"></a>

## If Statements - Project Solution

```bash

#!/bin/bash

if [ -d $HOME/Documents/test/bash/first_lesson/performance ]; then
	echo "$HOME/performance folder is exists"

else 
	mkdir $HOME/Documents/test/bash/first_lesson/performance
	echo "$HOME/Documents/test/bash/first_lesson/performance folder has been created"

fi

free >> $HOME/Documents/test/bash/first_lesson/performance/memory.log






./if_combine

===
/home/soyansoon/Documents/test/bash/first_lesson/performance folder has been created
===

cd performance

ls

===
memory.log
===

nano memory.log


===
 
 1               total        used        free      shared  buff/cache   available
 2 Mem:       16279348     2092416     9222012      378456     4964920    13468920
 3 Swap:       2097148           0     2097148

===



./if_combine

===
/home/soyansoon/Documents/test/bash/first_lesson/performance is exists
===

```

----------------- 

<a name="six"></a>

## Case Statements


```bash

#!/bin/bash

read -p "Please enter a number: " number

case "$number" in
	"") echo "You didn't enter anything!";;
	[0-9]) echo "you have entered a single digit number";;
	[0-9][0-9]) echo "you have entered a two digit number";;
	[0-9][0-9][0-9]) echo "you have entered a three digit number";;
esac




chmod 744 case_script

./case_script

===
Please entere a number: 1
you have entered a single digit number
===

./case_script

===
Please entere a number: 11
you have entered a two digit number
===

./case_script

===
Please entere a number: 111
you have entered a three digit number
===

./case_script

===
Please entere a number: 1111
===





#!/bin/bash

read -p "Please enter a number: " number

case "$number" in
	"") echo "You didn't enter anything!";;
	[0-9]) echo "you have entered a single digit number";;
	[0-9][0-9]) echo "you have entered a two digit number";;
	[0-9][0-9][0-9]) echo "you have entered a three digit number";;
	*) echo "you have entered a number that is more than three digits";;
esac

```

------------------

<a name="seven"></a>

## Case Statements-Project Solution

```bash

#!/bin/bash

select city in Tokyo London "Los Angeles" Moscow Dubai Manchester "New York" Paris Bangalore Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin;

do 
	case "$city"  in 
			Tokyo)
					country="Japan";;
			London|Manchester)
					country="United States";;
			Moscow)
					country="Russia";;
			Paris)
					country="France";;
			Bangalore|Pune)
					country="India";;
			Johannesburg)
					country="South Africa";;
			Istanbul)
					country="Turkey";;
			Milan)
					country="Italy";;
			Nairobi)
					country="Kenya";;
			Berlin)
					country="Germany";;
			Karachi)
					country="Pakistan";;
			Madrid)
					country="Spain";;
	esac

	echo "$city is in $country"
	break

done

```

