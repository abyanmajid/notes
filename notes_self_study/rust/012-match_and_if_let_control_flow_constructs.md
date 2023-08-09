# `match` and `if let` Control Flow Constructs

*Date written: June 7, 2023* \
*By: Abyan Majid*

- [`match` and `if let` Control Flow Constructs](#match-and-if-let-control-flow-constructs)
  - [`match` vs. `if let`](#match-vs-if-let)
  - [The `match` control flow construct](#the-match-control-flow-construct)
    - [Using `match` on an enum variant](#using-match-on-an-enum-variant)
    - [Safe handling of the `Option` enum](#safe-handling-of-the-option-enum)
  - [The `if let` control flow construct](#the-if-let-control-flow-construct)
    - [Using `if let` on enums](#using-if-let-on-enums)

`match` and `if let` are control flow constructs that are used for pattern matching. 

## `match` vs. `if let`
The primary difference between `match` and `if let` is that `match` is used to compare a value against multiple patterns. Meanwhile, `if let` is a less verbose way to compare a value against ONE pattern. Here's an illustration:

```rust
// Matching against ONE pattern using `match`
fn main() {
    let x = Some(u8);
    match x {
        Some(5) => println!("Five"),
        _ => (),
    }
}

// Matching against ONE pattern using `if let`
fn main() {
    if let Some(5) = x {
        println!("Five")
    }
}
```
You can see from the illustration above that the code with `match` needed to include `let x Some(u8)` and a boilerplate `_ => ()` in order to only match a value against ONE pattern. Meanwhile, the `if let` code is shorter and more concise.

## The `match` control flow construct

The `match` control flow constructs allows you to compare a value against (usually) multiple patterns and execute code based on which pattern matches. To illustrate, take a look at the example below.

```rust
fn main() {
    let grade = 'A';

    match grade {
        'A' => println!("Excellent!"),
        'B' => println!("Good"),
        'C' => println!("Average"),
        'D' => println!("Below Average"),
        'F' => println!("Failed"),
        _ => println!("Invalid grade"),
    }
}
```
In this example, `match` was used to match the value of `grade`, which is `A`, against 5 different patterns `A`, `B`, `C`, `D`, and `F`. As you can see, there is also `_`, which is a default pattern of which associated code is executed if `grade` does not match any patterns that has been explicitly stated beforehand. The default pattern was not used here, because `grade` matched the pattern `A`, so its associated code was executed and outputted to the terminal:
```
Excellent!
```

### Using `match` on an enum variant
The `match` control flow construct can also be used on an enum value. Here's an example:
```rust
enum Weather {
    Sunny,
    Cloudy,
    Rainy,
}

fn main() {
    let today_weather = Weather::Rainy;

    match today_weather {
        Weather::Sunny => println!("It's sunny today!"),
        Weather::Cloudy => println!("It's cloudy today!"),
        Weather::Rainy => println!("It's rainy today!"),
    }
}
```
In this example, we assigned the variant `Rainy` from the `Weather` enum to variable `today_weather`. Then, we used `match` to match `today_weather` against `Weather::Sunny`, `Weather::Cloudy`, and `Wheather::Rainy`. As you may have realized, this code will output the following to the terminal:
```
It's sunny today!
```
However, you may have also noticed the absensce of the default pattern (i.e. `_ => some_code`). In this case, we did not need to include a default pattern because the `Weather` enum has only three variants - `Sunny`, `Cloudy`, and `Rainy` - all of which has been explicitly stated as the patterns that `today_weather` will be matched against.

### Safe handling of the `Option` enum

Below is a code taken from <a href="https://github.com/abyanmajid/study-notes/blob/main/notes_self_study/rust/011-enums.md">***011-enums.md***</a>.

```rust
fn main() {
    let option: Option<i32> = None;
    
    let value: i32 = option; // Compilation error: mismatched types
    println!("Value: {}", value);
}
```
**Review of what's going on here —** We tried to assign the `None` variant of the `Option` enum to a variable that only accepts values of type `i32`.

Now here's a code that demonstrates how we can utilize the `match` control flow construct to safely handle variants of `Option`, such that errors like the one produced by the code above will be prevented.
```rust
fn main() {
    let option: Option<i32> = None;

    let value: i32 = match option {
        Some(val) => val,
        None => 0,
    };

    println!("Value: {}", value);
}
```
Here, we used `match` to assign a value to `value` depending on which pattern matches. The line of code that is particularly of interest to us is `None => 0` - this line assigns `0` in the event that `option` matches the pattern `None` (which it obviously did). 

`0` could be replaced by any value, but I hope you realized the point: `match` allowed us to assign a custom value to mitigate the "mismatch" compilation error when trying to assign `None` to a variable that only accepts `i32`.

## The `if let` control flow construct

To put it simply, `if let` is the same as `match`, with the exception that it specifically exists for matching a value against ONE pattern. Review the earlier section "***`match` vs. `if let`***" if you do not yet understand the difference between the two control flow constructs.

Here's a simple example of pattern matching using `if let`:
```rust
fn main() {
    let guess: u32 = 30;

    if let 30 = guess {
        println!("Wow, you correctly guessed Johan's age!");
    } else {
        println!("Wrong!");
    }
}
```
In this example, we have a variable `guess` which is assigned an integer `30`. Then, we used `if let` to match `guess` against the pattern `30` - Johan's actual age. Obviously `guess` matched `30`, so the program will print the following to the terminal.
```
Wow, you correctly guessed Johan's age!
```
Had `guess` been any other number than `30`, the program would have printed `Wrong!` instead.

### Using `if let` on enums
It works the same way as without enums, except the pattern to which the value is matched against has to be a variant of the enum. In the following example, we have a variable `forecast` which holds the variant `Rainy` of the `Weather` enum.
```rust
enum Weather {
    Sunny,
    Cloudy,
    Rainy,
}

fn main() {
    let forecast = Weather::Rainy;

    if let Weather::Rainy = forecast {
        println!("There will be rain tomorrow.");
    } else {
        println!("Tomorrow will be sunny or cloudy.");
    }
}
```
We matched `forecast` against a pattern `Rainy`. Since the pattern matched, the program printed,
```
There will be rain tommorow.
```
to the terminal. Had `forecast` been another variant or value, or had `forecast` been matched to a different variant, the program would have printed
```
Tommorow will be sunny or cloudy.
```
to the terminal instead.

Simply put, `if let` is just a less verbose way than `match` to match a value against ONE pattern than.