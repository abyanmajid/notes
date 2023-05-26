# Cargo

*Date written: May 26, 2023* \
*By: Abyan Majid*

Cargo is Rust's package manager - it allows you to manage the dependencies, building, testing, and publishing of your Rust project.

## Things you can do with Cargo

### Creating a new project with Cargo
To create a new Rust project with Cargo, run the following in the terminal (rename ***my_project*** accordingly):

```shell
$ cargo new my_project
```
This command will generate the basic structure of a Cargo-managed Rust project, where a ***my_project*** directory will be created at the path where you ran the command and it contains the following:
- A ***Cargo.toml*** file - which is a manifest file where you will list the metadata of your project below the *[package]* segment, and the dependencies below the *[dependencies]* segment.
- A ***src*** directory, inside of which lies ***main.rs***, the entry point for writing Rust code.
- Your usual ***.gitignore*** and ***README.md*** files

### Compiling code to build, run, test, or publish your project

#### For building:
- Run `$ cargo build` to build and compile your Rust project. This command will produce an executable binary file at the ***target/debug*** directory.
- Alternatively, run `$ cargo run` to build and compile your Rust project, AND to immediately execute the binary file.
- Alternatively (2), run `$ cargo build --release` to build your project for release, which lets Cargo optimize it for performance. The executable binary will be created at the ***target/release*** directory.

#### For testing:
Run `$ cargo test` to check if there are bugs or unintended changes that might have been introduced during the development process. When ran, this command will search for functions marked with the ***#[cfg(test)]*** attribute, executes them, and reporting whether each passed or failed.


#### For publishing to crates.io:
  Run `$ cargo publish` to publish your Rust crate to the crates.io repository.