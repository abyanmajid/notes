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


