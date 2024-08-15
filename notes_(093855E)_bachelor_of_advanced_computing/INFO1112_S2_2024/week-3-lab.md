# Week 3 INFO1112 Lab

**System processes**

The Unix system typically have over a hundred processes at any one time, very few of which are the ones started by the users, while the rest are SYSTEM PROCESSES.

**Running processes in the background**

Use `&` to run a process in the background.

```
sleep 10 &
`[1] 20746`
```

It will return a jobspec (e.g., `[1]`), which is an ID used to track the backgrounded processes. The jobspec MUST BE UNIQUE within that session.

**`bg` and `fg`**

`CTRL + Z` stops a currently running process without destroying it; it sends the proicess to sleep and prints its `jobspec`.

You can then use `bg` to start the process again in the background (it will run as if it was run with `&`)

`fg` can be used to run the process in the foreground.

`CTRL + C` kills a program.






