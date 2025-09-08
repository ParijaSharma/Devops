
#processes :
    1) Parent and Child process : The 2nd and 3rd column of the ps –f command shows process id and parent’s process id number. For each user process, there’s a parent process in the system, with most of the commands having shell as their parent.
    
    2) Zombie and Orphan process : After completing its execution a child process is terminated or killed and SIGCHLD updates the parent process about the termination and thus can continue the task assigned to it. But at times when the parent process is killed before the termination of the child process, the child processes become orphan processes, with the parent of all processes “init” process, becomes their new pid. 
    A process which is killed but still shows its entry in the process status or the process table is called a zombie process, they are dead and are not used.
    
    3) Daemon process : They are system-related background processes that often run with the permissions of root and services requests from other processes, they most of the time run in the background and wait for processes it can work along with for ex print daemon. 
    When ps –ef is executed, the process with ? in the tty field are daemon processes.

exit status - 
