# Week 1 (INFO1112)

**Binary (base 2)**

In base 2 (binary) each position is a power of 2.

$$1011=1\times 2^3 + 0\times 2^2 + 1\times 2^1 + 1\times 2^0=11$$

Examinable: Convert binary integers into decimal, and reversely

**Hexadecimal (base 16)**

Hexadecimals map to EXACTLY 4 bits.

$$10 0100 1010 1000=24A8$$

Examble: Convert binary to hexadecimal, and reversely

**Memory**

The memory of a computer is divided into 8 BIT pieces called BYTES. These pieces are each given a number from 0 to the number of bytes in the memory. Each of these numbers is called a MEMORY ADDRESS.

The fact that each byte is only 8 bits long implies that there is a limit on the range of values that can be represented!

**Character Representation**

ASCII: There are 7 bits, so there are $2^7$ possible character binary encoding including 0. And, the largest number would be $2^7-1=127$ or $1111111$

ASCII is fine for English, but what about other languages like Chinese or French? ASCII isnt enough, that's why we have the UNICODE (UTF-8), we simply add an extra bit! more bits equals more representations!

**Machine Instructions**

Applications -> UI -> File System -> Operating System -> Programs -> CPU (execute instructions encoded as bits in memory) -> Hardware (electronics)

Computer programs are a set of instructions executed by the CPU 

To switch from USER MODE to SYSTEM MODE, a special CPU instruction, SYSTEM CALL, is executed.

**File System**

The store "persistent" data, we need storage other than main memory. This is often a separate device such as disk drive.

The raw storage provided by these mass storage devices is NOT CONVENIENT to use so in nearly all cases we structure the storage into files and directories, which we call the FILE SYSTEM




