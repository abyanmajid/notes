# Rust Setup and Hello, World!

- [Rust Setup and Hello, World!](#rust-setup-and-hello-world)
  - [Installation](#installation)
    - [Updating rust](#updating-rust)
    - [Uninstalling rust](#uninstalling-rust)
    - [Creating a new rust project](#creating-a-new-rust-project)
    - [Comments in rust](#comments-in-rust)
    - [Indentation in rust](#indentation-in-rust)
  - [Hello, World! Program](#hello-world-program)
    - [Without cargo](#without-cargo)

## Installation

For Windows:

1. Navigate to the following link: [https://www.rust-lang.org/en-US/install.html](https://www.rust-lang.org/en-US/install.html)

1. Download C++ Build Tools for Visual Studio 2013 or later. Easiest way is to install the build tools directly. Alternatively, you can install Visual Studio 2017, 2015, or 2013 and during the installation select the desktop development with C++ workload
2. Run the rustup executable file downloaded from the link in point (1)

### Updating rust

```powershell
$ rustup update
```

### Uninstalling rust

```powershell
$ rustup self uninstall
```

### Creating a new rust project

Without cargo:

1. Create a new directory

```powershell
> mkdir "%USERPROFILE%\projects"
> cd /d "%USERPROFILE%\projects"
> mkdir hello_world
> cd hello_world
```

1. Write code
2. Compiling and running

```rust
$ rustc main.rs 
$ .\main.exe
```

**NOTE: Always use “ instead of ‘ when defining strings**

```rust
fn main() {
    println!("Hello, world");
}
```

### Comments in rust

Use // to write comments in rust. For example:

```rust
// hello, world !
// this is a comment !
```

### Indentation in rust

Four spaces, not tab.

## Hello, World! Program

### Without cargo

First, create a rust source file with “**.rs”** extension after the file name.

```powershell
# Creating a rust source file via windows command line
$ mkdir "project_name"
$ cd "project_name"
$ type nul > main.rs
```

Now, write the hello world program like so:

```rust
fn main() {
    println!("Hello, World!");
}
```

Lastly, compile and run

```powershell
$ rustc main.rs
$ .\main.exe
>> Hello, World!
```