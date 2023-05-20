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

Read the next section “Anatomy of a Rust Program” to review what goes under the hood

### Anatomy of a Rust Program

In the following code:

```rust
fn main() {
    println!("Hello, World!");
}
```

- ***fn*** declares a function
- ***()*** is where you would usually insert parameters. The function has no parameters if there is nothing inside ***()***.
- ***{}*** defines the start and end of the function body. It is conventional to write the opening curly bracket ***{*** in the same line as the function declaration ***fn*** and spaced apart from the ***()*** by 1.
- ***!*** denotes that a macro is being called instead of a normal function