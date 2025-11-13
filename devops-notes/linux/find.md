### Find command:

    to search a file in a directory
    find [options] [path] [expression]
    
- find /path/ -name <filename>
    
### Cases:

*    how to search a file bases on their size?
     find /path/ -size 50M
    
*    how to find only file directory in a given path.
     find /path/ -type f
        f for file
        d for directory
        l for symbolic link
        b for block device
        s for socket
    
*    how to search a file based on their name
     find /path/ -name file name
     
     
*   How to ignore upper & lower case in file name while searching?
    file /path/ -iname filename
    
*   How to search files for a given user only?
    find /path/ -user root
    
*   How to search a file based on the inode no.?
    find /path/ -inum <inode_no_of_file>
    
*   How to search a file based on the no. of links?
    find /path/ -links <no._of_links>
    
*   How to search a file based on their permissions?
    find /path/ -perm /u=r
    find /path/ -perm 777
    
*   How to search all the files which start with letter a?
    file /path/ -iname a*
    
*   How to search all the files which are created after last.txt file?
    file /path/ -newer last.txt
    
*   How to search all the empty files in a given directory?
    file /path/ -empty 
    
*   How to search all the empty files and delete them?
    file /path/ -empty -exec rm {} \;  (exec - execute command )
    
*   How to search all the files whose size are between 1-50 MB
    find /path/ -size +1M -size -50M
    
*   How to search 15 days old files ?
    find /path/ -mtime 15
