# Error Handling

- [Error Handling](#error-handling)
  - [Handling unrecoverable errors with `panic!`](#handling-unrecoverable-errors-with-panic)
    - [Unwinding or Aborting](#unwinding-or-aborting)
    - [`panic!` should preferably never occur!](#panic-should-preferably-never-occur)
  - [Handling recoverable errors with `Result`](#handling-recoverable-errors-with-result)

This note will cover how Rust handles unrecoverable errors using the `panic!` macro and how error handling can and should be done in Rust using `Result`.

## Handling unrecoverable errors with `panic!`
In Rust, the `panic!` macro is used to handle unrecoverable errors. So, you ought to realize that if a `panic!` occured - which you can observe from the error message printed to the terminal - there must be something severely wrong with your code and your program cannot safely continue its execution.

Here's an example of code that forces Rust to call a `panic!`:
```rust
fn main() {
    let v = vec![1, 2, 3];

    v[10];
}
```
Here, we're trying to access 11th element of vector `v`. But there is no such element in the 11th position of `v`! So, `panic!` occurs.
```
$ cargo run
   Compiling panic v0.1.0 (file:///projects/panic)
    Finished dev [unoptimized + debuginfo] target(s) in 0.27 secs
     Running `target/debug/panic`
thread 'main' panicked at 'index out of bounds: the len is 3 but the index is
99', /checkout/src/liballoc/vec.rs:1555:10
note: Run with `RUST_BACKTRACE=1` for a backtrace.
error: Process didn't exit successfully: `target/debug/panic` (exit code: 101)
```

### Unwinding or Aborting
Rust provides two mechanisms for handling a `panic!`:
- ***Unwinding*** (default): By default, Rust will unwind the program. What this means is that Rust will walk back through the stack and deallocates every data from every function it passes by. 
- ***Aborting***: Alternatively, you may instruct Rust to immediately abort upon the occurrence of a `panic!`, by adding `panic = 'abort'` under the `profile` section in `Cargo.toml`, like so:
```toml
[profile release]
panic = 'abort'
```
### `panic!` should preferably never occur!
Unwinding usually takes a lot of time, so you may prefer to abort. However, you should also know that aborting means that you would terminate your program without cleaning up data stored by your program in the memory. Both of these are not nice things to have for both the user and you, the developer. 

So realistically, a `panic!` should NEVER occur! In other words, every error should be recoverable. You can see `panic!` as an indication of bad programming - especially bad error handling!

In every situation, you are highly encouraged to handle every error with the `Result` type rather than `panic!`

## Handling recoverable errors with `Result`
`Result`