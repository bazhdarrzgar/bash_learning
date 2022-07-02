* [Table of Contents](#table-of-contents)
	- [WHILE LOOPS](#first)
		+ [Syntax for the getopts command](#sub_first)
		+ [Syntax for using the getopts command with a while loop and case statement](#sub_first_1)
		+ [ITERATING OVER THE CONTENTS OF FILES](#sub_first_2)
		+ [ITERATING OVER THE OUTPUT FROM COMMANDS](#sub_first_3)

<a name="first"></a>


## WHILE LOOPS

```bash

while condition; do
	commands...
done

```


```bash

#!/bin/bash

read -p "Enter your number: " num

while [ "$num" -gt 10 ]; 

do
	echo "$num"
	num=$(( "$num" - 1 ))

done

```

----------------------

<a name="sub_first"></a>

### Syntax for the getopts command

```bash

getopts "optstring:..:.." variable


# Example

getopts "A:" variable

getopts "A:B:" variable



./ourscript -A 10

===
result...
===

```

----------------------

<a name="sub_first_1"></a>

### Syntax for using the getopts command with a while loop and case statement

```bash

#!/bin/bash

while getopts "A:b" variable ; do
	
	case "$variable" in
		A)  commands;;
		b)  commands;;
		\?) commands;;
	
	esac
done

```


```bash

#!/bin/bash

while getopts "c:f:" opt ; 

do
	case "$opt" in

	c) # convert from celsius to farenheit
	result=$(echo "scale=2; ($OPTARG * (9 / 5)) + 32" | bc);;

	f) # convert from fahrenheit to celsius
	result=$(echo "scale=2; ($OPTARG - 32) * (5/9)" | bc);;
	\?) echo "Invalid option provided";;

	esac
done

echo "$result"


```

----------------------

<a name="sub_first_2"></a>

### ITERATING OVER THE CONTENTS OF FILES

```bash

while read line ; do

	commands...

done < file

```

```bash

#!/bin/bash

while read line ; do

	echo "$line"

done < file1.txt

```

----------------------

<a name="sub_first_3"></a>

### ITERATING OVER THE OUTPUT FROM COMMANDS


```bash

# Syntax for process substitution

<(command) # You can run one command...

<(command1 | command2 | ... | commandN) #... Or an entire pipeline

```

```bash

while read line; do

	commands...

done < <(command)

```


```bash

#!/bin/bash

while read line; do

	echo "$line"

done < <(ls $HOME)

```