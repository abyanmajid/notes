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

As an aside, for any random variable $X$ and any constant $c$, we can just move the $c$ to the front (because it's not random)

$$E(cX)=cE(X)$$

**What is $Var(T)$**

The variance of a sum is NOT alwasy the sum of the variances. HOWEVER, it IS if the $X_i$'s are INDEPENDENT. In which case,

$$Var(T)=Var(X_1+...+X_n)=Var(X_1)+...+Var(X_n)=\sigma^2+...+\sigma^2=n\sigma^2$$

As an aside, for any random variable $X$ and any constant $c$, we have

$$Var(cX)=c^2Var(x)$$

### Sample Mean

Consider the sample $\overline{X}=\frac{1}{n}\sum^n_{i=1}X_i=\frac{1}{n}T$

Since $\overline{X} = \frac{1}{n}T$, then

$$E(\overline{X})=E(\frac{1}{n}T)=\frac{1}{n}E(T)=\frac{1}{n}n\mu=\mu$$

$$Var(\overline{X})=Var(\frac{1}{n}T)=(\frac{1}{n})^2Var(T)=\frac{1}{n^2}n\sigma^2=\frac{\sigma^2}{n}$$

### Standard error, and estimating $\mu$

<img width="431" alt="image" src="https://github.com/user-attachments/assets/dc65dbc0-a465-4e10-b526-44dbaddb74f3">

<img width="429" alt="image" src="https://github.com/user-attachments/assets/c1b549f4-5b44-4ac0-8d5e-569cafcd5b1a">

### Estimating standard error

<img width="418" alt="image" src="https://github.com/user-attachments/assets/bd65120b-b947-44ab-a6d6-3b44c6a53777">

<img width="432" alt="image" src="https://github.com/user-attachments/assets/76f2d426-aad5-4eed-a888-140d8dc71d26">

### More precise inference for $\mu$

<img width="434" alt="image" src="https://github.com/user-attachments/assets/31accaa7-a18f-4f90-9400-574b9adc5924">

<img width="436" alt="image" src="https://github.com/user-attachments/assets/54cadcca-5f6d-4b68-9b9d-59b0573dded0">

<img width="432" alt="image" src="https://github.com/user-attachments/assets/0ff13479-5b2f-4fb5-8ac5-ffedbe81cee5">

 <img width="428" alt="image" src="https://github.com/user-attachments/assets/62086e7b-5ec5-4cea-bd04-64108e767619">





