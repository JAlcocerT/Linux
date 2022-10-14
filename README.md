Web version on [https://jalcocert.github.io/Linux/]

### Available programs to install from the bash file

FOSS -> :heavy_check_mark:

* General:
    * Synaptic  :heavy_check_mark:
    * PPA GUI Manager :heavy_check_mark:
    * Snap store :heavy_check_mark:
    
* Media:
    * VLC :heavy_check_mark:
    * Spotify
    
* Browsers:
    * Brave 
    * Librewolf :heavy_check_mark:
    * Chrome
    
* Design
    * Blender :heavy_check_mark:
    * FreeCad :heavy_check_mark:
    * OpenSCad :heavy_check_mark:
    * GIMP :heavy_check_mark:
    * Photoscape :heavy_check_mark:
    * Cura
    * Inkscapee
    * KiCad
    * Kazam :heavy_check_mark:
    * Audacity
    
* Programming:
   * Octave :heavy_check_mark:
   * VSCode
   * Flutter
   * Android Studio
   * RStudio :heavy_check_mark:
   * GH Desktop
   * Slack
   
* Gaming:
    * Steam
    * WINE :heavy_check_mark:
    * Lutris :heavy_check_mark:
    * Epic Games
    * origin
    
* BackUps:
   * Dropbox
   * MegaSync
   * NextCloud :heavy_check_mark:
   * Timeshift :heavy_check_mark:
   * Synkron
   * Grsync
* Others:
   * VBOX
   * VMWare
   * VNC Server :heavy_check_mark:
   * GUFW :heavy_check_mark:
   * VPN 
   * UnetBootin :heavy_check_mark:
   
    

Start
```
curl https://raw.githubusercontent.com/reisikei/Linux/main/Ubuntu%20installations%20bash > install-apps.sh && chmod 775 install-apps.sh && sudo ./install-apps.sh

curl https://raw.githubusercontent.com/reisikei/Linux/main/Ubuntu%20security > install-security.sh && chmod 775 install-security.sh && sudo ./install-security.sh

wget -cO - https://raw.githubusercontent.com/reisikei/docker/main/1%20Docker%20%26%20%20Docker%20compose%20%26%20Portainer > docker_install.sh && chmod 775 docker_install.sh && sudo ./docker_install.sh


#Create a wireguard server:
curl PARA WIREGUARD SERVER

#To update aliases:
curl 

```

# SHELL 

### Useful Shell commands

```
head -n 5 seasonal/winter.csv > top.csv
tail -n 3 top.csv
```

```
The pipe symbol tells the shell to use the output of the command on the left as the input to the command on the right:
head -n 5 seasonal/summer.csv | tail -n 3
```

```
cut -d , -f 2 seasonal/summer.csv | grep -v Tooth

#change Cherno to Cherno City in the given file
cat soccer_scores.csv | sed 's/Cherno/Cherno City/g' | sed 's/Arda/Arda United/g' > soccer_scores_edited.csv
```

```
grep '[pc]' fruits.txt
grep '[pc]' ^ fruits.txt #not contains p or c


cat two_cities.txt | egrep 'Sydney Carton|Charles Darnay' | wc -l #from the file specified, count the lines where those appeared
```

The command wc (short for "word count") prints the number of characters, words, and lines in a file. 
You can make it print only one of these using -c, -w, or -l respectively.

```
Check file system of a path:
sudo file -s /dev/xvdb  
Make the desired file system:
sudo mkfs -t ext4 /dev/xvdb 
```


### Wildcards
To make your life better, the shell allows you to use wildcards to specify a list of files with a single expression. The most common wildcard is *, which means "match zero or more characters". Using it, we can shorten the cut command above to this:

cut -d , -f 1 seasonal/*
or:

cut -d , -f 1 seasonal/*.csv

head -n 3 seasonal/s*

The shell has other wildcards as well, though they are less commonly used:

? matches a single character, so 201?.txt will match 2017.txt or 2018.txt, but not 2017-01.txt.
[...] matches any one of the characters inside the square brackets, so 201[78].txt matches 2017.txt or 2018.txt, but not 2016.txt.
{...} matches any of the comma-separated patterns inside the curly brackets, so {*.txt, *.csv} matches any file whose name ends with .txt or .csv, but not files whose names end with .pdf.

### Sort lines of text
As its name suggests, sort puts data in order. By default it does this in ascending alphabetical order, but the flags -n and -r can be used to sort numerically and reverse the order of its output, while -b tells it to ignore leading blanks and -f tells it to fold case (i.e., be case-insensitive).
Pipelines often use grep to get rid of unwanted records and then sort to put the remaining records in order.

cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | sort -r

### Uniq
Another command that is often used with sort is uniq, whose job is to remove duplicated lines. More specifically, it removes adjacent duplicated lines

### Set
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

### Loops

How can I repeat a command many times?
Shell variables are also used in loops, which repeat commands many times. If we run this command:

for filetype in gif jpg png; do echo $filetype; done

Notice these things about the loop:

The structure is for …variable… in …list… ; do …body… ; done
The list of things the loop is to process (in our case, the words gif, jpg, and png).
The variable that keeps track of which thing the loop is currently processing (in our case, filetype).
The body of the loop that does the processing (in our case, echo $filetype).

for filename in seasonal/*.csv; do echo $filename; done

### Nano

f you type nano filename, it will open filename for editing (or create it if it doesn't already exist). You can move around with the arrow keys, delete characters using backspace, and do other operations with control-key combinations:

Ctrl + K: delete a line.
Ctrl + U: un-delete a line.
Ctrl + O: save the file ('O' stands for 'output'). You will also need to press Enter to confirm the filename!
Ctrl + X: exit the editor.

### Save commands to rerun

You have been using the shell interactively so far. But since the commands you type in are just text, you can store them in files for the shell to run over and over again. To start exploring this powerful capability, put the following command in a file called headers.sh:

head -n 1 seasonal/*.csv
This command selects the first row from each of the CSV files in the seasonal directory. Once you have created this file, you can run it by typing:

bash headers.sh
This tells the shell (which is just a program called bash) to run the commands contained in the file headers.sh, which produces the same output as running the commands directly

### Pass filenames to scripts


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

```
#Print the first and last data records of each file.
for filename in $@
do
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done
```


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



### shell within a shell

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




### Creating an array in bash

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





### Associative arrays:
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

```
### Create variables from the temperature data files
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
```

### Conditions checking

```
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
```



### Extract Accuracy from first ARGV element
accuracy=$(grep Accuracy $1 | sed 's/.* //')

### Conditionally move into good_models folder
if [ $accuracy -gt 90 ]; then
    mv $1 good_models/
fi

### Conditionally move into bad_models folder
if [ $accuracy -lt 90 ]; then
    mv $1 bad_models/
fi


### Create variable from first ARGV element
sfile=$1

### Create an IF statement on sfile's contents
if grep -q 'SRVM_' $sfile && grep -q 'vpt' $sfile ; then
	# Move file if matched
	mv $sfile good_logs/
fi

### for and while

for x in 1 2 3
do 
 echo $x
done


for x in {1..5..2}
do 
 echo $x
done

for ((x=2;x<=4;x+=2))
do 
 echo $x
done


for book in books/*
do
 echo $book
done

#print book in a directory with air in the file name
for book in $(ls books/ | grep -i 'air')
do
 echo $book
done


x=1
while [ $x -le 3 ];
do
 echo $x
 ((x+=1))
done


#Use a FOR loop on files in directory
for file in inherited_folder/*.R
do  
    # Echo out each file
    echo $file
done


#Create a FOR statement on files in directory
for file in robs_files/*.py
do  
    # Create IF statement using grep
    if grep -q 'RandomForestClassifier' $file ; then
        # Move wanted files to to_keep/ folder
        mv $file to_keep/
    fi
done


#Case 
case $(cat $1) in
 *sydney*)
 mv $1 sydney/ ;;
 *melbourne*|*brisbane*)
 rm $1 ;;
 *canberra*)
 mv $1 "IMPORTANT_$1" ;;
esac

#Create a CASE statement matching the first ARGV element
case $1 in
  #Match on all weekdays
  Monday|Tuesday|Wednesday|Thursday|Friday)
  echo "It is a Weekday!";;
  #Match on all weekend days
  Saturday|Sunday)
  echo "It is a Weekend!";;
  #Create a default
  *)
  echo "Not a day!";;
esac



#Use a FOR loop for each file in 'model_out/'
for file in model_out/*
do
    #Create a CASE statement for each file's contents
    case $(cat $file) in
      #Match on tree and non-tree models and move it, remove if the other 2
      *"Random Forest"*|*GBM*|*XGBoost*)
      mv $file tree_models/ ;;
      *KNN*|*Logistic*)
      rm $file ;;
      #Create a default
      *) 
      echo "Unknown model in $file" ;;
    esac
done




## Functions

function_name () {
 #function_code
 return #something
}

function function_name {
 #function_code
 return #something
}


temp_f=30

function convert_temp () {
 temp_c=$(echo "scale=2; ($temp_f -32) * 5 / 9" | bc)
 echo $temp_c
}


#Create function
function upload_to_cloud () {
  #Loop through files with glob expansion
  for file in output_dir/*results*
  do
    #Echo that they are being uploaded
    echo "Uploading $file to cloud"
  done
}

#Call the function
upload_to_cloud





#Create function
what_day_is_it () {

  #Parse the results of date
  current_day=$(date | cut -d " " -f1)

  #Echo the result
  echo $current_day
}

#Call the function
what_day_is_it




#PASSING ARGUMENTS
$1 $2
$@ $*
$#


function print_filename {
 echo "The first file was $1"
 for file in $@
 do
  echo "This file has name $file"
 done
}

print_filename "LOTR.txt" "mod.txt" "A.py"



#scope refers to how accesible a variable is 
all variable are global in bash by default

function print_filename {
 local first_filename=$1
}
print_filename "LOTR.txt" "model.txt"
echo $first_filename


#the return value 0 or 1 is in the variable $?


#Create a function 
function return_percentage () {

  #Calculate the percentage using bc
  percent=$(echo "scale=2; 100 * $1 / $2" | bc)

  #Return the calculated percentage
  echo $percent
}

#Call the function with 456 and 632 and echo the result
return_test=$(return_percentage 456 632)
echo "456 out of 632 as a percent is $return_test%"




#Create a function with a local base variable
function sum_array () {
  local sum=0
  #Loop through, adding to base variable
  for number in "$@"
  do
    sum=$(echo "$sum + $number" | bc)
  done
  #Echo back the result
  echo $sum
  }
#Call function with array
test_array=(14 12 23.5 16 19.34)
total=$(sum_array "${test_array[@]}")
echo "The total sum of the test array is $total"



### Scheduling scripts with cron

crontab -l
crontab -e

30 1 * * * bash extrac_data.sh

15 * * * *
15,30,45 * * * *
*/15 * * * *
