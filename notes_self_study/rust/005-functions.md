# Functions

*Date written: May 28, 2023* \
*By: Abyan Majid*

- [Functions](#functions)
  - [Syntax](#syntax)
    - [The special `main` function](#the-special-main-function)
    - [Example function definition and calling](#example-function-definition-and-calling)

## Syntax
A *function* is a block of code that does a certain task(s) and is reusable or callable in other parts of the program.

The syntax of a function in Rust is as shown below.
```rust
fn function_name(parameter1: Type1, parameter2: Type2) -> Return_Type {
    // Code to do certain tasks with or without using the parameters.
    // Optional return statement
}

fn main() {
    function_name(parameter1, parameter2) // calls function_name
}
```
where,
- `fn` is a keyword that defines a function.
- `function_name` is the name you give for your function.
- `()` are parantheses that may contain parameters. That said, parameters are not required and the parantheses may be left empty.
  - `parameter: Type` assigns a parameter of a certain type to the function. You must annotate the type should your function have parameters, however many there are.
- `->` and `Return_Type` tells Rust that your function returns a value of a certain type. You must annotate the type should your function return a value. Should it not, then you may not add `->` and `Return_Type`
- `{}` encloses the body of the function where you would write code to do certain tasks and include a return statement when needed.

To call a function, you type `function_name(parameter1, parameter2)` (include however many parameters there are).

### The special `main` function
In Rust, the `main` function is a required special function that serves as the entry point of the program. It is the first function that gets executed when you run a Rust program.

Below is the syntax of the `main` function
```rust
fn main() {
    // Code
}
```

### Example function definition and calling
Below is a simple function that adds two integers and returns the result.
```rust
fn add_numbers(a: i32, b: i32) -> i32 {
    let result = a + b;
    result // Implicit return statement
}

fn main() {
    let sum = add_numbers(5, 3);
    println!("The sum is: {}", sum);
}
```
It will perform addition between `5` and `3`, which gives `8`, therefore printing: `The sum is: 8`

