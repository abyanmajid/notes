# String

*Date written: June 12, 2023* \
*By: Abyan Majid*

- [String](#string)
  - [`String` vs. `str`](#string-vs-str)
  - [Creating a new string](#creating-a-new-string)
    - [Using `new`](#using-new)
    - [Using `to_string()` and `String::from()`](#using-to_string-and-stringfrom)
  - [Updating a string](#updating-a-string)
    - [Appending using `push_str()` and `push`](#appending-using-push_str-and-push)
    - [Concatenation with the `+` operator](#concatenation-with-the--operator)
    - [Concatenation with the `format!` macro](#concatenation-with-the-format-macro)
    - [You can't index into a string in Rust](#you-cant-index-into-a-string-in-rust)
      - [Accessing characters in `String` using the `chars()` method](#accessing-characters-in-string-using-the-chars-method)
      - [Using the `bytes()` method to return the raw byte of a `String`](#using-the-bytes-method-to-return-the-raw-byte-of-a-string)

## `String` vs. `str`
When we say "strings" in Rust, we are referring to the `String` type and the string slice `str`. Here's to clearly differentiate `String` from `str`:
- `str` is actually the only string defined in the core of Rust. It is a fixed sequence of UTF-8 encoded bytes. It's often called a "string slice" because it's like a read-only view to a larger string data.
- `String` comes from Rust's standard library. It is a growable, mutable, and owned UTF-8 encoded string type. It's like when you have a paper where you can write and erase texts. It's what you work with when you want to create and update a string value.

## Creating a new string

### Using `new`
You can use the `new` function to create a new empty string, like so:
```rust
fn main() {
    let s = String::new();
    let mut s = String::new(); // mutable
}
```

### Using `to_string()` and `String::from()`
You can create a string with initial contents using either the `to_string()` method or the `String::from()` function.
```rust
fn main() {
    data = "contents"
    let a = data.to_string();

    // Direct use of to_string()
    let b = "contents".to_string();

    // Using String::from()
    let c = String::from("contents"); 
}
```
As shown above, you can actually use the `to_string()` method directly as a postfix to a string data rather than a variable storing a string data.

## Updating a string
### Appending using `push_str()` and `push`
You can use the `push_str()` method to append a string slice to an existing `String`, like so:
```rust
fn main() {
    let mut name = String::from("Johan");
    name.push_str(" Liebert");
}
```

Alternatively, you can use the `push()` method to add just a single character to an existing `String`, although there's really no reason to use `push()` over `push_str()`...
```rust
fn main() {
    let mut name = String::from("Johan Lieber");
    name.push('t');
}
```

### Concatenation with the `+` operator
You can use the `+` operator to combine two existing strings like so:
```rust
fn main() {
    let first_name = String::from("Johan");
    let last_name = " Liebert".to_string();
    let result = first_name + last_name;
}
```

### Concatenation with the `format!` macro
You can also combine two existing strings by formatting and concatenating them with the `format!` macro, like so:
```rust
fn main() {
    let name = "Johan";
    let age = 28;
    let greeting = format!("Hello, my name is {} and I'm {} years old.", name, age);   
}
```

### You can't index into a string in Rust
Rust doesn't allow you to index into a string. The reason for this is related to how strings are stored in memory. In Rust, strings are encoded as UTF-8, which means that each character in a string can take up a variable amount of bytes. So, it's hard to guarantee that each character will occupy the same amount of bytes.

Take the string `"नमस्ते"` ("Namaste" in Hindi) for example. Here's how the string represented in UTF-8 encoding:

- न -> [0xE0, 0xA4, 0xA8] (3 bytes)
- म -> [0xE0, 0xA4, 0xAE] (3 bytes)
- स -> [0xE0, 0xA4, 0xB8] (3 bytes)
- े -> [0xE0, 0xA5, 0x8D] (3 bytes)
- त -> [0xE0, 0xA4, 0xA4] (3 bytes)
- े -> [0xE0, 0xA5, 0x87] (3 bytes)

As you can see, each character takes different amount of bytes! If we were to index into a character, it'd be difficult to guarantee that we would land on the vlaid character boundary.

#### Accessing characters in `String` using the `chars()` method
Instead, to access a specific character from a string, we can use the `chars()` method to iterate over the characters like so:
```rust
fn main() {
    for character in "नमस्ते".chars() {
        println!("{}", character);
    }
}
```
This code will print
```
न
म
स
्
त
े
```
#### Using the `bytes()` method to return the raw byte of a `String`
You can iterate through a string and use the `bytes()` method to attain the number of byte taken up by each character, like so:
```rust
fn main() {
    for byte in "नमस्ते".chars() {
        println!("{}", byte);
    }
}
```
This code outputs the 18 bytes that make up the `"नमस्ते"` string:
```
224
164
168
224
// ... etc
```