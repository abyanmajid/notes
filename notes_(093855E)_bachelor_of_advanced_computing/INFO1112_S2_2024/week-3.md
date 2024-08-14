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

**The `fork` syscall**

`fork` createas a new process (PARENT) where memory image and the metadata are an EXACT COPY of the process that called fork (PARENT), with the following few exceptions:

- child process has a new process ID
- child process has the parent process ID
- various values of resource metadata (e.g., cpu time used) are reset

After the `fork` call, both the child and aprent continue execution ONLY if `fork` has returned, with the small difference that:

- in the child process, `fork` returns 0
- in the parent process, `fork` returns the process ID of the child

`fork` will return a negative number, typically `-1`, for errors (if `fork` is unsuccessful or something went wrong)

**The `exec` syscall**

`exec` is simply a transfer of control; it COMPLETELY REPLACES the calling process by the new program. 

`exec` comes in different versions, and they all specify what program to execute (ie you give a pathname).

**The `wait` syscall**

`wait` suspends the execution of the calling process until one of its child processes exits, in which case it returns the PID of the child that exited.

Zombie - If a child process terminates, but the parent is not "waiting" for it, then it enters the "zombie" state until the parent process waits for it. Zombie means a process is half dead (because their task is done), but also half alive (because the control isn't tranferred back to the parent)

**Starting a process _from_ Python**

You typically just use the `os` module, and use combinations and variations of `fork()` and `exec()`

```
os.fork()
os.execle(path, arg0, arg1, ...env)
```

**Stopping a process with `kill`**

You pass a PID to the `kill` syscall to terminate a process



