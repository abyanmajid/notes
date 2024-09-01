# Week 4 PREREC-2 (Critical values, rejection regions, and confidence intervals)

### Random variable basics

A random variable can be thought of as a mathematical object which takes certain values with certain probabilities

A simple discrete random variable $X$ can be though of a _single random_ draw from a box containing tickets, each with numbers written on them. In this case,

- $E(X)=\mu$ (the avg. of the numbers)
- $Var(X)=\sigma^2$ (the pop. variance of the numbers)
- $SD(X)=\sigma$

### Random sample with replacement

A random sample of size $n$ with _replacement_, denoted $X_1,X_2,...,X_n$, means that one of all possible samples of size $n$ is chosen in such a way that each is equally likely.

These $X_i$'s are actually INDEPENDENT and IDENTICALLY DISTRIBUTED. This means:

- Each $X_i$ has the same distribution as a single draw
- The $X_i$'s are all mutually independent

Consider now taking the total $T=\sum^n_{i=1}X_i$.

**What is $E(T)$?**

The expected sum is always the sum of the expectations. Recall that if $E(X)=\mu$, then

$$E(T)=E(X_1+...+X_n)=E(X_1)+...+E(X_n)=\mu+...+\mu=n\mu$$

**What is $Var(T)$**

