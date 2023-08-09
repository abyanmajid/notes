# Visibility control with `pub`

*Date written: June 9, 2023* \
*By: Abyan Majid*

- [Visibility control with `pub`](#visibility-control-with-pub)
  - [Overview of privacy rules](#overview-of-privacy-rules)
  - [Privacy in Rust](#privacy-in-rust)
  - [Making a module or function public](#making-a-module-or-function-public)

## Overview of privacy rules
Here are privacy rules in Rust which are discussed throughout this note:
1. If an item is public, it can be accessed through any of its parent modules.
2. If an item is private, it can be accessed only by its immediate parent module and any of the parent’s child modules.

Source: <a href="https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/book/second-edition/ch07-02-controlling-visibility-with-pub.html">***The Rust Programming Language***</a> book.

## Privacy in Rust
By default, all code in Rust are private. That is, a line of code can *only* be used within its own module, and not anywhere else. Let us take a look at an example library crate shown in Listing 1 and 2.

```rust
// Listing 1
// src/lib.rs
mod outer;
```
```rust
// Listing 2
// src/outer/mod.rs
fn func_1() {
}

mod inner;
```
```rust
// Listing 3
// src/outer/inner.rs
fn func_2() {
}
```

If we try to run `cargo build`, we will be returned the warning messages below.
```
$ cargo build
   Compiling library_crate_example v0.1.0 (C:\Users\user\projects\library_crate_example)
warning: function `func_1` is never used
 --> src\outer\mod.rs:1:4
  |
1 | fn func_1() {
  |    ^^^^^^
  |
  = note: `#[warn(dead_code)]` on by default

warning: function `func_2` is never used
 --> src\outer\inner.rs:1:4
  |
1 | fn func_2() {
  |    ^^^^^^

warning: `library_crate_example` (lib) generated 2 warnings
    Finished dev [unoptimized + debuginfo] target(s) in 0.95s
```
Hmm... these warnings do not tell us a lot do they? After all, we were only creating a library - the code we wrote are not supposed to be used by us, but by other users!

How about we try to look into this problem from the perspective of a *user* using our library crate? Suppose that we are a *user*, and we are creating a binary crate with the following code in the `main.rs` file
```rust
// Listing 4
// main.rs
extern crate library_crate_example;

fn main() {
    library_crate_example::outer::func_1();
    library_crate_example::outer::inner::func_2();
}
```
Here, we used `extern crate` to bring the external library crate `library_crate_example` into scope. Then, we tried to call `outer::func_1()` and `outer::inner::func_2()`.

If we try to run `cargo build` now, Rust will return us the following error message:
```
$ cargo build
warning: function `func_1` is never used
 --> src\outer\mod.rs:1:4
  |
1 | fn func_1() {
  |    ^^^^^^
  |
  = note: `#[warn(dead_code)]` on by default

warning: function `func_2` is never used
 --> src\outer\inner.rs:1:4
  |
1 | fn func_2() {
  |    ^^^^^^

warning: `library_crate_example` (lib) generated 2 warnings
   Compiling library_crate_example v0.1.0 (C:\Users\user\projects\library_crate_example)
error[E0603]: module `outer` is private
 --> src\main.rs:4:24
  |
4 |     library_crate_example::outer::func_1();
  |                        ^^^^^ private module
  |
note: the module `outer` is defined here
 --> C:\Users\user\projects\library_crate_example\src\lib.rs:5:1
  |
5 | mod outer;
  | ^^^^^^^^^

error[E0603]: module `outer` is private
 --> src\main.rs:5:24
  |
5 |     library_crate_example::outer::inner::func_2();
  |                        ^^^^^ private module
  |
note: the module `outer` is defined here
 --> C:\Users\user\projects\library_crate_example\src\lib.rs:5:1
  |
5 | mod outer;
  | ^^^^^^^^^

For more information about this error, try `rustc --explain E0603`.
error: could not compile `library_crate_example` due to 2 previous errors
```

Take note of this part of the error message,
```
error[E0603]: module `outer` is private
 --> src\main.rs:4:24
  |
4 |     library_crate_example::outer::func_1();
  |                        ^^^^^ private module
```
which is saying that the `outer` module is private. What this means is that we are trying to access `outer` but `outer` can only be used within its own module, which is `library_crate_example`. I hope you can picture how, if we fixed this error for `outer`, we will still get the same error for `inner`, because within our `main` function,
```rust
// Listing 5
// main.rs
...
library_crate_example::outer::inner::func_2();
...
```
we tried to call `func_2()` of `inner`. So, then, Rust will tell us that is not possible, because `inner` is private: it is only be used within its own module, which is `outer!`

To simplify what is going on here, take a look at the following module hierarchy for our `library_crate_example` project
```
library_crate_example
-- outer
---- inner
```
- the parent module for `outer` is `library_crate_example`, so it can only be used within `library_crate_example`
- the parent module for `inner` is `outer` so it can only be used within `outer`.

## Making a module or function public
To make a module or function public, we use the `pub` keyword as a prefix, like so:
```rust
// Listing 6
pub mod module_name;

pub fn function_name() {
    // code
}
```

Following our `library_crate_example` example projec above, we can make make `func_1` and `func_2` accessible by our binary crate by publicizing its way to it. To illustrate what I mean, see the following module diagram:
```
lib.rs (PRIVATE 'outer' is here )
-- outer/mod.rs (PRIVATE 'func_1' and PRIVATE 'inner' is here)
---- outer/inner.rs (PRIVATE 'func_2' is here)

main.rs
```
As we can see, `func_1` can only be used within its parent module `lib.rs`. So, to make it accessible by an external module, our binary crate, `main.rs`, we have to publicize its way to it.

1. We make the function `func_1` public.
    ```rust
    // Listing 7
    // outer/mod.rs
    pub fn func_1() {
    }
    ```
2. We make the module `outer` public.
    ```rust
    // Listing 8
    // lib.rs
    pub mod outer;
    ```

Now, if we run `cargo build`, the error for `func_1` will go away, leaving only the errors for `func_2`!
```
cargo build
   Compiling library_crate_example v0.1.0 (C:\Users\user\projects\library_crate_example)
warning: function `func_2` is never used
 --> src\outer\inner.rs:1:4
  |
1 | fn func_2() {
  |    ^^^^^^
  |
  = note: `#[warn(dead_code)]` on by default

warning: `library_crate_example` (lib) generated 1 warning
error[E0603]: module `inner` is private
 --> src\main.rs:5:31
  |
5 |     library_crate_example::outer::inner::func_2();
  |                               ^^^^^ private module
  |
note: the module `inner` is defined here
 --> C:\Users\user\projects\library_crate_example\src\outer\mod.rs:4:1
  |
4 | mod inner;
  | ^^^^^^^^^

For more information about this error, try `rustc --explain E0603`.
error: could not compile `library_crate_example` due to previous error
```

So, let's do the same for `func_2`.
1. We make the function `func_2` public
    ```rust
    // Listing 9
    // outer/inner.rs
    pub fn func_2() {
    }
    ```
2. We make the module `inner` public
    ```rust
    // Listing 10
    // outer/mod.rs
    pub mod inner;
    ```
3. We make the module `outer` public *(we can omit this, because we already made `outer` public)*
    ```rust
    // Listing 11
    // lib.rs
    pub mod outer;
    ```

Now, the error messages for `func_2` will go away as well and our program will compile successfully!
