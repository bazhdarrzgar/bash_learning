* [Table of Contents](#table-of-contents)
	- [Setting the value of the variable](#first)
	- [ARAMETER EXPANSION TRICKS](#second)
	- [COMMAND SUBSTITUTION](#third)
	- [ARITHMETIC OPERATORS](#four)
	- [Using bc command](#four)


<a name="first"></a>

## Setting the value of the variable

$HOME 		Absolute path to the current user's home directory
$PATH 		List of directories that the shell should search for executable files
$USER 		The current user's username
$HOSTNAME 	The name of the current machine
$HOSTTYPE 	The current machine's CPU architecture
$PS1 		The terminal prompt string

<a name="second"></a>

## ARAMETER EXPANSION TRICKS

```

1. ${parameter^}

Convert the first character of the parameter to uppercase

2. ${parameter^^} 

Convert all characters of the parameter to uppercase

3. ${parameter,}

Convert the first character of the parameter to lowercase

4. ${parameter,,}

Convert all characters of the parameter to lowercase

5. ${#parameter}

Display how many characters the variable’s value contains

6. ${parameter : offset : length}

The shell will expand the value of the parameter starting at
character number defined by “offset” and expand up to a
length of “length”

EXAMPLE: ${1:-0}

<a name="third"></a>

## COMMAND SUBSTITUTION

* Syntax for command substitution

$(command)

* Syntax for Arithmetic Expansion

$(( expression ))

```

<a name="four"></a>

## ARITHMETIC OPERATORS

```
OPERATOR(S)			MEANING(S)		COMMENTS
```
	+ ( ) 

	+ Parentheses

	+ Anything placed in parentheses is given the highest precedence and is always run first.


------------


	+ ** 

	+ Exponentiation. 2**4 means 2 to the power of 4, which is 16


------------


	+ *, /, and % 

	+ Multiplication, Division, and Modulo.Modulo calculates the remainder of a division.

	+ These have the same precedence.


------------


	+ and -

	+ Addition and substraction

	+ These have the same precedence.


* Note: When two operators have the same precedence, the one furthest to the left gets performed first.

------------

<a name="five"></a>

## Using bc command

```bash

echo “expression” | bc

echo “scale=value; expression” | bc

```