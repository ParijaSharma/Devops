# grep command :
        "global regular expression print"
        to search a particular string / keyword
        
        grep [option] pattern [file]
        
        
# Use cases:
- To ignore the upper and lower case while searching :
        grep -i keyword filename
        
- to search everything except given pattern/keyword :
        grep -v keyword filename  
        
- to print how many times the keyword comes in file :
        grep -c keyword filename
        
- to to search for exact match of given keyword in a file:
        grep -iw keyword filename / grep -w keyword filename
        
- to print the line number of matches of the given keyword in a file:
        grep -n keyword filename
        
- to search a given keyword in multiple files:
        grep -i keyword filename file2name file3name
        
- to suppress file names while search a given keyword in multiple files
        grep -h keyword filename file2name file3name
        
- to search multiple keyword in a file :
        grep -e keyword -e keyword2 -ie keyword3 filename
        egrep "keword1|keyword2" filename
        
- to search multiple keyword in multiple files: 
        grep -e keyword -e keyword2 -ie keyword3 filename filename2
        
- to only print file names which matches given keyword :
        grep -l keyword file1 file2 ...
        
- to get the keyword/pattern from a file and match with a another file
        grep -f keywords.txt filename
        
-  to print the matching line which start with given keyword
        grep "^keyword" filename ( '^' line start with )
        grep keyword$ filename ( '$' line ends with )
        
- suppose we have 100 files in a directory (dirA) and we need to search a keyword in all the files 
        grep -R keyword dirA/*
- if you just wanna search but don't want to print on terminal 
        grep -q "keyword" file 
        the echo $? - tells exit status to check if it was successful or not
- if you want to suppress error message
        grep -s "keyword" file 
        
        
        
# some special greps :
        egrep - to find mutiple keywords at once from the file
        pgrep - prints the process pid of the file
        fgrep - to find special charecters in the file
        zgrep - to read from zipped file
        pdfgrep - to read from a pdf
