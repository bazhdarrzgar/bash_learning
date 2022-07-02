* [Table of Contents](#table-of-contents)
	- [POSITIONAL PARAMETERS](#first)
	- [SPECIAL PARAMETERS](#second)
	- [THE READ COMMAND](#third)
	- [THE SELECT COMMAND](#four)

<a name="first"></a>

## POSITIONAL PARAMETERS

```bash

#!/bin/bash
echo “My Name is $1”
echo “My home directory is $2”
echo “My favourite colour is $3”

```

--------------------------

<a name="second"></a>

## SPECIAL PARAMETERS

```bash

echo "hello"

echo $?


===
0 ( because echo “hello” was successful )
===

```

--------------------------

<a name="third"></a>

## THE READ COMMAND

```bash

	-p “prompt”: Displays a prompt to user about what information they must enter

	-t time: Timeout if the user does not enter any value within time seconds.

	-s: Prevent the input that the user enters from being shown in the terminal. The “secret” option.
	
	-N chars: Limit the users response to exactly chars characters

  	-n chars: Limit the users response to a maximum of chars characters

```

```bash

#!/bin/bash
read -t 5 -p "Input your first name within 5 seconds: " name
read -n 2 -p "Input your age (max 2 digits): " age
read -s -N 5 -p "Enter your zip code (exactly 5 digits): " zipcode
echo "$name, $age, $zipcode" >> data.csv

```

--------------------------

<a name="four"></a>

## THE SELECT COMMAND

```bash

PS3="Please select an option below: "
select variable in options ; do
commands...
break
done

```


```bash

#!/bin/bash

PS3="What is the day of the week?: "
select day in mon tue wed thu fri sat sun ; do
echo "The day of the week is $day"
break
done

```
