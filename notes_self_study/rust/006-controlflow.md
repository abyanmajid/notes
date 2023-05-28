# Control Flow
The two types of common control flow constructs that is used to decide when some block of code should run are:
- conditional expressions, which include `if` and `else if`
- loops, which include `while`, `for`, and `loop`

**TO NOTE** - Rust also has an additional control flow operator `match`, which is used for pattern matching. This markdown file does not include a section on `match`. Instead, read `00X-match`.

## Conditional expressions

### `if` expressions
`if` expressions are used to execute a block of code if a certain condition is true. That said, conditions must evaluate to a boolean, i.e. `true` or `false`.
#### Syntax
```rust
fn main() {
    // "if" as a statement
    if condition {
        // Code to execute when condition is true
    } else {
        // Code to execute when condition is false
    }
}
```
Here is a breakdown of the syntax:
- `if` evaluates whether `condition` is true or false. If true, it will execute the code enclosed by the `{}` that follows after the condition.
- `else` executes the other code enclosed by the `{}` that comes after, ONLY IF the condition is false.

Furthermore, since `if` is an expression, it can be bound to variable, like so:
```rust
fn main() {
    // "if" as an expression equated to a variable
    let var = if condition {
        // value if true
    } else {
        // value if false
    };
}
```

### `else if` expressions
`else if` expressions allow you to specify multiple conditions.

#### Syntax
```rust
fn main() {
    if condition_1 {
        // Code to execute when condition_1 is true
    } else if condition_2 {
        // Code to execute when condition_2 is true
    } else if condition_3 {
        // Code to execute when condition_3 is true
    } else if condition_n {
        // Code to execute when condition_n is true
    } else {
    // Code to execute when all conditions are false
    }
}
```
Simply put:
1. Upon `condition_1` being false, Rust will evaluate `condition_2`.
2. Upon `condition_2` being false, Rust will evaluate `condition_3`
3. The process repeats until the last condition, and if it too is false (in other words, all conditions are false), then Rust will execute the code in `else`.

## Loops

### `for` loop
A `for` loop tells the program to iterate over a collection or range of values.

### Syntax
```rust
fn main() {
    for item in collection {
    // Code to execute for each item
    }
}
```
**Explanation of the syntax:**
- `for` is a keyword that declares a `for` loop.
- `item` is a variable with a name of your choosing that indicates the current item being iterated over.
- `in` is a keyword that separates the variable from the iterable, such that Rust knows that `item` is a value from the `collection` that is currently being iterated over.
- `collection` refers to any group of values such as an array or a vector.
- `{}` encloses the block of code that ought to be executed by the `for` loop

### `while` loop
A `while` loop is a loop that repeats until a condition is met.

#### Syntax
```rust
fn main() {
    while condition {
    // Code to be executed indefinitely
    }
}
```
In short, the `while` keyword declares a white loop that repeats as long as the `condition` is true.

### `loop` loop
In Rust, `loop` is a loop that repeats a code indefinitely until the program is terminated. It is the equivalent of an unconditional, in other words infinite `while` loop.

### Syntax
```rust
fn main() {
    loop {
        // Code to repeat indefinitely
    }
}
```
`loop` will indefinitely repeat the code enclosed within the `{}` that comes after, until the program is forcefully terminated (e.g. through `CTRL+C`).

Alternatively, you can add an `if` expression that will stop the infinite loop using `break`, upon the `condition` being true.
```rust
fn main () {
    loop {
        // Code to repeat indefinitely
        // ...
        if condition {
            break; // Terminate the loop
        }
    }
}
```