### AWK
Awk is a scripting language used for manipulating data and generating reports. The awk command programming language requires no compiling and allows the user to use variables, numeric functions, string functions, and logical operators. 


What Operations can AWK do?

    Scanning files line by line
    Splitting each input line into fields
    Comparing input lines and fields to patterns
    Performing specified actions on matching lines


* Syntax:
- `awk options 'selection _criteria {action }' input-file > output-file`

* options:
-F	Sets a custom field separator
-f	Reads awk program from a file
'{}' Encloses action to take on match

# Starting with it
ps | awk '{print $1}'
this prints the first column and columns are determined by spaces
