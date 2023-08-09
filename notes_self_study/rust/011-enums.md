# Enums

*Date written: May 30, 2023* \
*By: Abyan Majid*

- [Enums](#enums)
  - [Defining an Enum](#defining-an-enum)
  - [Assinging a variant to a variable](#assinging-a-variant-to-a-variable)
  - [The `Option` enum](#the-option-enum)
    - [The problem with `Option`](#the-problem-with-option)
    - [Pattern matching](#pattern-matching)

***Enums***, short for *enumerations*, in Rust is a feature that allows you to define a type by listing its possible values. ***Enums*** may seem similar to ***structs***, but they are not. 

**Distinction between structs and enums —** ***Structs*** are used to create a type that represents some information through multiple fields, meanwhile ***enums*** are used to create a type with constrained set of values so as to allow pattern matching to see which values

## Defining an Enum
To define an enum in Rust, you use the keyword `enum` followed by the name of the enum. Then, specify the variants within `{}`, as shown below.
```rust
enum Weather {
    Sunny,
    Cloudy,
    Rainy,
    Windy(f32), // Variant with associated data - representing, say, wind speed.
}
```
In the example above, we created an enum `Weather` which has four possible variants, including:
- `Sunny`
- `Cloudy`
- `Rainy`
- `Windy`

Additionally, you may have noticed that all of the variants do not have an associated data, except `Windy`, which has an associated data of type `f32` (representing, say, wind speed). This shows that you are not required to associate a variant with an existing type in Rust.

## Assinging a variant to a variable
Once you have defined an enum, you can create variables that hold a specific variant. To do that, you specify the name of the enum followed by a double colon (`::`) and the chosen variant. That said, the syntax for assigning variants to a variable is `let var = enum_name::variant`. Take a look at the following example.
```rust
fn main() {
    let today_weather = Weather::Sunny;
    let tomorrow_weather = Weather::Windy(25.5);
}
```

In this case, we assigned the `Sunny` variant from the `Weather` enum to the variable `today_weather`, such that it holds the information that *today's weather is Sunny*. On the other hand, the variable `tommorow_weather` holds the variant `Windy` from the `Weather` enum, as well as an associated floating-point number `25.5`, denoting its wind speed.

## The `Option` enum
The `Option` enum is a commonly used enum in Rust that helps deal with situations where *a value may or may not exist*; It helps eliminate null-related errors at compile-time. Below is the `Option` enum in Rust.
```rust
enum Option<T> {
    Some(T),
    None,
}
```
Here's a simple breakdown of the enum:
- `Option<T>` represents the presence or absence of a value of type `T`. That said, `T` is to be substituted by any type such as `String`, `i32`, etc.
- `Some(T)` is a variant that indicates that the value of type `T` is ***present*** and that whatever value you passed as an argument to `Some` can be held by the variable to which `Some(T)` is assigned, and you can access it. Suppose the following assignment of `Some(T)`:
    ```rust
    fn main() {
        let x = Some(5);
    }
    ```
    In this case, `Some` indicates that `5` is present, so it is then assigned to the variable `x` for you to access and work with.

- `None` is a variant that indicates the absence of a value. It's like an empty placeholder to say that "nothing is here." Here's how you would assign `None` to a variable:
    ```rust
    fn main() {
        let y: Option<i32> = None;
    }
    ```

### The problem with `Option`
There are plenty ways you can unintentionally produce an error when working with the `Option` enum, for its which variants are abitrary values. The following is an example of an error that may occur:

```rust
fn main() {
    let option: Option<i32> = None;
    
    let value: i32 = option; // Compilation error: mismatched types
    println!("Value: {}", value);
}
```

In this case, we have an `Option<i32>` variable called `option`, which holds the variant `None`. Then, we tried to assign the value of `option` to another variable `value`. This code gives us a "mismatch" compilation error because we tried to assign `None` to a variable that only accepts values of type `i32`.

```
error[E0308]: mismatched types
 --> src/main.rs:4:23
  |
4 |     let value: i32 = option;
  |                       ^^^^^^ expected `i32`, found enum `Option`
  |
  = note: expected type `i32`
             found enum `Option<i32>`

error: aborting due to previous error
```

### Pattern matching
Rust promotes a safer approach to handling optional values using pattern matching, in order to avoid errors like these. Specifically, there are two additional control flow constructs you can use for pattern matching in rust, which are:
- `match`
- `if let`

I will explain pattern matching using these control flow constructs in <a href="https://github.com/abyanmajid/study-notes/blob/main/notes_self_study/rust/012-match_and_if_let_control_flow_constructs.md">***012-match_and_if_let_control_flow_constructs.md***</a>