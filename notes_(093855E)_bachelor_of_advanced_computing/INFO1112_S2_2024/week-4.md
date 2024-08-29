# Week 4 (INFO1112)

### Programs in memory

When a program is ready to run as a process it's stored in memory in a particular layout:

1. Stack: Temporarily persistent until a scope ends, often used for temporary variables
2. Heap: Persistent until the program is exited, often used for data structures
3. Static and global data: Static variables have local scope, but their lifetime is throughout the program execution. Meanwhile, global variables have global scope and is accessible from any function within the program.
4. Program code instructions

<img width="116" alt="image" src="https://github.com/user-attachments/assets/ce0a61da-75b9-439a-a6d5-f605e477cb41">

### Memory mapping

A process have a limited number of address reserved for it. The address 0 (often offset by an amount by a predefined mapping) is reserved for the process identifier.

**Offset register:** There's a hardware in the CPU that remaps the address space for each process when it's running (e.g., if a process memory image is stored at real adderss 1000, then the kernel can use privileged instructions to set a special register that says "all references to addresses are offset by 1000" that is, a reference to address 0 will actually refer to address 1000)

**Limit register:** There's a register that sets an upper limit on the addresses the process can use in order to preevnt the process code from accessing beyond its alloted memory area.

<img width="467" alt="image" src="https://github.com/user-attachments/assets/e578cac4-15b5-4deb-95a4-17cc09afad38">

**IMPORTANT:** Memory allocations for a single process need not be a contiguous block. It may comprise of multiple blocks at different locations, and if you run out, you can just allocate more virtual memory.

If you run out of memory in the RAM, you can allocate additional virtual memory using your SSD (Secondary or Mass Storage)

<img width="384" alt="image" src="https://github.com/user-attachments/assets/b5081cfe-54a6-4db5-907e-911cbdada6e6">

### Virtual Memory

In modern times, memory mapping involves remapping smaller blocks of memory called "pages"

There's a table in the system that contains an entry for every page of the process. This table maps the virtual address of the page used by the process to the physical address in the main memory (or an indication that the page is currently on mass storage). This is known as the _page table_

The kernel manages this table and moves pages to, and from mass storage

Example of a page table:

<img width="316" alt="image" src="https://github.com/user-attachments/assets/a62a1a76-b603-4ac7-a900-5c65f5ac02ae">

The page table maps virtual memory addresses to physical mememory addresses. If the process's data is stored on the SSD, the page table entries will point to this location on the SSD instead of the RAM. When the process accesses this data, the OS swaps it back into RAM as needed.

### Virtual Memory Allocation

If the RAM is insufficient, the OS can allocate virtual memory to the process from the SSD.

### Interrupt and swap with Virtual Memory

**What happens if a program attempts to use mememory that the page table has mapped to mass storage?**

The access will cause an INTERRUPT that will transfer control to the kernel. An interrupt is like a forced function call to the kernel that occurs between two instructions in such a way that the CPU state is saved and can be restored when the kernel restarts the process.

When the kernel gains control, it will find the page on disk (stored in SWAP AREA) and read it in to a free part of the main memory. Then setup the page table to point to the new physical location and return to the process.

### Paging from disk

If the kernel needs to read in a page from disk, and discovers that there's no free physical memory available, then it has to first write an existing block out to the swap area to free up the memory.

**Performance drawback:** If this happens too frequently, then the system will be very slow and inefficient because the mass storage is much much MUCH slower than RAM and it takes a long time to position a disk and read the page into memory.

### Shared memory

The paging system allows multiple processes to have pages mapped to the same physical memory. This saves memory! However, it's important to note that sharing writable memory may introduce racing conditions.

### Scheduling

On a single CPU system, only one process can execute at a time - while the others are in the memory sleeping; they wait for some resources to be available (and these resources are usually some form of I/O; waiting for data to be delivered from a peripheral such as a disk drive or keyboard)

SCHEDULING is the process of deciding which process gets to run next.

### Scheduler

A scheduler maintains an ordered queue of processes waiting to run. This ordering is decided with some measure of priority.

_ROUND ROBIN ALGORITH:_ One simple way to go about scheduling is to give each process an equal slice of the CPU time and just circulate around processes.

<img width="403" alt="image" src="https://github.com/user-attachments/assets/b0929f7c-db8c-46b3-a887-29983cac32f7">

More sophisticated schedulers take into account a priority value and other factors. 

### Priority for commands

The user space priorities range from 0 (HIGHEST PRIORITY) to 39 (LOWEST PRIORITY), and a normal user process starts with priority 20.

$$priority = 20 + niceness$$

You can use `nice` to set the priority of a command. Here's oow to add `N` to the priority of a command when it runs:

```
nice -n N command
```

You can assign a lower priority using `nice`

```
nice -n 10 mycommand
```

But you cannot set it to a higher priority. TO do this, you must be a superuser.

```
nice -n -10 ./mycommand
```

### Priority for already running processes

You can use `renice` to change the priority of an already running process

```
renice <nice> -p <pid>
```

e.g.,

```
renice 10 -p 1234
```

### Boot sequence

<img width="311" alt="image" src="https://github.com/user-attachments/assets/ee9af46d-251e-4d03-a4e2-c17d7f75137b">

**Stage 1: Hardware**

When you first turn on the computer, the hardware does some test operations.

The computer has several sorts of main memory:

- RAM (Random Access Memory): volatile; contents are lots when power off
- ROM (Read Only Memory): persistent; contents are persisted even when power is off and contain initial instructions that are executed on boot. ROM cannot be changed after initial manufacture.
- Flash Memory: persistent, but can be changed by a program

**Stage 2: Control transfer and more hardware checks**

The first instruction to be executedis at a defined memory location that is persistent, and is usully address 0. This address typically contain a `JUMP` instruction that transfers control to program code (Firmware) for the next stage of the boot sequence.

This stage also do more hardware checks such as what devices are connected.

**Stage 3: Firmware works out where to find the next stage of the boot program**

Firmware looks at a fixed list of places stored in the flash memory (you can look at this list via BIOS i.e., Basic I/O System progams), and these locations are devices like hard drive, USB, CD ROM drive, etc.

On the disk, the program it loads is stored in the Master Boot Record (MBR), normally the first block on the device. 

The MBR is very restricted in size (less than 512 bytes long). It contains a program that reads the next stage of boot program (in Linux, one option is called GRUB i.e., Grand Unified Bootloader) as well as a table of device config for the boot device.

**Stage 4: Finding and loading the kernel via GRUB**

GRUB will navigate the namespace of the file system on mass storage and find the file containing the kernel (typically in `/boot`). It well then load it into memory and run it.

**Stage 5: Kernel loads device drivers and kernel modules**

Kernel performs final, high-level hardware checks and loads drive drivers and kernel modules, as decided by config files stored in the initial file system.

**Stage 6: Init**

The first process is started by the kernel and its called `init` (it starts system daemons and initializes all active subsystems). From then on, processes are only started by other processes and all of them can be traced back to `init`

### Control flow in shell scripting

**If statements**

```bash
if [ $NAME == Bob ]
then
    echo name is ok
elif [ $NAME == Alice ]
    echo name is good
else
    echo Wrong name
fi
```

Note: `[` is synonym for `test` and `]` is ignored by `test`

**While loops**

```bash
while program
do
    echo looping
done
```

**For statements**

```bash
for name in Alice Bob Carroll
do
    echo name is $name
done
```
