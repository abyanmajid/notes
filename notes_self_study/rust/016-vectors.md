# Vectors

*Date written: June 10, 2023* \
*By: Abyan Majid*

- [Vectors](#vectors)
  - [Defining a new vector](#defining-a-new-vector)
  - [Updating a vector](#updating-a-vector)
  - [Dropping a vector drops its elements](#dropping-a-vector-drops-its-elements)
  - [Reading elements of a vector](#reading-elements-of-a-vector)
  - [Iterating over the elements of a vector](#iterating-over-the-elements-of-a-vector)
  - [Storing elements of different types in a vector using an enum](#storing-elements-of-different-types-in-a-vector-using-an-enum)

Vectors are growable data structure that allows you to store and manipulate elements of the same type. Vectors are represented by the `Vec<T>` type, where `T` is the type of elements that can be stored in the vector.

## Defining a new vector
The two general syntax for defining a vector are:
```rust
let v: Vec<T> = Vec::new(); // creates an empty vector `v`
let v: Vec<T> = !vec[vaL_1, val_2, ..., val_n]; // creates a vector `v` with initial values
```
The former uses the `Vec::new()` function which creates an empty vector, meanwhile the latter uses the `vec![val_1, val_2, ... val_n]` macro which creates a vector with initial values. `T` is the type of elements in the vector, hence is to be changed accordingly. Here's code that demonstrates the syntax in use:

```rust
fn main() {
    // Defining empty vectors
    let a: Vec<i32> = Vec::new();
    let mut b: Vec<i32> = Vec::new(); // mutable

    // Defining vectors with initial values
    let c: Vec<i32> = vec![1, 2, 3];
    let mut d: Vec<i32> = vec![1, 2, 3]; // mutable
}
```
Remember to add `mut` should you plan to update a vector later.

## Updating a vector
We can use the `push` method to add an element to the END of a vector. Alternatively, you can use the `extend()` method with the `vec!` macro as an argument to add MULTIPLE elements to the end of a vector. See the example below.
```rust
fn main() {
    let mut v = Vec::new();

    v.push(1);
    v.extend(vec![2, 3, 4, 5])
}
```

As shown above, you can omit defining type for a vector because Rust knows that all elements in a vector are of the same type, therefore Rust will infer the type once you add values to it

## Dropping a vector drops its elements
As with any memory allocation in Rust, a vector will be dropped once it goes out of scope. When a vector is dropped, all of its elements will too be dropped.
```rust
fn main() {
    {
        let v = vec![1, 2, 3];
        // Do something with 'v'

    } // 'v' goes out of scope, so is dropped.
}
```

## Reading elements of a vector
To read elements of a vector, you can either use the indexing syntax `&vector_var[idx]` or the `get()` method. See the following example:
```rust
fn main() {
    let v = vec![1, 2, 3, 4, 5];

    let third: &i32 = &v[2]; // using the indexing snytax
    let third: Option<&i32> = v.get(2); // using the get() method
}
```

## Iterating over the elements of a vector
You can iterate over the elements of a vector using the `for` loop. ***If the vector is IMMUTABLE***, you can instruct Rust to take an immutable reference `&vector_name` to each element in the vector like so:
```rust
let v = vec![1, 2, 3];

for element in &v {
    // Access the elements immutably
    println!("Element: {}", element);
}
```

***If the vector is MUTABLE***, you can instruct Rust to take a mutable reference `&mut vector_name` to each element in the vector, and when you want to modify the elements, you add the dereference operator `*` as a prefix to the $i$-th value, i.e. item being iterated. See the following:
```rust
let mut v = vec![1, 2, 3];

for element in &mut v {
    // Access and modify the elements
    *element *= 2; // Multiply each element by 2
    println!("Modified Element: {}", element);
}
```

## Storing elements of different types in a vector using an enum
Remember that a vector can only store elements of the same type. However, you can still store elements of different type using an enum, because all enum variants are inherently classified under the same enum type. Here's an example:
```rust
enum Value {
    Age(i32),
    Gpa(f64),
    Name(String),
}

fn main() {
    let values: Vec<Value> = vec![
        Value::Age(28),
        Value::Gpa(4.0),
        Value::Name(String::from("Johan Liebert")),
    ];
}

```