* [Table of Contents](#table-of-contents)
	- [While Loops](#first)
	- [Handling Command Line Option](#second)
	- [While Loops - Project Solution](#third)
	- [Iterating over files read-while loops](#four)
	- [Read-While Loops - Project Solution](#five)

<a name="first"></a>

## While Loops

```bash

#!/bin/bash

read -p "Enter you number: " number

while [ $number -gt 10 ];

do
	echo $number is entered

	number=$(( $number - $number ))

done





./while_script

===
Enter you number: 22
22 is entered
===

```

```bash


#!/bin/bash

read -p "Enter you number: " number

while [ $number -gt 10 ];

do
	echo $number is entered

	number=$(( $number - -1 ))

done




./while_script

===
Enter you number: 22
22
21
20
19
18
17
16
15
14
13
12
11
===


```


-------------- 

<a name="second"></a>

## Handling Command Line Option

```bash

#!/bin/bash

while getopts "f:c:" opt; 

do
	case "$opt" in 

		c) result=$( echo "scale=2; ($OPTARG * (9 / 5)) + 32" | bc );;
		
		f) result=$( echo "scale=2; ($OPTARG - 32) * (5/9)" | bc );;
		
		\?);;

esac
done

echo "$result"





./while_script -f 32

===
0
===


./while_script -c 0

===
32.00
===

./while_script

===
# nothing will be print

===

```


------------------- 

<a name="third"></a>

## While Loops - Project Solution

```bash

#!/bin/bash

total_second=""

while getopts "m:s:" opt; 

do
	case "$opt" in 
		m) total_second=$(( $total_second + $OPTARG * 60 ));;
		s) total_second=$(( $total_second + $OPTARG ));;
		\?);;
esac
done

while [ $total_second -gt 0 ]; do
	echo "$total_second"
	total_second=$(( $total_second - 1 ))
	sleep 1s
done

echo "Time's up!"







./while_script -m 0 -s 0

===
Time's up!
===



./while_script -m 1

===
60
59
.
.
.
1
Time's up!
===



./while_script -s 5

===
5
.
.
.
1
Time's up!
===


./while_script -s 5 -m 1

===
65
64
.
.
.
1
Time's up!
===

```

------------------ 

<a name="four"></a>

## Iterating over files read-while loops

```bash

echo This is Line 1 >> file.txt
echo This is Line 2 >> file.txt
echo This is Line 3 >> file.txt

```

```bash

#!/bin/bash

while read line; 

do
	echo "$line"

done < "$1" # this is for number of the line





./while_script file.txt

===
This is Line 1
This is Line 2
This is Line 3
===

```

* wrong practic

```bash

#!/bin/bash

while read line < "$1"; 

do
	echo "$line"

done




./while_script file.txt

===
This is Line 1
This is Line 1
This is Line 1
This is Line 1
This is Line 1
^C
===
```

* some other trick

```bash

#!/bin/bash

while read line; 

do
	echo "$line"

done < <(ls $HOME)




./while_script

===
data.ms
Desktop
Documents
Downloads
.
.
.
VirtualBox VMs
===

```

```bash

#!/bin/bash

while read line; 

do
	echo "$line"

done < <(echo hello; echo world)




./while_script

===
hello
world
===

```

----------------- 

<a name="five"></a>

## Read-While Loops - Project Solution

```bash

# depedency for this project
cat folders_to_create.txt

===
Daily Reports
Weekly Reports
Monthly Reports
Current Project Files
Completed Project Files
Daily Financial Reports
Weekly Financial Reports
Monthly Financial Reports
Current Employee Files
Previous Employee Files
===

```

```bash

#!/bin/bash

while read line; 

do
	mkdir "$line"

done < "$1"




./while_pro folders_to_create.txt

===
'Completed Project Files'  'Current Project Files'    'Daily Reports'         'Monthly Financial Reports'  'Previous Employee Files'   'Weekly Reports'
'Current Employee Files'   'Daily Financial Reports'   folders_to_create.txt  'Monthly Reports'            'Weekly Financial Reports'   while_pro
===

```