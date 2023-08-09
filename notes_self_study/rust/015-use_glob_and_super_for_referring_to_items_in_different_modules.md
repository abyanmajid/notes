# `use`, `*`, and `super` for Referring to Items in Different Modules.

*Date written: June 10, 2023* \
*By: Abyan Majid*

- [`use`, `*`, and `super` for Referring to Items in Different Modules.](#use--and-super-for-referring-to-items-in-different-modules)
  - [Overview of `use`, `*`, and `super`](#overview-of-use--and-super)
  - [Bringing items into scope with the `use` keyword](#bringing-items-into-scope-with-the-use-keyword)
    - [Bringing ALL items from a module or collection with `*` (the *glob operator*)](#bringing-all-items-from-a-module-or-collection-with--the-glob-operator)
  - [Referring to items in outer modules with `super`](#referring-to-items-in-outer-modules-with-super)

In this note, I discuss how `use`, `*`, and `super` can be utilized to navigate through the module hierarchy and refer to names in different modules.

## Overview of `use`, `*`, and `super`
Here's how `use`, `*`, and `super` work in short:
- `use` — it is a keyword used to bring items into scope without having to specify their full paths each time.
  - General syntax for bringing modules into scope: `use mod_1::mod_2::until::mod_n;`
  - General syntax for bringing one function from another module into scope: `use mod_1::mod_2::until::mod_n::function_name;`
  - General syntax for bringing variants of an enum into scope: `use enum_name::{variant_1, variant_2, variant_n}`
- `*` (known as the *glob operator*) — it is an operator used in conjunction with the `use` keyword in order to import ***ALL*** items from a module into scope.
  - General syntax for a collection like an enum: `use collection::*`
- `super` — it is a keyword used to access items from parent or outer modules.
  - General syntax: `super::outer_mod_1::outer_mod_2::until::outer_mod_n`

## Bringing items into scope with the `use` keyword
`use` is a keyword in Rust that allows you to bring items from another module into scope. To help illustrate how it works, let's take a look into the example in Listing 1.
```rust
// Listing 1
// main.rs
pub mod module_1 {
    pub mod module_2 {
        pub mod module_3 {
            pub fn func_1() {}
            pub fn func_2() {}
            pub fn func_3() {}
        }
    }
}

fn main() {
    module_1::module_2::module_3::func_1()
    module_1::module_2::module_3::func_2()
    module_1::module_2::module_3::func_3()
}
```
Here, we have a series of nested modules, and we used the full paths in order to call functions `func_1`, `func_2`, and `func_3`, all of which are items of `module_3`.

As you can see, the paths to access items held by modules that are positioned deep in the hierarchy can be long and tedious to write everytime. Toward addressing this issue, Rust provides a keyword `use` which you can utilize to bring a module into scope. Here's how we can revise our calling of the functions in `module_3` to be more concise by implementing the `use` keyword:
```rust
// Listing 2
// main.rs
...
use module_1::module_2::module_3;

fn main() {
    module_3::func_1();
    module_3::func_2();
    module_3::func_3();
}
```
Alternatively, we can also utilize `use` to bring ONE specific item into scope. Let's say we want to only call `func_1`, we can choose to write this instead:
```rust
// Listing 3
// main.rs
...
use module_1::module_2::module_3::func_1;

fn main() {
    func_1();
}
```
We can also utilize `use` to bring multiple, but not all, items into scope by enclosing the items in `{}`, such as the following.
```rust
// Listing 4
// main.rs
enum Weather {
    Sunny,
    Cloudy,
    Rainy,
}

use Weather::{Sunny, Cloudy};

fn main() {
    let today_weather = Sunny;
    let yesterday_weather = Cloudy;
}
```
Yes, we can also use `use` to bring variants of an enum into scope.

### Bringing ALL items from a module or collection with `*` (the *glob operator*)
We can use the glob operator, `*`, to bring all items in a module or collection into scope. Here's an example, using our `Weather` enum from listing 4.
```rust
// Listing 5
// main.rs
enum Weather {
    Sunny,
    Cloudy,
    Rainy,
}

use Weather::*;

fn main() {
    let today_weather = Sunny;
    let yesterday_weather = Cloudy;
    let tommorow_weather = Rainy;
}
```

## Referring to items in outer modules with `super`
`super` is a keyword you can use to move up the module hierarchy - it allows you to refer to items in a parent or outer modules from within a nested module. See listing 6 for an example.

```rust
// Listing 6
mod outer {
    pub fn func_outer() {}

    pub mod inner {
        pub fn func_inner() {
            super::func_outer();
        }
    }
}

fn main() {
    outer::inner::func_inner();
}
```
In this example, we are executing `func_inner`, which in turn tries to execute `func_outer`. However, `func_outer` is within the outer module `outer`. So, we used `super` as a prefix to our calling of `func_outer` such that `super::func_outer()` successfully calls `func_outer`.

Alternatively, we could have also written `::outer::func_outer()`,
```rust
// Listing 7
...
pub fn func_inner() {
    ::outer::func_outer();
}
...
```
instead of `super::func_outer()`, which would instruct Rust to refer to `func_outer` from the root module instead.

It is imperative that you understand the difference, therefore I reiterate:
- `super::func_outer()` tells Rust to move up one module to `outer` in order to refer to `func_outer`
- `::outer::func_outer()` tells Rust to refer to `func_outer` by searching it from the root module.

It is generally recommended that you refer to items from an outer module using `super`, because referring it from the root would make for a longer code the deeper you are in the module hierarchy.