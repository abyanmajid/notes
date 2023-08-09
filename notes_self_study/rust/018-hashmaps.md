# Hash Maps

*Date written: June 12, 2023* \
*By: Abyan Majid*

- [Hash Maps](#hash-maps)
  - [Creating a new hash map](#creating-a-new-hash-map)
    - [Creating an empty hash map using `new`](#creating-an-empty-hash-map-using-new)
      - [Adding new key-value pairs to an existing hashmap using `insert`](#adding-new-key-value-pairs-to-an-existing-hashmap-using-insert)
    - [Creating a hash map with initial key-value pairs using `collect`](#creating-a-hash-map-with-initial-key-value-pairs-using-collect)

A *hash map* in Rust is a collection type from the standard library (i.e. `std::collections::HashMap`) that allows you to store and retrieve key-value pairs. It is denoted as `HashMap<K, V>`, where `K` is the type of **KEYS** and `V` is the type of **VALUES**.

## Creating a new hash map
Whenever we want to create a new hashmap, or do stuff with hashmaps in general, we need to bring the `HashMap` type from Rust's standard library into scope using the `use` keyword.

### Creating an empty hash map using `new`
To create a new empty hash map, we can use the `new` function as we did with vectors and strings. Here's an example:
```rust
fn main() {
    use std::collections::HashMap;

    let a = HashMap::new();
    let mut b = HashMap::new(); // mutable
    let mut c: HashMap<String, i32> = HashMap::new(); // explicit type annotation   
}
```
You may choose not to explicitly annotate the type of `K` and `V` as Rust will try to infer the when you add key-value pairs to the hash map later.

#### Adding new key-value pairs to an existing hashmap using `insert`

We can use the `insert` method to add key-value pairs to an existing hashmap like so:
```rust
fn main() {
    use std::collections::HashMap;

    let heights = HashMap::new();
    
    heights.insert(String::from("Johan Liebert"), 182);
    heights.insert(String::from("Guts"), 204);
}
```

### Creating a hash map with initial key-value pairs using `collect`
You can create a hash map with initial values using the `collect` method on a vector of tuples, one containing the keys, while the other contains the values. Here's an example from the "Rust Programming Language" book:
```rust
fn main() {
    use std::collections::HashMap;

    let teams  = vec![String::from("Blue"), String::from("Yellow")];
    let initial_scores = vec![10, 50];

    let scores: HashMap<_, _> = teams.iter().zip(initial_scores.iter()).collect();
}
```

---

***Unfinished note ! (July 12, 2023)***