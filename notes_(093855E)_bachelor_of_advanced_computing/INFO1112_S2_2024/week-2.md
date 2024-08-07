# Week 2 INFO1112 Lecture

**Variables in Shell scripting:**

```sh
VARIABLE=value
NAME=bob

echo $NAME
```

**Write echo into a file:**

```sh
echo hello, world > file.txt
cat file.txt
a=file.txt
echo $a
```

**Expressions in shell:**

```sh
A=1
expr $A + 1
```

**Backquotes for replacing with output:**

Backquotes make the command enclosed with it return the output.

We can use this to return computation expressions into some variable

```
A=1
res=`expr $A + 1`
echo $res
```
