# Week 3 INFO1112

**Symbolic links**

Symbolic links are pretty much shortcuts.

Instead of doing

```
cd year1/sem2/info1112/assignments
```

We can have

```
ln -s ./year1/sem2/info1112/assignments assignments
cd assignments
```

**Process:** A process is a running instane of a program. A process may be executing, waiting for some data from a device or pipe, or sleeping for some other reason.

`more` is a filter command to display text one screenful at a time.

**From program to processes:**

A program is stored on a persistent storage (e.g., disk) in a file. When a program is started, the OS reads the file and generates a memory image that contains code and data. The image is read into some free memory and the associated metadata are created e.g., standard I/O/Error file descriptors etc.). Finally, the OS starts the execution of the process

**Parallel process with the shell**

The default case is that the shell will wait for any command you enter to finish. But you can postfix your command line with `&` to make the command run in parallel with the shell.

This will output something like `[1] 32466` where `[1]` is the job ID, and `32466` is the ID of the (child) process being ran in parallel (where parent process is the shell).









