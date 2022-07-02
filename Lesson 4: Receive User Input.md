* [Table of Contents](#table-of-contents)
	- [Positional Parameters](#first)
	- [Positional Parameters](#second)
	- [Special Parameters](#third)
	- [Special Parameters Part 2](#four)
	- [Project Solution for creating calculate program](#five)
	- [The read command](#six)
	- [Read Command - Project Solution](#seven)
	- [The Select Command](#eight)
	- [Select Command Project Solution](#nine)

<a name="first"></a>

## Positional Parameters

```bash

#!/bin/bash

echo "My name is $1"
echo "My home directory is $2"
echo "My favourite color is $3"
echo "The 10th argument is ${10}"
# if you use two number or more it should be insdie double bracket    ${number}
echo "The 11th argument is $11"
echo "The 11th argument is ${11}"

===
# input: ./script_test a b c d e f l h i j k 
My name is a
My home directory is b
My favourite color is c
The 10th argument is j
The 11th argument is a1
The 11th argument is k
===

```

--------------- 

<a name="second"></a>

## Positional Parameters

```bash

#!/bin/bash

echo $(( ${2:-0} $1 ${3:-0} $1 ${4:-0} $1 ${5:-0} $1 ${6:-0} $1 ${7:-0} $1 ${8:-0} $1 ${9:-0} $1 ${10:-0} ))

===
# input: ./calculator + 5 5 5 7
22
===

```

--------------- 

<a name="third"></a>

## Special Parameters

* ( $# ) calculate the length of the input 

* ( $0 ) detect what file you are in it right now

```bash

#!/bin/bash

echo "My name is $1"
echo "My home directory is $2"
echo "My favourite color is $3"
echo "The 10th argument is ${10}"
# if you use two number or more it should be insdie double bracket    ${number}
echo "The 11th argument is $11"
echo "The 11th argument is ${11}"

echo $#

===
# input: ./script_test a b c d e f j h i j k
My name is a
My home directory is b
My favourite color is c
The 10th argument is j
The 11th argument is a1
The 11th argument is k
11
===

```

```bash

echo $0

===
bash
===

```

```bash

#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "You didn't enter exactly 2 parameters"
	echo "Usage: $0 <file1> <file2>"
	exit 1

fi

===
# input: ./logic file1 file2 file3

# you now see it take you file name you are used and you can use $# with if statement
You didnt enter exactly 2 parameters
Usage: ./logic <file1> <file2>
===

===
# ./logic file1 file2
# nothing will print
===

mv logic logic_new

./logic_new file1 file2 file3

===
# you are now see the file Usage is change
You didnt enter exactly 2 parameters
Usage: ./logic_new <file1> <file2>
===

```

--------------- 

<a name="four"></a>

# Special Parameters  Part 2

```bash

#!/bin/bash

echo $@

```

```bash

./@@@ 1 2 3 4 5

===
# split the number because it has space between it
1 2 3 4 5
===

./@@@ 1,2,3,4,5

===
# not split the number because it does not have space between it
1,2,3,4,5
===

./@@@ "hello world" hi

===
# split the word because it has space between word this is not take care if the word between double Quotes or single Quotes
hello world hi
===

```

```bash

#!/bin/bash

touch $@

```


```bash

./@@@ "hello world" hi 

===
hello world hi
===

./@@@ 1 2 3 4 5

===
1 2 3 4 5
===

./@@@ 1,2,3,4,5

===
1,2,3,4,5
===

```





* "$@" is like $@ but accept double quotes

```bash

#!/bin/bash

echo "$@"

```

```bash

touch ./@@@ "hello world" hi 

===
hi  'hello world'
===

```




* $* is like $@ but "$*" is different from "$@" and $@ because $* accept IFS variable changin but "$@" and $@  not accept that

```bash

#!/bin/bash

IFS=,

touch "$*"

```

```bash

./@@@ 1 2 3

===
1,2,3
===

```

--------------- 

<a name="five"></a>

# Project Solution for creating calculate program

```bash

#!/bin/bash

echo $(( $@ ))


./calculator

===
# you are free to take any input with very good usablity

./calculator 5+5

===
10
===

./calculator 5*5

===
25
===

./calculator 5/5

===
1
===

./calculator 5%5

===
0
===

./calculator 5-5

===
0
===

```

------------------- 

<a name="six"></a>

## The read command

```bash

read input1 input2

hello goodbye

echo input1

===
hello
===

echo input2

===
goodbye
===

read

hello

echo $REPLY

===
hello
===

```

```bash

#!/bin/bash

read name age town

echo "My name is $name"
echo "I am $age"
echo "I am from $town"



./read

===
alex 32 london

My name is alex
I am 32
I am from london
===

```

```bash

#!/bin/bash

# ( -p ) means promp means display this to the prompt means terminal
read -p "Input your first name: " name
read -p "Input your age: " age
read -p "Input the town you are from: " town

echo

echo "My name is $name"
echo "I am $age"
echo "I am from $town"

===
Input your first name: alex
Input your age: 23
Input the town you are from: london

My name is alex
I am 23
I am from london
===

```

```bash

#!/bin/bash

# ( -t ) means this time that prompt take user to input something if not input anything by default input nothing
read -t 5 -p "Input your first name: " name
echo
read -t 5-p "Input your age: " age
echo
read -t 5-p "Input the town you are from: " town

echo

echo "My name is $name"
echo "I am $age"
echo "I am from $town"

===
Input your first name: 
Input your age: 
Input the town you are from: 
My name is 
I am 
I am from 
===

```

```bash

#!/bin/bash

# -s means type in secret means the word or character or number will not display in terminal just type it inside variable
read -s -t 5 -p "Input your first name: " name
echo
read -s -t 5-p "Input your age: " age
echo
read -s -t 5-p "Input the town you are from: " town

echo
echo

echo "My name is $name"
echo "I am $age"
echo "I am from $town"

===
Input your first name: 
Input your age: 
Input the town you are from: 

My name is alex
I am 32
I am from london
===

```

----------------- 

<a name="seven"></a>

## Read Command - Project Solution

```bash

#!/bin/bash

read -p "What is your first name?: " firstname

echo

read -p "What is your last name?: " lastname

echo

read -N 4 -p "What is your current extension number? (must be 4 digits): " ext 

echo

read -N 4 -s -p "What access code would you like to use? (must be 4 digits): " access

echo

echo "$firstname,$lastname,$ext,$access" >> extension.csv





chmod 755 test_t

./test_t

===
What is your first name?: hello

What is your last name?: world

What is your current extension number? (must be 4 digits): 3232
What access code would you like to use? (must be 4 digits): 
===

cat extension.csv

===
hello,world,3232,2323
===

```

----------------- 

<a name="eight"></a>

## The Select Command

```bash

#!/bin/bash

select day in mon tue wed thu fri sat sun;

do
	echo "This is day of the week $day"
done





./test_s

===
1) mon
2) tue
3) wed
4) thu
5) fri
6) sat
7) sun
#? 1
This is day of the week mon
#? 2
This is day of the week tue
#? 3
This is day of the week wed
#? 4
This is day of the week thu
#? ^C
===

```

```bash

#!/bin/bash

select day in mon tue wed thu fri sat sun;

do
	echo "This is day of the week $day"
	break
done





./test_s

===
1) mon
2) tue
3) wed
4) thu
5) fri
6) sat
7) sun
#? 1
This is day of the week mon
===

```


```bash

#!/bin/bash

PS3="What is the day of the week ?: "
select day in mon tue wed thu fri sat sun;

do
	echo "This is day of the week $day"
	break
done





./test_ss

===
1) mon
2) tue
3) wed
4) thu
5) fri
6) sat
7) sun
What is the day of the week ?: 2
This is day of the week tue
===

```

----------------- 

<a name="nine"></a>

## Select Command Project Solution

```bash

#!/bin/bash

read -p "What is your first name?: " firstname

echo

read -p "What is your last name?: " lastname

echo




PS3="What type of phone do you have ?: "

select phone in headset handheld;
do
	echo "You are choose $phone"
	break
done

echo

PS3="What department do you work in ?: "

select department in finance sales engineering "customer service";
do
	echo "You are choose $department"
	break
done

echo




read -N 4 -p "What is your current extension number? (must be 4 digits): " ext 

echo

read -N 4 -s -p "What access code would you like to use? (must be 4 digits): " access

echo

echo "$firstname,$lastname,$ext,$access" >> extension.csv





chmod 755 test_t

./test_t

===
What is your first name?: hello

What is your last name?: world

1) headset
2) handheld
What type of phone do you have ?: 2
You are choose handheld

1) finance
2) sales
3) engineering
4) customer service
What department do you work in ?: 3
You are choose engineering

What is your current extension number? (must be 4 digits): 2223
What access code would you like to use? (must be 4 digits): 
===


cat extension.csv

===
hello,world,2223,3332
===

```