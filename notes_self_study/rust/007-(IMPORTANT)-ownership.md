# Ownership

*Date written: May 29, 2023* \
*By: Abyan Majid*

- [Ownership](#ownership)
  - [Ownership rules](#ownership-rules)
  - [Background on other memory management methods](#background-on-other-memory-management-methods)
    - [Inefficiency of a garbage collector](#inefficiency-of-a-garbage-collector)
    - [Inefficiency of explicit (de)allocation](#inefficiency-of-explicit-deallocation)
  - [How Rust's ownership rules ensure memory safety](#how-rusts-ownership-rules-ensure-memory-safety)
    - [1. Each value in Rust has a variable that is called its *owner*](#1-each-value-in-rust-has-a-variable-that-is-called-its-owner)
    - [2. There can only be *one* owner at a time](#2-there-can-only-be-one-owner-at-a-time)
    - [3. When the owner *goes out of scope*, the value will be *dropped*.](#3-when-the-owner-goes-out-of-scope-the-value-will-be-dropped)
      - [Stack deallocation](#stack-deallocation)
      - [Heap deallocation](#heap-deallocation)

## Ownership rules

***Ownership*** is a central feature to Rust and perhaps the biggest thing that makes Rust unique. The purpose of the ***ownership*** feature is to ensure memory safety through enforcement of ownership rules during compile-time, which are as follows:

1. Each value in Rust has a variable that is called its *owner*.
2. There can only be *one* owner at a time.
3. When the owner *goes out of scope*, the value will be *dropped*.

## Background on other memory management methods

Some languages like Python and Java uses a garbage collector to periodically checks for unused memory, and some other like C and C++ requires that the programmer explicitly allocates and deallocates memory.

I will now compare the efficiency of Rust's ownership against garbage collectors and explicit deallocations using a children's toy room analogy.

### Inefficiency of a garbage collector
Suppose that a boy named Eric is playing in the toy room. Now, a garbage collector in this case would be something or someone that constantly checks for no longer used toys. Therefore, imagine a maid, Sarah, who comes into the room every 10 minutes to check for unused toys to tidy the room.

For instance, suppose that when Sarah walked in, Eric is playing with his toy car and not his superhero toys. So, she decides to take the superhero toys to tidy the room. Now, the question is, what if Eric actually still wants to play with the superhero toys?

This is similar to what can happen with a garbage collector. It tries to determine when a memory is no longer used and tries to free it up. However, it may mistakenly remove memory that is still in use - which may cause problems for your program.

### Inefficiency of explicit (de)allocation
Simply put, the problem of explicit memory allocation and deallocation is that you, as the programmer, will be COMPLETELY responsible for managing memory - which terribly invites human error (e.g. you may forget to deallocate once the function is out of scope, etc.)

Applying this concept to our toy room analogy, there would not be a maid to assist Eric clean up his toy room. Eric would be completely responsible for his own toys.

Suppose that Eric brings a toy car into the room but forgets to remove to remove it from the room once he is done playing, the toy car will take up unnecessary space. This is equivalent to how we as the programmer, may forget to deallocate variables from the heap. Therefore, wasting memory space (this issue is known as a *memory leak*). 

Hopefully you can also imagine how memory leak, if done at larger scale, will inflict heavy negative impacts to the performance of your program, such as slowing it down tremendously, or making crashes. This is the same as how if Eric brought numerous toys into the room but left without them, the room would be very cluttered and when his friend, Anna, wants to play, she would struggle in finding her toys, which would waste her time and dissatisfy her playing experience.

Explicit allocation and deallocation has historically been a difficult programming issue. If we forget to deallocate, we will waste memory. If we deallocate too early, we will have an invalid variable. If we accidentally deallocate twice - That is, we try to deallocate memory that has already been freed - we will get a double-free bug. There is still many other bugs that can occur as a result of inaccurate deallocation, which is bound to occur due to human error.

## How Rust's ownership rules ensure memory safety

### 1. Each value in Rust has a variable that is called its *owner*
In Rust, every value has a unique owner, and only the owner can access and modify the value.
```rust
fn main() {
    let mut name = String::from("Alice"); // 'name' is the owner of the String value "Alice"
    let reference = &mut name;
    
    // attempting to modify the value through a different variable.
    *reference = String::from("Bob"); // compilation error!
    
    println!("{}", name);
}
```
In the example above, the variable `name` is set as the owner to the `String` value `"Alice"`. Then, we define another variable `reference` and lets it borrow the `String` value owned by `name`.

When we try to modify the `String` value borrowed by `reference` from `name` into `"Bob"`, Rust will return a compilation error because `reference` is not the owner of the `String` value `"Alice"`. This, therefore, demonstrates that only the owner can access and modify its value.

For more on the concepts of ***references*** and ***borrowing***, read ***rust/008-references_and_borrowing.md***

### 2. There can only be *one* owner at a time
This rule eliminates the possibility of multiple variables or references modifying the same value concurrently, which can lead to data races and memory corruption.

Below is a Rust code that will fail to compile, for there are two references that attempt to simultaneously modify the same value.
```rust
fn main() {
    let mut value = 5;

    let reference1 = &mut value;
    *reference1 += 1;
    
    // Attempting to create another mutable reference to `value`.
    // This will cause a compilation error.
    let reference2 = &mut value;
    *reference2 += 2;
    
    println!("{}", value);
}
```
The above code is attempting to increment a shared mutable variable `value` using two separate threads. It creates two threads, `thread1` and `thread2`, using the `thread::spawn` function. Each thread invokes the `increment_value` function, which takes a mutable reference `&mut` to `value` and increments it by `1`.

However, the code will fail to compile due to a violation of the second ownership rule: *"There can only be one owner at a time."* Specifically, Rust will return the following error message:
```
error[E0499]: cannot borrow `value` as mutable more than once at a time
 --> src/main.rs:12:9
  |
10 |     let thread1 = thread::spawn(|| {
  |                  --------------- first mutable borrow occurs here
11 |         increment_value(&mut value);
12 |     });
  |         ^^^^^^^^^^^^^^^^^^^^^^^^^ second mutable borrow occurs here
...
15 |     thread1.join().unwrap();
  |     - first borrow ends here

error: aborting due to previous error
```

Now, consider the following example which shows the C++ equivalent of the Rust code above.
```cpp
#include <iostream>
#include <thread>

void incrementValue(int& value) {
    value += 1;
}

int main() {
    int value = 0;

    // Creating two threads that concurrently attempt to increment `value`.
    std::thread thread1(incrementValue, std::ref(value));
    std::thread thread2(incrementValue, std::ref(value));

    // Waiting for the threads to finish their execution.
    thread1.join();
    thread2.join();

    std::cout << "Final value: " << value << std::endl;

    return 0;
}
```
Because the second ownership rule is not enforced in C++, this code will actually **compile successfully**, albeit with a high possibility that executing the program will result in a data race.

The two threads are racing to modify the value of `value`, and the outcome is non-deterministic. Different runs of the code may produce different results, showcasing the undefined behavior caused by the data race.

### 3. When the owner *goes out of scope*, the value will be *dropped*.

This rule ensures that when the program has executed all lines of code that involves a particular variable, the variable *"has gone out of scope"* and its value will be deallocated from memory. The point when a variable goes out of scope could be:
- The finishing of a function call, given that that the scope of the variable is local to the function
- The end of the program, i.e. the end of the `main` function.

Now, values will likely be stored in one of two regions of memory: (1) the stack, or (2) the heap.

To understand more about memory allocation on the stack and heap, feel free to read: <a href="https://github.com/abyanmajid/study-notes/blob/main/notes_self_study/operating_systems/stack_and_heap_memory_management.md">***operating_systems/stack_and_heap_memory_management.md.***</a>

Anyhow, the important thing to note about these two regions of memory - when trying to understand Rust's third ownership rule - is that values allocated on the stack will automatically be deallocated, meanwhile values allocated on the heap require explicit deallocation.

#### Stack deallocation

Below are identical code examples in Rust and C++ that demonstrate stack-allocation and deallocation.
- Rust ***stack***-allocation and deallocation example
```rust
// Stack-allocation and deallocation in Rust
fn main() {
    let number = 5;
    println!("The number is: {}", number);

    // After this point, 'number' goes out of scope
} // number is deallocated automatically

```
- C++ ***stack***-allocation and deallocation example
```cpp
// Stack-allocation and deallocation in C++
#include <iostream>

int main() {
    int number = 5;
    std::cout << "The number is: " << number << std::endl;

    // After this point, 'number' goes out of scope
    // number is deallocated automatically
    return 0;
}
```
In both code snippets, an integer `5` is allocated on the stack and automatically deallocated once it went out of scope. Stack deallocation is automatic for most programming languages, with the exception of very specific use cases in embedded or assembly languages.

So, for the most part, this ownership rule is not necessarily a "game-changer" in terms of stack deallocation. It just provides an alternative to other automatic stack deallocation methods. For insight, in C++, stack deallocation is done by automatically invoking the destructor of the object. A big part of why stack deallocation is easy to handle is because all values stored there are of known, fixed size.

#### Heap deallocation
Now, let us look at the heap, where values stored in there are not fixed and there exists pointers/addresses to the values are stored in it.

Below are examples of identical Rust and C++ code that demonstrate heap-allocation and deallocation.

- Rust ***heap***-allocation and deallocation example
```rust
// Heap-allocation and deallocation in Rust
fn main() {
    let number = Box::new(5);
    println!("The number is: {}", *number);

    // After this point, number goes out of scope
} // number is deallocated automatically
```

- C++ ***heap***-allocation and deallocation example
```cpp
// Heap-allocation and deallocation in C++
#include <iostream>

int main() {
    int* number = new int(5);
    std::cout << "The number is: " << *number << std::endl;

    delete number; // explicitly deallocates the value of 'number'

    return 0;
}
```

This time, in both code snippets, we try to allocate an integer `5` on the heap. 

As shown in the Rust code, `5` is *automatically* deallocated when its owner variable `number` goes out of scope. Meanwhile, in the C++ code, `5` needs to be *explicitly* deallocated using the `delete` keyword. If we did not include `delete number;`, `5` will remain in the heap, which causes memory leak (i.e. waste of space).