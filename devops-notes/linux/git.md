# what is version control?
    developers workings on the same code 
    code is hosted centrally on the internet
    every developer has an entire copy of the code locally 
    code is fetched from remote repo and pushed to code repo

    gits knows how to merge changes automatically
    merge conflicts - eg: when same line was changed
    best practice is to push and pull often from remote repo 
    this is called continuous integration
    
    -> breaking changes don't affect you until you pull the new code
    -> version control keeps the track of changes
    -> you can revert commits 
    -> each change labeled with commit message

# Basics of Git:

gits has multiple parts:
- Remote Git Repository: where the code lives 
- Local Git Repository : local copy of the code 
- History - of the code changes 
- Staging - changes to commit
- Git client - to execute git commands
-to install git use sudo yum install it

#Basic commands for setting username and email:
        mkdir gitrepo
        cd gitrepo
        git config --global user.name "ParijaSharma"
        git config --global user.email parija.sharma16@gmail.com
        to verify : git config --list
        to see what is modified 
         git diff
        diff --git a/myfile.txt b/myfile.txt
        index e69de29..501d667 100644
        --- a/myfile.txt
        +++ b/myfile.txt
        @@ -0,0 +1 @@
        +hello this for practice


        git checkout:
        git checkout f2ce1dfe7b1ccbf5fc70d9e3c9e1e5f2315ba880 -- *
        parija@parisUbuntu:~/gitrepo$ ls
        myfile.txt
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice

        so basically checkout .. checks out to the previous file 

# Negative Cases
If we made any change by mistake and save it
Case1: To undo changes, get the last successful change
git restore . or filename (. mean all files)

        echo "hello this for practice i dont wanna add it " >> myfile.txt
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice
        hello this for practice i dont wanna add it 
        parija@parisUbuntu:~/gitrepo$ git restore .
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice



Case2: If we added the changes using git add then..
git restore --staged <file_path> # To unstage
git restore <file_path> # To discard changes in the working directory

        echo "hello this for practice i dont wanna add it and i will stage this  " >> myfile.txt
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice
        hello this for practice i dont wanna add it and i will stage this  
        parija@parisUbuntu:~/gitrepo$ git restore --staged myfile.txt
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice
        hello this for practice i dont wanna add it and i will stage this  
        parija@parisUbuntu:~/gitrepo$ git status
        On branch master
        Changes not staged for commit:
          (use "git add <file>..." to update what will be committed)
          (use "git restore <file>..." to discard changes in working directory)
	       modified:   myfile.txt
        no changes added to commit (use "git add" and/or "git commit -a")
        parija@parisUbuntu:~/gitrepo$ git restore myfile.txt
        parija@parisUbuntu:~/gitrepo$ cat myfile.txt
        hello this for practice

so basically added some line and then staged it so git restore --staged will remove it from staging area to modified area and then we can simply restore the changes

# LOCAL REPOSITORY:
git client needs to be connectedgit config --list with remote platform
need to authenticate to github
your public ssh key must be added to the remote platform 
github/gitlab can authenticate us when pushing/pulling from repository 
without providing username and password each time
#some related commands:
ls .git/ shows information about the repository
it shows :
head  config  description  hooks  info  objects  refs

# What is a Remote Git repository
different git repositories are available 
Platforms that host your repositories 
companies have their own git servers 
private vs public repositories 
public repositories for open source projects

# Stages of code in local repository:
git status - tells status of local git repo
git add - it moves file from working area to stagged area - adding files (green)- ready to be commited
git commit - it finally brings the file from local repo  which is ready to be pushed into remote repo
git log - history of changes from local repo
git push - then push command pushes file into remote repo

# if you have your project code locally then how to use git (github doesnt know about your project):
1. create a local git repository with "git init"
2. git commit ->


