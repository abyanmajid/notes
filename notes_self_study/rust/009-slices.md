# Slices

*Date written: May 30, 2023* \
*By: Abyan Majid*

A slice is a way to reference, or take a portion of a collection of values such as an array or vector. In Rust, a slice is denoted by the syntax `&collection[start..end]` or `&collection[start..=end]`, where the former is for exclusive slicing and the latter is for inclusive slicing. To break down into specifics:
- `&collection` is a *reference* to the variable `collection` of which value is a *collection* of values, such as an array or vector.
- `[]` are square brackets that contain the slice information
- `start` is the index of the FIRST value of the portion to be referenced
- `end` is the exclusive index of the LAST value of the portion to be referenced, such that the last value in the reference would be the value of `collection` with  index `end-1`
  - `=` is an additional slicing operator that allows inclusive slicing; with it, you can include the value of index `end` into the reference.
- `..` is sort of like saying "until", such that the slice points to values in collection of index `start` "until" `end`.

Below is an example of a slice in Rust

```rust
fn main() {
    let numbers = [1, 2, 3, 4, 5];

    // Exclusive slice
    let slice1 = &numbers[1..3];
    println!("Slice 1: {:?}", slice1); // Output: [2, 3]

    // Inclusive slice (with the "=" slicing operator)
    let slice2 = &numbers[2..=4];
    println!("Slice 2: {:?}", slice2); // Output: [3, 4, 5]
}
```