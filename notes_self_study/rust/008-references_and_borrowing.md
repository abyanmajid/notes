# References and Borrowing

*Date written: May 30, 2023* \
*By: Abyan Majid*

- [References and Borrowing](#references-and-borrowing)
  - [Definitions](#definitions)
  - [Reference mutability](#reference-mutability)
    - [Reference rules](#reference-rules)
  - [Dereferencing](#dereferencing)
  - [Dangling references](#dangling-references)

***References*** and ***Borrowing*** allow you to work with values without taking ownership of them. In other words, these two features allows you to access and modify values already owned by a variable.

## Definitions
A ***Reference*** is like a *pointer* to a value, such that you can use this pointer as an access to the value. An immutable reference is denoted as `&`, while a mutable reference is denoted as `&mut`, such that:
- to define an immutable reference, you write `&var`
- to define an immutable reference, you write `&mut var`

***Borrowing***, on the other hand, refers to the action of creating a ***reference*** to a value for a specific scope or duration, and accessing or modifying the value without taking ownership of it.

## Reference mutability
Below is an example of reference and borrowing. Specifically, it demonstrates the creation and use of *immutable references*.
```rust
fn main() {
    let num = 5;
    let reference = &num; // Borrowing: creating an immutable reference

    println!("The value is: {}", reference);
}
```
In this example, `&num` creates an *immutable* reference to the value of `num`, which is bound to the variable `reference`. So, `reference` allows us to read and use (but not modify due to immutability) the value of `num`, without taking ownership of it.

An *immutable* reference ONLY allows us to access the value of the owner. On the other hand, a *mutable* reference allows us to modify, in addition to accessing the value of the owner. Below is an example of accessing and modifying the value of the owner through a *mutable* reference.
```rust
fn increment_value(value: &mut i32) {
    *value += 1;  // Dereferencing the mutable reference to modify the value
}

fn main() {
    let mut num = 5;
    let reference = &mut num;
    increment_value(reference);  // Passing a mutable reference to the function
    
    println!("The modified value is: {}", num);
}
```
In this example, we defined a mutable reference `reference` that borrows the value of `num`. Then, we tried to increment the value of the mutable reference by `1`, such that the changes will be reflected to the value of `num`.

Notice the use of the `*` keyword as a prefix to the line `value += 1;`. `*` is called the dereference operator, and is used for dereferencing. This is further explained in down below under [***Dereferencing***](#dereferencing).

### Reference rules
1. References must always point to valid, existing data on the memory; Rust does NOT allow dangling references (this is further explored down below under [***Dangling references***](#dangling-references))
2. At any given time, you may have *either* but not both of:
- One mutable reference
- Any number of immutable references
  
Rule no (2) prevents concurrent reads and writes to the same data - in other words, it prevents data races.

## Dereferencing
Dereferencing, denoted as `*`, is the process of accessing the value stored at a memory address pointed to by a reference. In other words, dereferencing allows you to read and manipulate the value of the owner variable which has been allocated on the memory.

Below is another example of dereferencing in Rust.
```rust
fn main() {
    let mut num = 10;
    let reference = &mut num; // Create a mutable reference to num

    *reference += 5; // Dereference the reference and adds '5' to '10'
}
```
In this example, we allocated `10` into the memory. Then, we made a reference to its owner `num`, finds the location of `10` in the memory, and adds `5` to it, such that the value stored in the memory is now `15`.

## Dangling references
Dangling references are references that point to memory locations that have been deallocated or are no longer valid. They occur when a reference is used after the object it references has been freed or destroyed. Therefore, potentially causing bugs and making the program behave unpredictably.

Rust's compiler is designed to prevent the formation of dangling references. To understand how this works, let us first look at the following C++ code. (***NOTE:** the variables and functions are named the way they are for the sake of guidance*)

```cpp
// C++ code that forms dangling references
#include <iostream>

int& createDanglingReference() {
    int value = 5;
    int& reference = value; // Creating a reference to a local variable
    return reference;
}

int main() {
    int& dangling_reference = createDanglingReference(); // Dangling reference formed
    std::cout << "Dangling reference: " << dangling_reference << std::endl;
    return 0;
}
```
In this example, we tried to create a local variable `value` and return a reference to it. However, when the function ends, the local variable `value` goes out of scope and is dropped, leaving the reference `dangling_reference` pointing to invalid memory. This is especially problematic when you consider the fact that the code actually compiles successfully. That said, in languages like C++, it is completely the programmer's responsibility to prevent the formation of dangling references - which is a difficult task due to human error tendencies.

Now, let us consider the Rust equivalent of the C++ code, which is shown below.
```rust
fn create_dangling_reference() -> &i32 {
    let value = 5;
    let reference = &value; // Creating a reference to a local variable
    reference
}

fn main() {
    let dangling_reference = create_dangling_reference(); // Compilation error occurs
    println!("Dangling reference: {}", dangling_reference);
}
```
This code will supposedly create a dangling reference just like the C++ code, however, before it will create one, the compilation will fail and Rust will return the following error message,
```
error[E0106]: missing lifetime specifier
 --> main.rs:1:29
  |
1 | fn create_dangling_reference() -> &i32 {
  |                             ^ expected named lifetime parameter
  |
  = help: this function's return type contains a borrowed value, but there is no value for it to be borrowed from

```
This prevents the human error of *accidently* making dangling references. Better safe than sorry!           