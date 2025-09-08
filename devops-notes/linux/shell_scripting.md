###SHELL SCRIPTING
* use :
imagine you have written commands for a server configuration and you want that to be copied for making 10 more servers then executing every command in terminal one by one  will take lot of time so that is why shell scripting is used#!/bin/bash as we can make a file of commands which will be interpreted together .

- it avoids repetitive work
- can share the instructions
- .sh is the extension
- file is movable

# shell - it is a program that interprets and executes various commands that we type in the terminal

-> Shebang line to start the fie with is : `#!/bin/bash`
example:
vim setup.sh
[this will open us a file]
[inside file write:]
#!/bin/bash
echo "hello world"
[ctrl+X for exit and the save ]
[the run the file]
./setup.sh
[will give error permission denied]
[give executable permissions]
sudo chmod u+x setup.sh
[then run the file]
./setup.sh    or {bash setup.sh}
[output]
hello world

#Variables:
used to store data and can be referenced later

num="1"
name="Devil"
These kinds of variables are scalar variables as they could hold one value at a time. 

1) accessing Variables:
Variable data could be accessed by appending the variable name with '$' as 
- variable_name=$(command) 

*example
#!/bin/bash
VAR_1="Devil"
VAR_2="OWL"
echo "$VAR_1$VAR_2"



2) Unsetting Variables:
The unset command directs a shell to delete a variable and its stored data from list of variables. 
#!/bin/bash
var1="Devil"
var2=23
echo $var1 $var2
unset var1
echo $var1 $var2

Output:
DEVIL 23
23

3) Read only Variables.
These variables are read only i.e., their values could not be modified later in the script. 

exapmle:
#!/bin/bash
var1="Devil"
var2=23
readonly var1
echo $var1 $var2
var1=23
echo $var1 $var2

Output:

Devil 23
./bash1: line 8: var1: readonly variable
Devil 23

#Variables Types:
1) Local Variable:

variable which are specific to the current instance of shell. They are basically used within the shell, but not available for the program or other shells that are started from within the current shell. 

2) Environment Variable:

These variables are commonly used to configure the behavior script and programs that are run by shell. Environment variables are only created once, after which they can be used by any user.
or example:

`export PATH=/usr/local/bin:$PATH` would add `/usr/local/bin` to the beginning of the shell's search path for executable programs.

3) Shell Variables:
Variables that are set by shell itself and help shell to work with functions correctly. It contains both, which means it has both, some variables are Environment variable, and some are Local Variables.
-example:
`$PWD` = Stores working directory 
`$HOME` = Stores user's home directory

#How to Store User Data in a Variable?

#!/bin/bash
  echo "Enter the length of the rectangle"
  read length
  echo "Enter the width of the rectangle"
  read width
  area=$((length * width))
  echo "The are of the rectangle is: $area"
  
# if-else conditions 
allows you to alter the flow of program 
- executes commands only when condition is fulfilled
if[condition]
then [command]
else
[command]
fi
[end]

#There are 5 basic operators in bash/shell scripting:

   > Arithmetic Operators->
    + → Addition
    - → Subtraction
    * → Multiplication
    / → Division
    % → Modulus (remainder)
    ** → Exponentiation
    
    
   > Relational Operators ->
    works only for numeric values 
    will work to check relation between 10 and 20 as well as between "10" and "20"
    -eq → Equal to ([ "$a" -eq "$b" ])
    -ne → Not equal to
    -gt → Greater than
    -lt → Less than
    -ge → Greater than or equal to
    -le → Less than or equal to
    
    
   > String Operators

    = → Strings are equal ([ "$a" = "$b" ])
    != → Strings are not equal
    < → String1 is less than String2 (ASCII order, needs [[ ]])
    > → String1 is greater than String2 (ASCII order, needs [[ ]])
    -z string → String is null (empty)
    -n string → String is not null
    
    
   >File Test Operators

        Used to test file types and permissions:
        -e file → File exists
        -f file → File is a regular file
        -d file → Directory exists
        -r file → File is readable
        -w file → File is writable
        -x file → File is executable
        -s file → File is not empty
        -L file → File is a symbolic link
        file1 -nt file2 → file1 is newer than file2
        file1 -ot file2 → file1 is older than file2
    
    
 >Logical Operators

    ! expr → NOT
    expr1 -a expr2 → AND (works in [ ], but prefer &&)
    expr1 -o expr2 → OR (works in [ ], but prefer ||)
    && → AND (used in [[ ]] or directly in shell)
    || → OR
        
   
 >Bitwise Operators
     & → Bitwise AND
    | → Bitwise OR
    ^ → Bitwise XOR
    ~ → Bitwise NOT
    << → Left shift
    >> → Right shift  
    File Test Operators
    

**tips:
Use [ ] for POSIX sh-compatible tests.
Use [[ ]] in Bash/Ksh/Zsh for extended tests (safer for strings with spaces, and supports <, >).
Use (( )) for arithmetic.
    

#positional Parameters :
arguments passed to script are processed in the same order in which they're sent
the indexing of arguments starts at 1

for example :
[make a file]
vim ss.sh
[then inside the file ]
user_group=$1  {this is positional parameter which start with 1...it will provide value to your bash script}
if ["$user_group"=="parija" ]
then 
echo "configure the server"
elif ["$user_group"=="admin" ]
then 
echo "admininster the server"
else
echo "no permission to configure server"
fi

* if we use $* then we can add multiple parameters like :
echo "user $1" {takes one parameter}
echo "user $*" {takes multiple}
*$# tells the total no. of parameters provided:
example:
echo "all params: $*"
echo "number of params: $#"
echo "user $1"
echo "user $2"

#loops in linux:
- while
- for
- until
- select

for loop :

for param in $*
 do 
  echo $param
 done

example 
echo "params $*"
echo "no of params $#"

for param in $*
 do 
  echo $param
 done
 
 
for paran in  $*
do 
if[ -d "$param" ]
then 
echo"message"
fi
echo $param
done

#while loop:

sum=0
while condition 
do 
read -p "enter a score" score
if [$score =="q"]
then 
break
sum = (($sum+$score))
echo "total score: $sum"
done 
 
#Arrays:
arrays can be formed like :
myArray= (1 2 Hello "Hey man")



#functions:
enable you to break down overall functionality of a script into smaller , logical code blocks

for example:

function score_sum{
sum = 0 
while true 
do 
read -p "enter the score " score 
if[ "$score" == "q"]
then
break
fi
sum = $(($sum + $score))
echo "$total score: $sum"
done
}

score_sum

[this how we have to call the function]
 
 example2:
 create_file() {
        filename=$1
        touch "$filename"
        echo "file $filename" is saved
}
create_file test.txt
create_file myfile.yaml
create_file yolo.sh

example 3 : write a function to tell if the file is a shell script or not
create_file(){
file_name=$1
is_shell_script=$2
touch $file_name
echo "file $file_name created"
if[ is_shell_script = true ]
then 
chmod u+x $file_name
fi
}
create_file myscript.sh true

#return values in function 
systax :
return sum
[sum calculated by function]

function sum() {
total=$(($1+$2))
return $total
}
sum 2 10
result=$?
echo "sum : $result"
#Best practices are :
to not use too much parameters 
function should only do one thing 






































