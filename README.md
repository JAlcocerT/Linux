# SHELL ---

## Useful Shell commands


head -n 5 seasonal/winter.csv > top.csv
tail -n 3 top.csv

The pipe symbol tells the shell to use the output of the command on the left as the input to the command on the right:
head -n 5 seasonal/summer.csv | tail -n 3

cut -d , -f 2 seasonal/summer.csv | grep -v Tooth

#change Cherno to Cherno City in the given file
cat soccer_scores.csv | sed 's/Cherno/Cherno City/g' | sed 's/Arda/Arda United/g' > soccer_scores_edited.csv


grep '[pc]' fruits.txt
grep '[pc]' ^ fruits.txt #not contains p or c


cat two_cities.txt | egrep 'Sydney Carton|Charles Darnay' | wc -l #from the file specified, count the lines where those appeared

The command wc (short for "word count") prints the number of characters, words, and lines in a file. 
You can make it print only one of these using -c, -w, or -l respectively.


# wildcards
To make your life better, the shell allows you to use wildcards to specify a list of files with a single expression. The most common wildcard is *, which means "match zero or more characters". Using it, we can shorten the cut command above to this:

cut -d , -f 1 seasonal/*
or:

cut -d , -f 1 seasonal/*.csv

head -n 3 seasonal/s*

The shell has other wildcards as well, though they are less commonly used:

? matches a single character, so 201?.txt will match 2017.txt or 2018.txt, but not 2017-01.txt.
[...] matches any one of the characters inside the square brackets, so 201[78].txt matches 2017.txt or 2018.txt, but not 2016.txt.
{...} matches any of the comma-separated patterns inside the curly brackets, so {*.txt, *.csv} matches any file whose name ends with .txt or .csv, but not files whose names end with .pdf.

# sort lines of text
As its name suggests, sort puts data in order. By default it does this in ascending alphabetical order, but the flags -n and -r can be used to sort numerically and reverse the order of its output, while -b tells it to ignore leading blanks and -f tells it to fold case (i.e., be case-insensitive).
Pipelines often use grep to get rid of unwanted records and then sort to put the remaining records in order.

cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | sort -r

# uniq
Another command that is often used with sort is uniq, whose job is to remove duplicated lines. More specifically, it removes adjacent duplicated lines

# set
How does the shell store information?
Like other programs, the shell stores information in variables. Some of these, called environment variables, are available all the time. Environment variables' names are conventionally written in upper case


To get a complete list (which is quite long), you can type set in the shell.

Use set | grep HISTFILESIZE to get the line you need.
Use set | grep USER to get the line you need.

To get the variable's value, you must put a dollar sign $ in front of it. Typing

echo $USER

The other kind of variable is called a shell variable, which is like a local variable in a programming language.

To create a shell variable, you simply assign a value to a name:

training=seasonal/summer.csv
without any spaces before or after the = sign. Once you have done this, you can check the variable's value with:
echo $training

# loops

How can I repeat a command many times?
Shell variables are also used in loops, which repeat commands many times. If we run this command:

for filetype in gif jpg png; do echo $filetype; done

Notice these things about the loop:

The structure is for …variable… in …list… ; do …body… ; done
The list of things the loop is to process (in our case, the words gif, jpg, and png).
The variable that keeps track of which thing the loop is currently processing (in our case, filetype).
The body of the loop that does the processing (in our case, echo $filetype).

for filename in seasonal/*.csv; do echo $filename; done

# nano

f you type nano filename, it will open filename for editing (or create it if it doesn't already exist). You can move around with the arrow keys, delete characters using backspace, and do other operations with control-key combinations:

Ctrl + K: delete a line.
Ctrl + U: un-delete a line.
Ctrl + O: save the file ('O' stands for 'output'). You will also need to press Enter to confirm the filename!
Ctrl + X: exit the editor.

# save commands to rerun

You have been using the shell interactively so far. But since the commands you type in are just text, you can store them in files for the shell to run over and over again. To start exploring this powerful capability, put the following command in a file called headers.sh:

head -n 1 seasonal/*.csv
This command selects the first row from each of the CSV files in the seasonal directory. Once you have created this file, you can run it by typing:

bash headers.sh
This tells the shell (which is just a program called bash) to run the commands contained in the file headers.sh, which produces the same output as running the commands directly

# pass filenames to scripts


A script that processes specific files is useful as a record of what you did, but one that allows you to process any files you want is more useful. To support this, you can use the special expression $@ (dollar sign immediately followed by at-sign) to mean "all of the command-line parameters given to the script".

For example, if unique-lines.sh contains sort $@ | uniq, when you run:

bash unique-lines.sh seasonal/summer.csv
the shell replaces $@ with seasonal/summer.csv and processes one file. If you run this:

bash unique-lines.sh seasonal/summer.csv seasonal/autumn.csv
it processes two data files, and so on.


How can I process a single argument?
As well as $@, the shell lets you use $1, $2, and so on to refer to specific command-line parameters. You can use this to write commands that feel simpler or more natural than the shell's. For example, you can create a script called column.sh that selects a single column from a CSV file when the user provides the filename as the first parameter and the column as the second:

cut -d , -f $2 $1
and then run it using:

bash column.sh seasonal/autumn.csv 1

# How can I write loops in a shell script?
Shell scripts can also contain loops. You can write them using semi-colons, or split them across lines without semi-colons to make them more readable:

#Print the first and last data records of each file.
for filename in $@
do
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done



## Bash ---

Bash is a concise, superfast, and robust scripting language for data and file manipulation. It’s a vital skill for building analytics pipelines in the cloud, favored by Linux users to work with data stored across multiple files. In this course, we’ll guide you through the basics of Bash scripting. We begin with an introduction to Bash script structures, including inputting arguments and outputting results. You’ll then work through data structures, such as variables and arrays, and control statements, including loops and conditionals. You’ll then put what you’ve learned into practice, by creating your own Bash functions and scheduling automated scripts to run like clockwork with cron.


it normally starts by #!/usr/bash so that the interpreter knows that should go to /usr/bash
it could be a different path (check with: which bash)

if the she-bang is included, it can be run with: ./script_name.sh
if its not, with: bash script_name.sh

each line of the bash script can be a shell command -> pipes can be included in bash too


ARGV is the array of arguments given to the program
each argument can be accessed by $1...
$@ and $* give all the arguments in ARGV
$# gives the number of ARGVs



# shell within a shell

model1=87.65
model2=89.20
echo "total score is $(echo "$model1 + $model2" | bc)"
echo "average score is $(echo "($model1 + $model2) /2" | bc)"


#Get first ARGV into variable
temp_f=$1

#Subtract 32
temp_f2=$(echo "scale=2; $temp_f - 32" | bc)

#Multiply by 5/9 and print
temp_c=$(echo "scale=2; $temp_f2 * 5 / 9" | bc)

#Print the celsius temp
echo $temp_c




# creating an array in bash

declare -a my_first_array

create and add elements
my_first_array=(1 2 3)
echo ${my_first_array[@]} #return all the elements
echo ${#my_first_array[@]} count all the elements
echo ${my_first_array[0]}

my_first_array[0]=999 #change the first element value
echo ${my_first_array[@]:1:2} #return 2 elements from the 1st index


#append a value to the end an array
my_array+=(10)





# associative arrays:
like a normal array but with key-value pairs
similar to python's dictionaries or R's lists
available from bash 4
bash --version

declare -A city_details
city_details=([city_name]="New York" [population]=14000000)
echo $(city_details[city_name]}

#access the keys with !
echo $(!city_details[@}}


Associative arrays are powerful constructs to use in your Bash scripting. They are very similar to 'normal' arrays, however they have a few important differences in their creation, manipulation and key properties.

Associative arrays allow you to index using words rather than numbers, which can be important for ease of inputting and accessing properties. For example, rather than accessing 'index 4' of an array about a city's information, you can access the city_population property, which is a lot clearer!


#Create variables from the temperature data files
temp_b="$(cat temps/region_B)"
temp_c="$(cat temps/region_C)"

#Create an array with these variables as elements
region_temps=($temp_b $temp_c)

#Call an external program to get average temperature
average_temp=$(echo "scale=2; (${region_temps[0]} + ${region_temps[1]}) / 2" | bc)

#Append average temp to the array
region_temps+=($average_temp)

#Print out the whole array
echo ${region_temps[@]}


# conditions checking
if [ condition  ]; then
 #code
else
 #code
fi

x="Queen"
if [ $x =="King" ]; then
 echo "$x is a king!"
else
 echo "$x is not a king!"
fi

x=10
if [ $x > 5 ]; then
 echo "$x is more than 5"
fi


x=10
if [ $x -gt 5 ]; then
 echo "$x is more than 5"
fi

https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html

x=10
if [ $x -gt 5 ] && [ $x -lt 11 ]; then
 echo "$x is more than 5 and less than 11!"
fi

x=10
if [[ $x -gt 5  &&  $x -lt 11 ]]; then
 echo "$x is more than 5 and less than 11!"
fi

#q is quiet
if grep -q Hello words.txt; then
	echo "Hello is inside"
fi


