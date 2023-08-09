# Stack and Heap Memory Management

*Date written: May 29, 2023* \
*By: Abyan Majid*

- [Stack and Heap Memory Management](#stack-and-heap-memory-management)
  - [Stack](#stack)
    - [Example of stack allocation in C++](#example-of-stack-allocation-in-c)
  - [Heap](#heap)
    - [Example of heap allocation in C++](#example-of-heap-allocation-in-c)
  - [Summary](#summary)

In computer systems, memory is organized into small units called bytes. Each byte has a unique address that allows the system to locate and access it. When a program runs, it needs memory to store variables, data structures, and instructions.

Two regions of memory that is available to your code to use at runtime include (1) the stack, and (2) the heap.

## Stack
The stack is a region of memory that is used to store local variables nad function call information. 

Below are characteristics of the stack:

- ***LIFO structure*** - The stack operates on the principle of *Last-In, First-Out* (LIFO);  As new variables are added, they are placed on top of the stack, and when a function finishes executing, the variables are automatically removed from the stack. So, when you allocate variables on the stack, the most recently allocated variable is at the top of the stack. This means that if you have multiple variables stored on the stack, the last variable you allocated is the first one to be deallocated or accessed.
- ***Fixed size*** - The stack can only store variables with a known, fixed size.
- ***Automatic management*** - Memory management in the stack is automatic and handled by the system.
- ***Limited scope*** - Variables and function call informations stored in the stack will automatically be deleted beyond the scope of the program.

### Example of stack allocation in C++
Below is an example of stack allocation in C++:
```cpp
void stackAllocationExample() {
    int x = 5; // Integer variable 'x' allocated on the stack
    float y = 2.5f; // Float variable 'y' allocated on the stack

    // Use the variables...
    std::cout << "x: " << x << ", y: " << y << std::endl;

    // The variables are automatically deallocated once the function finishes executing
}
```
The variables `x` and `y` are allocated on the stack, and are automatically deallocated when the function `stackAllocationExample` finishes executing.

## Heap
The heap is another region of computer memory used for dynamic memory allocation.

 It's like a large storage area where data is organized in a less structured manner. To allocate memory on the heap, the program requests a certain amount of space, and the operating system finds a suitable location in the heap. The allocated memory is then marked as used and a pointer, which is like an address, is returned to the program. This pointer allows the program to access the data stored on the heap.

The characteristics of memory allocation on the heap, in general, is the opposite of the stack.
- ***Unstructured and flexible*** - memory allocation and deallocation in the heap can occur in any order
- ***Growable size*** - The size of heap can grow dynamically as needed, up to the certain limits imposed by the operating system
- ***Manual allocation/deallocation*** - Memory allocation on the heap must be manually, and explicitly done by the programmer.
- ***Longer scope*** - The term of retention of variables in the heap may persist beyond the scope in which they are created

### Example of heap allocation in C++
```cpp
void heapAllocationExample() {
    // Manual allocation of an integer 'ptr' into the heap
    int* ptr = new int;
    // Access using the pointer 'ptr' and assignment of value 10 to the dynamically allocated integer
    *ptr = 10;

    // Use the dynamically allocated integer...
    std::cout << "Dynamically allocated integer: " << *ptr << std::endl;

    // Manual deallocation of varialbe 'ptr' from the heap
    delete ptr;
}
```
In the above example, an integer is dynamically allocated on the heap using the `new` operator. The value is assigned to the dynamically allocated integer, and it is accessed using the pointer `ptr`. The memory is manually deallocated using `delete` to ensure proper cleanup and prevent memory leaks.

## Summary
In summary, the ***stack*** is a fast and structured region of memory used for managing local variables with known, fixed size, as well as function call information, operating on the principle of last-in, first-out. Variables allocated on the stack will automatically be deallocated beyond the scope.

The ***heap***, on the other hand, is a more flexible and less structured region of memory used for dynamic memory allocation, allowing for the allocation and deallocation of memory of varying sizes. Variables allocated on the heap may not be deallocated, therefore presist, beyond the scope.