### What are links ?
 a connection between a file name and actual data on disk 
 we can call it a shortcut
 
 for example : 
         you have a file mysample.txt deep inside directories 
         cat multi/dir1/dir2/dir3/mysample.txt
         output - this is my file 
         
         using ln we can create a short cut:
         ln -s multi/dir1/dir2/dir3/mysample.txt myfile_s
         so ow we can get our out by just :
         cat myfile_s
         output - this is my file
         
- we can create multiple links of same files

### Types of link :
    - hard link
    - soft link
    
#soft link :
    if link will be removed if the original file is deleted 
    ln -s myfile myfile_link
    
# hard link :
    deleting renaming or removing the orignal file will not affect the link 
    ln myfile myfile_hard_link
