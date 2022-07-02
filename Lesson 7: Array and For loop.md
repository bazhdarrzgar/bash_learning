* [Table of Contents](#table-of-contents)
	- [Working with indexed Arrays](#first)
	- [The readarray command](#second)
	- [Working with for loop](#third)
	- [For loops + Arrays Project - Solution](#four)

<a name="first"></a>

## Working with indexed Arrays

* some basic

```bash

numbers=(1 2 3 4 )

# call index by default it will call index 0
echo $numbers

===
1
===

# calling index
echo ${numbers[2]}

===
3
===

# calling all index
echo ${numbers[@]}

===
1 2 3 4
===

# calling just index

echo ${!numbers[@]}

===
0 1 2 3
===

```

* calling in professional way

```bash

numbers=(1 2 3 4)

# calling index but start in index 1
echo ${numbers[@]:1}

===
2 3 4
===

# calling index but start in index 1 and end in index 2
echo ${numbers[@]:1:2}

===
2 3
===

```

* add and delete

```bash

numbers=(1 2 3 4)

# adding element
numbers+=(5)

echo ${numbers[@]}

===
1 2 3 4 5
===


# delete element
unset numbers[2]

echo ${numbers[@]}

===
1 2 4 5
===

# when you delete element the index also delete it
echo ${!numbers[@]}

===
0 1 3 4
===



numbers[0]=a 

echo ${numbers[@]}

===
a 2 4 5
===


```


----------------

<a name="second"></a>

## The readarray command

```bash

cat days.txt

===
Monday
Tuesday
Wendnesday
Thursday
Friday
Saturday
Sunday
===

readarray days < days.txt

echo $days

===
Monday Tuesday Wendnesday Thursday Friday Saturday Sunday
===

echo ${!days[@]}

===
0 1 2 3 4 5 6
===

echo ${days[@]@Q}

===
$'Tuesday\n' $'Wendnesday\n' $'Thursday\n' $'Friday\n' $'Saturday \n' $'Sunday\n'
===


readarray -t days < days.txt

===
'Monday ' 'Tuesday ' 'Wendnesday ' 'Thursday ' 'Friday ' 'Saturday ' 'Sunday'
===


```

* wrong practic

```bash

cat days.txt

===
Monday Tuesday Wendnesday Thursday Friday Saturday Sunday
===

readarray -t days < days.txt

echo ${days[@]}

===
Monday Tuesday Wendnesday Thursday Friday Saturday Sunday
===

echo ${days[@]}

===
0 1 2 3 4 5 6
===

# bad thing all in one single quotes
echo ${days[@]}

===
'Monday Tuesday Wendnesday Thursday Friday Saturday Sunday'
===


```

* some other trick with calling array and readarray

```bash

mkdir array

cd array/

touch file{001..100}.txt

ls 

===
file001.txt ... file100.txt
===


# getting full path of the file
ls ~/Documents/test/bash/first_lesson/array/*

===
/home/soyansoon/Documents/test/bash/first_lesson/array/file001.txt
.
.
.
/home/soyansoon/Documents/test/bash/first_lesson/array/file100.txt
===


readarray files < <(ls ~/Documents/test/bash/first_lesson/array)

echo ${files[@]}

===
file001.txt ... file100.txt
===


echo ${!files[@]}

===
0 .. 99
===


echo ${files[@]@Q}

===
$'file001.txt\n' ... $'file100.txt\n'
===

# good practic
readarray -t files < <(ls ~/Documents/test/bash/first_lesson/array)

echo ${files[@]@Q}

===
'file001.txt' ... 'file100.txt'
===


```


--------------- 

<a name="third"></a>

## Working with for loop

```bash

#!/bin/bash

for element in first second third;

do
	echo 'This is $element element'

done




./for_loop.sh

===
This is first element
This is second element
This is third element
===

```

* small small project with for loop

```bash

cat files.txt

===
report1.txt
report2.txt
report3.txt
report4.txt
report5.txt
===

```

* creating file using for loop 

```bash

#!/bin/bash

readarray -t file < files.txt

for for_file in "${file[@]}"; 

do
	touch "$file"

	
	# you can also use this technic because it is already data is put into (for_file) variable for loop

	# touch "$for_file"

done



./for_loop

ls

===
report1.txt report2.txt report3.txt report4.txt report5.txt files.txt for_loop
===

```


* edit my small project project

```bash

#!/bin/bash

readarray -t file < files.txt

# this is how we can put data array into for loop
for for_file in "${file[@]}"; 

do
	if [ -f "$for_file" ]; then
		echo "$for_file is already exists"
	else
		touch "$for_file"
		echo "$for_file was created successfully"
	fi

done




./for_loop

===
report1.txt was created successfully
report2.txt was created successfully
report3.txt was created successfully
report4.txt was created successfully
report5.txt was created successfully
===

./for_loop

===
report1.txt is already exists
report2.txt is already exists
report3.txt is already exists
report4.txt is already exists
report5.txt is already exists
===


```


------------------- 

<a name="four"></a>

## For loops + Arrays Project - Solution

* Note: this is require internet

```bash

cat urls.txt

===
www.google.com
www.udemy.com
www.gmail.com
www.facebook.com
www.yahoo.com
www.twitter.com
www.youtube.com
www.wikipedia.com
www.amazon.com
www.netflix.com
www.instagram.com
www.ubuntu.com
www.microsoft.com
===

```

* project solution for creating file and put this file header information of website

```bash

#!/bin/bash

readarray -t urls < urls.txt

for for_url in "${urls[@]}";

do
	# cutting any name that before ( . and after . ) using cut -d "specify the value" number_of_value_you_want_delete_in_sample using ( -f ) and follow by ( number)
	webname=$(echo $for_url | cut -d "." -f 2)

	# curl basic information header using ( --head ) for this url we have and put it in file name is "$webname.txt" for each link we have
	curl --head "$for_url" > "$webname".txt

done






./for_loop

===
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: www.google.com
.
.
.
.
.
===




ls 

===
amazon.txt    for_loop   google.txt     microsoft.txt  twitter.txt  udemy.txt  wikipedia.txt  youtube.txt
facebook.txt  gmail.txt  instagram.txt  netflix.txt    ubuntu.txt   urls.txt   yahoo.txt
===




cat udemy.txt

===
HTTP/1.1 301 Moved Permanetly
Date: Wed, 03 Feb 2021 23:..
.
.
.
.
.
Server: cloudflare
===

```