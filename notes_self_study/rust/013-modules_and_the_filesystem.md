# Modules and the Filesystem

*Date written: June 9, 2023* \
*By: Abyan Majid*

Just as how you can organize your program by grouping lines of code into reusable functions, you can also further organize your program by grouping functions into modules.

A *module* is like a container that allows you to group related functionalities together.

## Overview of module filesystem rules
Below are rules of Rust's module filesystem (both of which are explained throughout this note):
1. If a module `x` has ***NO*** submodules,
   1. extract the functionalities of `x` in `src/x.rs`,
   2. import `x` by writing `mod x;` in `src/lib.rs` (if creating a library crate) or `src/main.rs` (if creating a binary)
2. If a module `x` ***HAS*** submodules, e.g. `y` and `z`,
   1. create a new directory `src/x`
   2. create a new rust file `src/x/mod.rs` and extract the functionalities of `x` in it.
   3. create two new rust files `src/x/y.rs` and `src/x/z.rs` and extract the functionalities of `y` and `z` in their respective files.
   4. import `x`, and its submodules `y` and `z` by writing the following in `lib.rs` (if creating a library crate) or `main.rs` (if creating a binary).

        ```rust
        // lib.rs
        // Import the `x` module from src/x/mod.rs
        mod x;

        mod x {
            pub mod y; // import `y` submodule from src/x/y.rs
            pub mod z; // import `z` submodule from src/x/z.rs
        }
        ```

***NOTE:*** the `pub` keyword is not discussed in this note. To learn about it, read <a href="https://github.com/abyanmajid/study-notes/blob/main/notes_self_study/rust/014-visibility_control_with_pub.md">***014-visibility_control_with_pub.md***</a>

## Module definition with the `mod` keyword

To define a module, you use the `mod` keyword as a prefix to the name of the module as shown in Listing 1.

```rust
// Listing 1
// a library crate `library`
mod module_name {
    fn function_1() {
    }

    fn function_2() {
    }
}
```
In order to call a function inside a module, you use the namespace syntax `::`, such that in order to call `function_1` in the example above, you would type:
```rust
module_name::function_1()
```

You can even group modules into another module, as shown below.
```rust
// Listing 2
// a library crate `library`
mod module_name {
    fn function_1() {
    }
    
    fn function_2() {
    }
    mod another_module {
        fn another_function() {
        }
    }
}
```

***Modules form a hierarchy***. In the case of listing 2, the hierarchy is as follows:
```
library
-- module_name
---- another_module
```

I hope you see how organizing your code into hierarchies of modules will help in organizing and keeping track of your code as your project or library becomes larger and more complex.

## Moving Modules into Other Files

To futher organize your code, you can and should split up your project into different files, so that not everything lives in `main.rs` or `lib.rs`. Because if your project is becoming lengthy, it will be difficult to navigate and find certain code when everything is contained in just one file!

Let us start with the example shown in Listing 3 below.
```rust
// Listing 3 (taken from the "The Rust Programming Language" book)
// lib.rs
mod client {
    fn connect() {
    }
}

mod network {
    fn connect() {
    }

    mod server {
        fn connect() {
        }
    }
}
```
Say that we want to move the `client` module to another file, such that in `lib.rs`, we would instruct Rust to search for the `client` module. First, we have to create a new file in the `src` directory called `client.rs`. In it, we put the code inside the `client` module as shown in Listing 4.
```rust
// Listing 4
// client.rs
fn connect() {
}
```
Then, in the `lib.rs` we can simply write `mod client;` instead (See listing 5).
```rust
// Listing 5
// lib.rs
mod client;

mod network {
    fn connect() {
    }

    mod server {
        fn connect() {
        }
    }
}
```
`mod client;` will instruct Rust to search in another location for the code defined within the `client` module. That's pretty much how you would place the functionalities of a module in another file.

### Extracting a submodule
**But, what if the module has a submodule?** Such as how, in listing 4, the module `network` has a submodule `server`?

In this case, you will still be able to extract the code within the `network` module to another file `network.rs`, such `lib.rs` will contain code in Listing 6,
```rust
// Listing 6
// lib.rs
mod client;
mod network;
```

and `network.rs` will contain code in Listing 7.

```rust
// Listing 7
// network.rs
fn connect() {
}

mod server {
    fn connect() {
    }
}
```
If you did this, your program will compile sucessfully. However, you will not be able to extract the `server` module the same way. If you write `mod server;` in `network.rs` and extract the code in a new file, `server.rs`, your program will not compile successfully and Rust will return the following error:
```
$ cargo build
   Compiling communicator v0.1.0 (file:///path_to_library)
error: cannot declare a new module at this location
 --> src/network.rs:4:5
  |
4 | mod server;
  |     ^^^^^^
  |
note: maybe move this module `src/network.rs` to its own directory via `src/network/mod.rs`
 --> src/network.rs:4:5
  |
4 | mod server;
  |     ^^^^^^
note: ... or maybe `use` the module `server` instead of possibly redeclaring it
 --> src/network.rs:4:5
  |
4 | mod server;
  |     ^^^^^^
```

***Why is this happening —*** To help illustrate why Rust returned this error, suppose another example of module hierarchy as shown below:
```
library
-- client
---- network
------ client
```
Here's the specific `lib.rs` example:
```rust
// Listing 8 (taken from the "The Rust Programming Language" book)
// lib.rs
mod client {
    fn connect() {
    }
}

mod network {
    fn connect() {
    }

    mod client {
        fn connect() {
        }
    }
}
```
It's the same code as the previous, except the `server` submodule of `network` has been renamed as `client`.

So, following our method of extracting modules, we would put the functionality of the `client` module to `client.rs`, and the functionality of the `network` module to `network.rs`. But, we would not be able to extract the `client` submodule of `network`, because there already exists a `client` module! And we would also not be able to put the code for both `client` modules in `client.rs`, as demonstrated in Listing 9,
```rust
// Listing 9
// client.rs
fn connect() {
}

fn connect() {
}
```
because Rust would not be able to tell which is supposed to belong to `client` and which is supposed to belong to `network::client`.

***How to correctly extract a submodule*** So, for the code,
```rust
// Listing 8
mod client {
    fn connect() {
    }
}

mod network {
    fn connect() {
    }

    mod client {
        fn connect() {
        }
    }
}
```
we can extract `network` and `network::client` by following these steps:
1. Make a new directory `src/network`
2. Then, create `src/network/mod.rs`. In it, include the code for the `network` module as well as a line `mod client;`
3. Finally, create `src/network/client.rs` and include the code for the `network::client` module in it.

So, here's an overview of the new filesystem for Listing 8 that compiles successfully.

```
src
-- lib.rs
-- client.rs
---- network
------ mod.rs
------ client.rs
```