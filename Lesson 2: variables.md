* [Table of Contents](#table-of-contents)
	- [Variable](#first)
	- [Shell Variable](#second)
	- [Parameter Expansion Tricks](#third)
	- [Time command](#four)
	- [Small Project](#five)
	- [Arithmatic Expansion](#six)
	- [bc Command](#seven)
	- [Tilde Expansion ( ~ )](#eight)
	- [Barce Expansion { }](#nine)

<a name="first"></a>

## Variable

```bash 

#!/bin/bash

# A sign variable to a value
student="Sara"

# using references key to call the variable value
echo "Hello ${student}"

```

### Summary

* Three Key Points:

1. A parameter is an entity that can store values

	- Variable ( most common )
	- Positional parameter
	- Special parameter

2. Creating a variable: name=value (no spaces around = sign! )

3. Retrieving a value: ${parameter}


---------------------------- 

<a name="second"></a>

## Shell Variable

* Some common variable use by bash to reference something in your computer:

```bash

# PATH environment
echo $PATH

# Home directory
echo $HOME

# current user for your computer
echo $USER

# name your computer
echo $HOSTNAME

# name of process artichture
echo $HOSTTYPE

# The PS1 variable contains the prompt string show in the terminal before each command
echo $PS1

```

* you can modifey any of the variable by just using:

NameVariable="$: "

```bash

# example

PS1="$: "

# to reload the environment variable for all this variable

source ~/.bashrc

```

---------------------------- 

<a name="third"></a>

## Parameter Expansion Tricks

* Deal with small case

```bash

name=ALEX

echo $name 

===
ALEX
===

echo ${name}

===
ALEX
===

echo ${name,}

===
aLEX
===

echo ${name,,}

===
alex
===

```

* Deal with Uppercase

```bash

echo $USER

===
soyansoon
===

echo ${USER}

===
soyansoon
===

echo ${USER^}

===
Soyansoon
===

echo ${USER^^}

===
SOYANSOON
===

```

* Dealing with length

```bash 

# get length of variable
echo ${#USER}

echo number=0123456789

echo ${number:0:7}

===
0123456
===

echo ${number:3}

===
3456789
===

echo ${number:3:} # by default with be 0 if you don't type anything for other option

===
# nothing will be output
===

* note if you are using negative you should have space between ( : and number )
echo ${number: -3:2}

===
# 0 1 2 3 4 5 6 7 8 9 
#  0   1  2  3  4  5  6  7  8  9 # positive (left to right)
# -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 # negative (right to left)
87
===

echo ${number: -3}

===
# 0 1 2 3 4 5 6 7 8 9 
#  0   1  2  3  4  5  6  7  8  9 # positive (left to right)
# -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 # negative (right to left)
789
===

```


------------------------- 

<a name="four"></a>

## Time command

```bash

#!/bin/bash

# the bracket should be this ()
time=$(date +%H:%M:%S) # lower case or upper case not problem
time=$(date +%D:%M:%Y) # lower case or upper case not problem

echo ${time}

echo "$time"

echo $time

echo ${ttime}

echo "$ttime"

echo $ttime

```

------------------------- 

<a name="five"></a>

## Small Project

```bash 

#!/bin/bash 

# Author: Alex
# Created: 28/Jun/2022
# Last Modification: 28/Jun/2022

# Description
# Create backup_using bash 

# Usage: backup_script

echo "Hell ${USER^}"

echo "I will no backup your home directory, $HOME"

currentdir=$(pwd)

echo "You are running this script from $currentdir"

echo "Therefore, I will save the backup in $currentdir"

tar -cf ~/Documents/test/bash/backup_"$(date +%d-%m-%y_%h-%m-s)".tar $HOME/Documents/Trash/* 2>/dev/null

# tar -cf [PATH OF THIS PLACE THAT YOU SAVE BACKUP]/[NAME THE BACKUP].tar [PATH THIS PLACE THAT YOU WANT MAKE BACKUP]/* 2>/dev/null

echo "Backup Complete Successfuly"

exit 0

```

----------------------- 

<a name="six"></a>

## Arithmatic Expansion

```bash

#!/bin/bash 

echo $(( 1 + 2 ))
echo $(( 1 - 2 ))
echo $(( 1 * 2 ))
echo $(( 1 / 2 ))
echo $(( 1 % 2 ))

echo $(( (1 + 2) * 3 ))

x=1

y=2

echo $(( $x + $y * 3 ))

echo $(( ($x + $y) * 3 ))

echo $(( 4 ** 2 ))  ## using power ( 4^2 )

# if you want use (.) or get point number you should use (bc) calculater

echo $(( 5 / 2 ))   ## you don't get 2.5 because bash not understand what ( . ) mean

echo $(( 5 / 2 )) | bc

echo $(( 2.5 / 2  ))   ## you will get error because bash not understand what ( . ) mean

echo $(( 2.5 / 2  )) | bc

```

-------------------- 

<a name="seven"></a>

## bc Command

```bash 

# run bc to do simple calculation
bc 

# to get the point you should use scale

echo "5/2" | bc 

echo "scale=2; 5/2" | bc 

echo "scale=10; 5/2" | bc 

echo "2.5 /2" | bc

echo "scale=2; 2.5 /2" | bc 

```

## Summary

* The syntax for the bc command is: echo "expression" | bc

* you use the scale variable to control the number of decimal places that are included in the output

* for example, echo "scale=5; 10/3" | bc

* Note: Exponentiation syntax is different: a ^ b rather than a ** b

--------------------- Lesson 7

<a name="eight"></a>

## Tilde Expansion ( ~ )

```bash

echo ~

===
/home/soyansoon
===

echo ~other_user_if_you_have

===
/home/other_user_if_you_have
===

echo ~root  # root user

===
/root
===

echo ~abcd_wrong_user

===
~abcd_wrong_user
===

pwd

===
/home/soyansoon/Documents/test/bash/first_lesson
===

echo $PWD

===
/home/soyansoon/Documents/test/bash/first_lesson
===

echo $OLDPWD

===
/home/soyansoon/Documents/test/bash
===

cd ~-   # go to previous directory that is you are in in the first time like for example i am go to this directory ( /home/soyansoon/Documents/test/bash/first_lesson ) from  ( /home/soyansoon ) in first time i game with this two directory by using cd ~-
===
/home/soyansoon
===

cd ~-    # in second time you will go to the previous directory that you currenty before you have 

===
/home/soyansoon/Documents/test/bash/first_lesson
===

```

---------------------- Lesson 14

<a name="nine"></a>

## Barce Expansion { }

```bash

echo {a,b,c,barrayberbary,alex,123}

===
a b c barrayberbary alex 123
===

echo {jan,fab,mar,apr,mar,apr,..}

===
jan fab mar apr mar apr ..
===

```

* you will get an error if you are using space in anywhere inside Brace Expansion

```bash

echo {jan,fab,mar,apr,mar, apr,..}

===
{jan,fab,mar,apr,mar, apr,..}
===

echo { jan,fab,mar,apr,mar,apr,..}

===
{ jan,fab,mar,apr,mar,apr,..}
===

echo {alex andra,fab,mar,apr,mar, apr,..}

===
{alex andra,fab,mar,apr,mar, apr,..}
===

```

* same trick you can use with Brace Expansion

```bash

echo {1,2,3,4,5,6,7,8,9,10}

===
1 2 3 4 5 6 7 8 9 10
===

echo {1..10}

===
1 2 3 4 5 6 7 8 9 10
===

echo {10..1}

===
10 9 8 7 6 5 4 3 2 1
===

echo {a..z}

===
a b c d e f g h i j k l m n o p q r s t u v w x y z
===

echo {1..100}

===
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100
===

echo {1..100..3} # this 3 mean every number between 1 to 100 should have 3 number between it before reach to 100

===
1 4 7 10 13 16 19 22 25 28 31 34 37 40 43 46 49 52 55 58 61 64 67 70 73 76 79 82 85 88 91 94 97 100
===

```

* this trick that is not in the list

```bash

echo {1..q}

===
{1..q}
===

echo {jan..dec}

===
{jan..dec}
===

```

* some other trick it can be usefull for creating file for folder

```bash

echo month{1..12}

===
month1 month2 month3 month4 month5 month6 month7 month8 month9 month10 month11 month12
===

echo month{01..12}

===
month01 month02 month03 month04 month05 month06 month07 month08 month09 month10 month11 month12
===

mkdir month{01..12}

ls 

===
month01  month03  month05  month07  month09  month11
month02  month04  month06  month08  month10  month12
===

```

```bash

* note to use this you should create folder month from 01 to 12 for that use (   mkdir month{01..12}    )

touch month{01..12}/day{01..31}.txt  # move every file to specific folder for month and every folder have 01 to 31 file that is .txt

touch month{01..12}/day{01..31}  # move every folder to specific folder for month and every folder have 01 to 31 folder 

```

