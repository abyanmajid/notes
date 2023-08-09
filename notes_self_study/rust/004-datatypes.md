# Data Types

*Date written: May 26, 2023* \
*By: Abyan Majid*

- [Data Types](#data-types)
  - [Quick overview of data types](#quick-overview-of-data-types)
  - [Scalar types](#scalar-types)
    - [Integers](#integers)
    - [Floating-point numbers](#floating-point-numbers)
    - [Booleans](#booleans)
    - [Character](#character)
  - [Compound types](#compound-types)
    - [Tuples](#tuples)
      - [Destructuring a tuple](#destructuring-a-tuple)
      - [Accessing values in a tuple; indexing](#accessing-values-in-a-tuple-indexing)
    - [Arrays](#arrays)
      - [Accessing a value in an array; indexing](#accessing-a-value-in-an-array-indexing)
  - [Implicit type conversions](#implicit-type-conversions)

## Quick overview of data types

| Scalar types          | Annotation 1                       | Annotation 2                       |
|-----------------------|------------------------------------|------------------------------------|
| Integer               | `i8`, `i16`, `i32`, `i64`, `isize` | `u8`, `u16`, `u32`, `u64`, `usize` |
| Floating-point number | `f32`                              | `f64`                              |
| Boolean               | `bool`                             |                                    |
| Character             | `char`                             |                                    |

| Compound types | Value                | Indexing syntax          | Each element may have different type |
|----------------|----------------------|--------------------------|--------------------------------------|
| Tuple          | `(val1, val2, val3)` | `var.idx` e.g. `var.0`   | Yes                                  |
| Array          | `[val1, val2, val3]` | `var[idx]` e.g. `var[0]` | No                                   |

## Scalar types
A *scalar* type represents a single value, and like most other programming languages, Rust has four primary scalar types:
- Integers
- Floating-point numbers
- Booleans
- Characters

### Integers
An *integer* is a number without a fractional component and it can either be:
- **signed**, starting with `i`, meaning that the integer can be a negative number therefore it needs a *sign* to indicate it
- or **unsigned**, starting with `u`, meaning that the integer is always a positive number therefore a *sign* is unnecessary.

| Length | Signed | Unsigned |
|--------|--------|----------|
| 8-bit  | i8     | u8       |
| 16-bit | i16    | u16      |
| 32-bit | i32    | u32      |
| 64-bit | i64    | u64      |
| arch   | isize  | usize    |

Rust's default integer type is `u32` which is generally the fastest, even on 64-bit systems.

### Floating-point numbers
A *floating-point* number is a number with a decimal point(s). In Rust, a floating-point type is written as `f32` or `f64`, which are respectively 32 and 64-bits long in size.

Rust's default is `f64` because it is capable of greater precision than `f32`.



### Booleans
A boolean type accepts two values: `true` and `false`, and is annotated as `bool`.

You can usually omit nnotating boolean types because they can easily be inferred by Rust.

### Character
A character type is annotated as `char` and its value is written in between single quotes.

You can usually omit annotating character types because they can easily be inferred by Rust.
```rust
let a: char = 'X';
let b = 'X';
```

## Compound types
*Compound* types group multiple values of another type(s) into one type, which can be either a *tuple* or an *array*.

### Tuples
A *tuple* is a way to group multiple values that allows each value to be of a different type from the other.
```rust
fn main() {
    let a: (i32, f64, char) = (-1, 2.0, 'A');
    let b = (1, 2, 3);
}
```

#### Destructuring a tuple
You can also break a tuple into its different values and respective types bind each into a variable, such as the following example:
```rust
fn main() {
    let tuple = (1, 2, 3);
    let (x, y, z) = tuple;
}
```
#### Accessing values in a tuple; indexing
You can access values in a tuple by adding a period ( . ), followed by the index, as demonstrated in the example below.
```rust
fn main() {
    let cords: (f64, f64, f64) = (14.6, 72.0, 35.1);

    let x = cords.0; // binds 14.7 to 'x'
    let y = cords.1; // binds 72.0 to 'y'
    let z = cords.2; // binds 35.1 to 'z'
}
```

### Arrays
An array is a way to group multiple values where all values must have the same type. Unlike in other languages, arrays in Rust have a fixed length; they cannot grow or shrink.

To define an array, enclose the collection of values with square brackets as demonstrated in the example below.
```rust
fn main() {
    let a = [1, 2, 3, 4, 5]; // an array of 5 integers
    let b = ["John", "Melvin", "Elizabeth", "Valentin"] // an array of 4 strings
}
```

#### Accessing a value in an array; indexing
You can access values in a tuple by adding the index enclosed by square brackets as shown in the example below.
```rust
fn main() {
    let a = ["John", "Melvin", "Elizabeth", "Valentin"];
    let person_1 = a[0];
    let person_2 = a[1];
}
```

## Implicit type conversions
Rust may implicitly convert a type to another depending on the compatibility of the two types. Below are possible implicit type conversions in Rust
- ***Numeric literals*** - Numeric literals can be implicitly converted to different numeric types based on the context. For instance, `42` can be implicitly converted to `i32`, `u32`, `f32`, etc.
```rust
fn main() {
    let x: i32 = 42; // Implicit conversion of the numeric literal to i32
    let y: f64 = 3.14; // Implicit conversion of the numeric literal to f64
}
```
- ***Reference coercion*** - Rust provides automatic reference coercion when borrowing values. For instance, if you have a function that expects a `&str` argument, you can pass a `String` as an argument, and Rust will implicitly coerce the `String` to a `&str` by taking a reference to the content of the `String`.
```rust
fn print_string(s: &str) {
    println!("{}", s);
}

fn main() {
    let my_string = String::from("Hi");
    print_string(&my_string); // Pass a reference to the String as &str
}
```