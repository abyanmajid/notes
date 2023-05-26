# Variables, Mutability, Shadowing, and Constants

*Date written: May 26, 2023* \
*By: Abyan Majid*

- [Variables, Mutability, Shadowing, and Constants](#variables-mutability-shadowing-and-constants)
  - [Variables](#variables)
  - [Mutability vs. Shadowing](#mutability-vs-shadowing)
    - [Mutability](#mutability)
      - [Why variables are immutable by default (Benefits):](#why-variables-are-immutable-by-default-benefits)
    - [Shadowing](#shadowing)
  - [Constants](#constants)

## Variables
Variables are declared using the `let` keyword like so:
```rust
let x = 5; // variable with an initial value
let y: i32 = 5; // variable with an initial value and type annotation
let z: i32; // variable without an initial value
```
As shown above, from the lines:
- `let x = 5;`, you may choose NOT to provide a type annotation because Rust will still infer the type of the value assigned to the variable.
- `let y: i32 = 5;`, you may alternatively choose to provide a type annotation.
- `let z: i32;`, you may choose NOT to provide an initial value. However, in such cases, you MUST provide a type annotation.

## Mutability vs. Shadowing
Mutability and Shadowing are two ways to "change" the value of a variable over the course of your Rust program.

### Mutability
Variables in Rust are *immutable by default*. To make a variable mutable, add a `mut` keyword after `let`, like so:
```rust
let mut x = 5; // initializes a mutable variable 'x' with an initial value of 5.
x = 10; // changes the value of 'x' to 10.
```
Mutable variables allow you to change their values whenever after assignment.

#### Why variables are immutable by default (Benefits):
- **Safety** - value of an immutable variable cannot be changed by mistake, therefore helping prevent bugs related to unintended modifications.
- **Concurrency** - greatly achieves thread safety and data integrity in concurrent systems, such that immutable variables can be safely shared among multiple threads without the need for lock or synchronization mechanisms since they cannot be modified after assignment.
- **Compiler optimization** - allows the compiler to make better assumptions about the code, so as to optimize memory usage and generate more efficient machine code.

### Shadowing
Rust allows you to declare a new variable with the same name as the previous one - allowing you to reassign a new value and type, effectively "shadowing" or hiding the previous variable as shown below.
```rust
let x = 5;
let x = "Pizza"; // shadows the previous variable 'x'

// you can also shadow a mutable variable
let mut y = 10;
let y = y + 1;
```
Unlike mutability, shadowing lets you reassign a value to a variable and keep the variable immutable - ensuring that values are not inadvertedly modified in other parts of the code.

## Constants
Constants are declared using the `const` keyword and they MUST be given a type annotation, such as the following:
```rust
const full_name: &str = "Johan Liebert"; // string slice constant
```

Constants are always immutable and can be declared at any scope (i.e. local, global - inside or outside a function/block).