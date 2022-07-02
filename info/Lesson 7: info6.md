* [Table of Contents](#table-of-contents)
	- [Working with Indexed Arrays](#first)
	- [Expanding An Array](#second)
	- [MODIFYING AN ARRAY](#third)
	- [THE READARRAY COMMAND](#four)
	- [ITERATING OVER ARRAYS WITH FOR LOOPS](#five)


<a name="first"></a>

## Working with Indexed Arrays

```bash

array=(element1 element2 element3 ... elementN)


# Example
numbers=(1 2 3 4)

```

--------------------

<a name="second"></a>

## Expanding An Array


```bash

- Expansion   	- Description 		- Result




- ${array}

- Gives the first element of an array

- 1


-------------


- ${array[@]}

- Expands to all the elements of an array

- 1 2 3 4 5


-------------


- ${!array[@]}

- Expands to all the index numbers of all the elements of an array

- 0 1 2 3 4


-------------


- ${array[@]:offset}   E.g.  ${array[@]:2}

- So, in this example, we would start at index 2, which is the number 3. Starts at the index specified by offset rather
than at index 0, and then continue until the
end of array[@].

- 3 4 5


-------------


- ${array[@]: -2}
 
- We can also provide negative offsets. In this example, we will start two elements from the end, which is the number 4. Note: You must have a space after the and before the “-”.

- 4 5


-------------


- ${array[@]:offset:length}  E.g.  ${array[@]:2:2}

- Skips the first offset elements, and continues until the whole length of the array is length So, in this example, we would skip the first 2 elements, and continue until we had a total of 2 elements.

- 3 4


```

-------------

<a name="third"></a>

## MODIFYING AN ARRAY

```bash

- Operation 		- Description 	 	- Result



- array+=(6) 

- Appends 6 to the end of array 

- array becomes (1 2 3 4 5 6)




- array+=(a b c) 

- Appends (a b c) to the end of array 

- array becomes (1 2 3 4 5 a b c)




- unset array[2] 

- Removes the specified element from the array. In this example the element at index 2 will be removed Note: Index numbers do not update automatically, so this will create a gap in the indexes!

- array becomes (1 2 4 5 6)




- array[0]=100

- Changes the value element of the array. of a specific In this example the element with index 0 will become 100

- array becomes (100 2 3 4 5 6)


```

-------------------

<a name="four"></a>

## THE READARRAY COMMAND

```bash

readarray -t arrayname < file

## Example
readarray -t days < days.txt

```

```bash

<(command) # You can run one command...
<(command1 | command2 | ... | commandN) #... Or an entire pipeline

```

```bash

readarray -t arrayname < <(command)

## Example
readarray -t files < <(ls ~/Documents)

```

------------------

<a name="five"></a>

## ITERATING OVER ARRAYS WITH FOR LOOPS

```bash

for <variable> in value1 value2 value3; do
	commands...
done

```

```bash

#!/bin/bash

for element in first second third; do
	echo "This is $element"
done

```

* forloop syntax (with array):

```bash

for element in "${array[@]}"; do
	commands...
done

```

```bash

#!/bin/bash

readarray -t files < file_list.txt

for file in "${files[@]}"; do
	if [ -f "$file" ]; then
		echo "$file already exists"
	else
		touch "$file"
		echo "$file was created"
	fi
done

```
