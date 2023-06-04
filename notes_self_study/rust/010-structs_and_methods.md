# Structs and Methods

*Date written: May 30, 2023* \
*By: Abyan Majid*

- [Structs and Methods](#structs-and-methods)
  - [Structs](#structs)
    - [Defining structs and creating instances](#defining-structs-and-creating-instances)
    - [Creating instances from other instances with the *Struct Update Syntax*](#creating-instances-from-other-instances-with-the-struct-update-syntax)
    - [Tuple structs without name fields to create different types](#tuple-structs-without-name-fields-to-create-different-types)
  - [Methods](#methods)

## Structs
A ***struct*** is a user-defined data type that allows you to create custom data structures by grouping together multiple values under a single name. Like tuples, structs allow you to group together multiple values of different types. But unlike tuples, each value in a struct are not accessed by their indexes, but directly by their name.

It's similar to a blueprint, in that a ***struct*** in Rust is simply a container that allows you to group related data together.

### Defining structs and creating instances
Suppose that you are working on a program that manages the profile of students, and for each student, you need to store their name, age, and grade. This is where structs come in handy. Below is a simple example of a process of defining and instantiating a struct.

```rust
struct Student {
    // Defining a new struct 'Student'
    name: String,
    age: u32,
    grade: u32,
}

fn main() {
    // Creating a 'Student' instance
    let student1 = Student {
        name: String::from("Johan"),
        age: 17,
        grade: 12,
    };
}
```
In this example, we defined a new struct `Student` that has the fields:
- `name`, which accepts a value of type `String`
- `age`, which accepts a value of type `u32`
- `grade`, which accepts a value of type `u32`

You may think of it as a blueprint for creating profiles of students, such that when you create a new student profile, you ought to enter an appropriate value for each field. And, you can see just an example of that within the `main` function, where we tried to create a new `Student` instance, bound to a variable `student1`. Now, `student1`'s profile is as follows:
- Name: `"Johan"`
- Age: `17`
- Grade: `12`

### Creating instances from other instances with the *Struct Update Syntax*
Sometimes, we might want to create a new instance that retains values of fields of an existing one, but with some fields modified. Rust provides a syntax for this, which is called the *Struct Update Syntax*, in order to reduce redundancy. Take a look at the following example:
```rust
struct Student {
    name: String,
    age: u32,
    grade: u32,
}

fn main() {
    let student1 = Student {
        name: String::from("Johan"),
        age: 17,
        grade: 12,
    };

    // Create a new student 'student2' with the Struct Update Syntax
    let student2 = Student {
        name: String::from("Tenma"),
        ..student1 // retains the remaining fields of student1
    };
}
```
In the example above, we have our `student1` instance, and then we tried to create another instance `student2` which copies all fields from `student1` as denoted by `..student1`. However, `..student1` excludes the `name` field from `student1`, because we let `name` to be modified to a new value: `"Tenma"`. That said, you can actually say that the line `..student1` copied over the *remaining* fields of `student1` that hadn't been modified beforehand.

### Tuple structs without name fields to create different types

Sometimes, we may want to define a struct that holds different types of values, but without named fields. These are called tuple structs. They are like tuples, but with their own distinct types. 

Usually, we opt for tuple structs when the positions of the fields are already meaningful. One example of such case is when trying to denote a point in the Cartesian plane - an example of that is shown below:

```rust
struct Point(f32, f32);

fn main() {
    let p = Point(2.5, 1.2);
    println!("coordinates = ({}, {})", p.0, p.1);
}
```
Here, we defined a tuple struct `Point` to represent a point in the Cartesian plane. It has two fields of type `f32` representing the `x` and `y` coordinates, respectively.

## Methods
Methods in Rust are functions that are associated with a particular *struct* (or *enum* or *trait*). They allow you to define behaviors or actions that can be performed on instances of a struct. Below is the syntax for a method associated with a struct.
```rust
impl StructName {
    fn method_name(&self, parameter1: Type_1, parameter2: Type_2, parameter_n: Type_n) -> ReturnType {
        // Method body
        // Return value (if any)
    }
}
```
Here's a breakdown of the syntax:
- `impl` is a keyword used to *implement* a function for a particular type, in this case a struct `StructName`
- `fn method_name` declares the name of the method
- `()` encloses the parameters accepted by the method
- `&self` is a special parameter that serves as a receiver of and represents the instance of the struct the method is being called on. In this case, it takes an immutable reference to the instance received by `self`. If you want to modify the struct using the method then you may specify `&mut self` instead.
- `parameter_1: Type_1, parameter_2: Type_2, parameter_n: Type_n` denote additional parameters, however many, that you may want your method to accept. Should there be none, you may just have `&self` or `&mut self` within `()`
- `-> ReturnType` This specifies the return type of the method. If the method doesn't return anything, you can use `()` to indicate the unit type.

Let us take a look at the following example in order to get a better understanding of methods and how they work with an instance of a struct.
```rust
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect1 = Rectangle { width: 5, height: 10 };

    println!(
        "Area: {} sq. px.",
        rect1.area()
    );
}
```

***Struct definition —*** In this case, we have a struct `Rectangle` which has fields `length` and `width`, each of type `u32`.
```rust
struct Rectangle {
    width: u32,
    height: u32,
}
```

***Method definition —*** We wanted to create a method that computes the area of a `Rectangle` instance (i.e. $A=width \times height$). So, inside `impl Rectangle`, we defined a function `area` which:
1. takes an immutable reference to the `Rectangle` instance to be received by `self`
2. performs `self.width * self.height`
3. outputs the result as a number of type `u32`
```rust
impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}
```
***Calling the method —*** Finally, we want to use the method to multiply the area of a rectangle we ought to provide. So first, we created `rect1` a `Rectangle` instance that has a width of `5` and height of `10`. Lastly, we called `rect1.area()` and printed the area.
```rust
fn main() {
    let rect1 = Rectangle { width: 5, height: 10 };

    println!(
        "Area: {} sq. px.",
        rect1.area()
    );
}
```
***Output —*** The entire code altogether outputs the following to the terminal:
```
Area: 50 sq. px.
```