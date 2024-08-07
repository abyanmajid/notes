# Week 2 INFO1112 Lecture

Everything in unix is either a process or a file.

**Variables in Shell scripting:**

```sh
VARIABLE=value
NAME=bob

echo $NAME
```

**Redirection of output:**

You can redirect the output of a command so that it goes to a file instead of the screen

```sh
echo hello, world > file.txt
cat file.txt
a=file.txt
echo $a
```

**Pipes:**

You can take the output of a command and send it to the input of another using a pipe `|`

```sh
cat myfile | wc
```

**Expressions in shell:**

```sh
A=1
expr $A + 1
```

**Backquotes for replacing with output:**

Backquotes make the command enclosed with it return the output.

We can use this to return computation expressions into some variable

```sh
A=1
res=`expr $A + 1`
echo $res
```

**Word count using `wc`:**

`wc` counts:

- number of lines
- number of words
- number of characters

**Some other useful commands, often especially useful with pipes:**

- `cut` : remove a portion of each line e.g., cut out columns
- `paste` : paste several files together vertically
- `sed` : stream editor
- `tr` : transliterate one class of character to another
- `sort` : sort a file on one or more fields
- `grep` : search for matching lines
- `uniq` : remove duplicate lines
- `fmt` : format the text
- `man` : open the manual for a command

**Program vs. Process:**

Your program is on the disk. Your OS will take the program in the CPU and spawn a process that runs the program.

PROCESS: The combination of the memory occupied by the program and all of its state is called a "process"

Processes can be shown using `ps`

```sh
ps
ps a
ps al
ps al | more
```

In `ps l`, UID is user id, `PID` is process id, `PPID` is parent process id, `PRI` is priority.

**Interrupt:**

The kernel is responsible for switching between programs. This depends on a feature of the CPU called "interrupt", which is where a currently running program is interrupted, all of its "state" (memory, cpu registers, etc) is saved, and the kernel is entered. Later, the kernel can restore the state and restart the program.

**User IDs:**

When a process is running, it has an associated UID. This is used in the file system to indicate the owner of a file or directory. We map UID onto a name using the password file stored in `/etc/passwd`

```
cat /etc/passwd
```

**File ownership**

You can get the owner of a file using the `-l` flag in `ls`

```
ls -l
```

```
-rw-r--r-- 1 abyanmajid abyanmajid 24 Aug  7 19:12 myfile.txt
```

the first `abyanmajid` is the owner, and the second `abyanmajid` is the user group.

**Permission**

permissions are `rwx` which stands for `r`ead, `w`rite, and e`x`ecute. A file permission such as `-rw-r--r--` can be broken down into 4 parts:

1. The first one `-` is the type of the file, it could be `-` for general, `d` for directory, `l` for symbolic link, `b` for block device, `c` for character device, `p` for named pipe (FIFO), `s` for socket
2. The first three `---` is the permissions for the owner user.
3. The second three `---` is the permissions for the user group for whom the file is made accessible
4. The last three `---` is the permissions for every other user.

**Groups:**

Just like UIDs (User IDs), Unix also have GIDs (Group IDs). The `/etc/group` file contains the mapping of GIDs onto group names. When an account is created, it also gets a group of the same name.

_What are groups for?:_ They're simply collections of users that allow easier management of permissions, particularly for files. A sysadmin can essentially set shared permissions for multiple users simultaneously.

**Superuser ID:**

The user with UID 0 is a special user called the "superuser" and they have the topmost level privileges; they're able to access any file and run any program.

**Finding the UID of the running shell:**

We can use `id` to get the UID of the current running shell:

```
id
```

```
uid=1000(abyanmajid) gid=1000(abyanmajid) groups=1000(abyanmajid),4(adm),20(dialout),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),116(netdev),1001(docker)
```

**File Access**

Files have _metadata_, which is just a set of attributes associated with the file such as "name", "owner", "group", "access permissions", "position in the name space", "location in mass storage" etc.

A program can access a file using the open system call (syscall). The program will be suspended briefly while the kernel finds the path in the file system and sets up a data structure containing the _metadata_. In a running process, this DST is referred to be a _file descriptor_ which is a small integer.

**Devices in the namespace**

Unix makes access to devices the same as any other file: it has a name in the namespace and the standard open/close/read/write/delete syscalls. There is a `/dev/sda` path that refers to a disk drive, for example.

```
ls -l /dev/sda
```

```
brw-rw---- 1 root disk 8, 0 Aug  7 10:13 /dev/sda
```

`b` is for "block device file"

**Other special files:**

Just like device files, the namespace has pseudo files that contain info about the system. One example is `/proc/uptime` which shows the total time the system is up, and how long it has been idle in seconds.

**Open Files**

When a program is started, the process is automatically given three open files, with the following descriptors: (0) standard input/stdin, (1) standard outout/stdout, and (2) standard error/stderr

If you're running a program from the CLI, then (0), (1), and (2) correspond to the keyboard, the screen and the screen respectively.

**Redirection using open file stream descriptors:**

The redirection operator `>` is by default prefixed with `1` (for stdout), so you'd essentially execute `1>`. You can alternatively use `2>` to redirect the standard error elsewhere.

```
ls asfjdnsfjdsosidjg 1> output.txt 2> error.txt
```

**Regular Expressions (Regex)**

- `abc` : matches the string "abc" in text
- `a.b` : the dot means _any_ character will match
- `^abc` : match lines that start with "abc"
- `abc$` : match lines that end with "abc"
- `a[xy]c` : match _either_ "axc" or "ayc"
- `ab*c` : `b*` means zero or more occurrences of "b"


