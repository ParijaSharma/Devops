#vim editor 
a powerful tool to edit file and perform several operations 

* creating a new file :
- vim myfile

- then for editing press 'I'
- to save file: press esc then colon (:) and wq enter

* delete file :
 shift + : + !q 

* To shift to last line of the file : 'Shift + G'

* to jump on the top of the line : press 'gg'

* reverse and forward search in file :
- make sure that you are not in any mode - press esc if in any mode 
- for searching : '/Word'
- press n to see next occurrences 
- to search the word in reverse direction ( bottom to up ) - '?Word'
- (*) to search the word in forward direction
- (#) to search the word in backward direction

* Replace a word:
- use ':%s/word1/word2/g ' - to globally replace word1 from word2

* to undo changes : 
- firstly esc all modes and press 'u'

* to redo changes : 
- firstly esc all modes and press 'ctrl + r'

#( out side insert mode commands:)
* 'O' to edit in next line 
* 'shift + O' to move to next line in insert mode
* ' x ' to delete a character where cursor is present
* ' r ' to relace a character where cursor is present

* to delete a line - press 'dd' 
* ' :e! ' to revert all the changes done to the file

* to delete multiple line - 'no._of_lines dd'

* Cut and paste:
- first delete the line you want to cut and paste - using dd
- then go the location and press 'p'

* Copy and paste:
- 'v' to select a single character (--VISUAL-- mode)
- shift + v to select line (use up or down arrrows to select multiple lines)
- press y to copy
- press p to paste

* ' :set nu '  to print line numbers in file 
* ' :set no '  to remove line numbers in file 

* Directly jump to a given line
- ':100' jumps on 100th line

* working with multiple files :
- 'vim -o file1name file2name'
- ctrl + w to move to next file
- all above operations can e perform here also 

* compare two files:
- 'vim -d file1name file2name'















