# Week 2 pre-recorded lecture PR03 (DATA2902)

**Case study - Radiation exposure:**

<img width="307" alt="image" src="https://github.com/user-attachments/assets/1eb79b2b-9c1e-47e1-b7de-6b588ce93ca6">

**Poisson Distribution:**

A **Poisson** random variable represents the probability of a given number of events occurring in a fixed interval (e.g., number of events in a fixed period of time). If these event occur independently with some known average rate $\lambda$ per unit time.

If $X$ is a Poisson random variable with rate paramter $\lambda$, the probability mass function is:

$$\displaystyle P(X=k)=e^{-\lambda}\frac{\lambda^k}{k!}\text{, }k=0,1,2,...$$

Plotting Poisson distributions (Assume $\lambda=6, n = 10000$):

```r
rpois(n = 10000, lambda = 6) |>
  table() |>
  plot(ylab = "Count")
```

<img width="304" alt="image" src="https://github.com/user-attachments/assets/dd40a34a-def7-4405-9cfb-9f7ee722a259">

**Chi-squared tests for discrete distributions:**

This is the _general_ chi-squared GOF test with test statistic,

$$\displaystyle T=\sum^k_{i=1}\frac{(Y_i-e_i)^2}{e_i}=\sum^k_{i=1}\frac{(Y_i-np_i)^2}{np_i}$$

where $i=1,2,...,k$ iterates over the distinct outcomes.

HOWEVER, the model parameters $\theta_1, \theta_2,..., \theta_h$ are usually unknown and have to be estimated from sample. In this case, the expected probabilities $p_i$ should be replaced by their estimates $\hat{p}_i$. Then, the observed test statistic is:

$$\displaystyle t_0 = \sum^k_{i=1}\frac{(y_i-n\hat{p}i)^2}{n\hat{p}_i}$$

and the approximate p-value is

$$P(\chi^2_{k-1-q}\geq t_0)$$

Where $k-1-q$ is the degrees of freedom, with $q$ being the number of parameters we need to estimate.

**Example with Radiation Exposure:**

Let $X$ be a random variable such that $X~\text{Poisson(}\lambda\text{)}$

Let $y_i$ be the observed frequency of outcome $i$

The expected probabilities $p_i$ are given by the probability mass function,

$$\displaystyle P(X=i)=p_i=e^{-\lambda}\frac{\lambda^i}{i!}\text{ for }i=0,1,2,...$$

where $p_i$ denote the probability of a number of chromosome aberrations in the $i$-th category.

Note that for a Poisson distribution, we have $E(X)=Var(X)=\lambda$

Finding test statistic,

<img width="402" alt="image" src="https://github.com/user-attachments/assets/a8ebc640-a751-4c96-a72e-a141f060eacf">

We need to estimate $\lambda$ by the sample mean,

$$\hat{\lambda}=\overline{x}=248/278=0.89$$

**Poisson Distribution in terms of Hypothesis Testing Framework:**

<img width="350" alt="image" src="https://github.com/user-attachments/assets/6e0bc4d9-9baa-4075-8560-13735e7890bf">

**Doing test for Poisson Distribution manually in R**

```r
y = c(117, 94, 51, 15, 0, 0, 0, 1) # input the observed counts
x = 0:7 # define the corresponding groups
n = sum(y) # sample size
k = length(y) # number of groups
(lam = sum(y * x) / n) # estimate the lambda parameter
```

```r
p = dpois(x, lambda = lam) # obtain the p_i from the Poisson probability mass function
p
```

```r
p[8] = 1 - sum(p[1:7]) # redefine the 8th element P(>=7) NOT P(7)
round(p, 5)
```

```r
(ey = n * p) # calculate the expected frequencies
```

```r
ey >= 5 # check assumption e_i >= 5 not all satisfied
```

```r
(yr = c(y[1:3], sum(y[4:8]))) # reduced category counts
```

```r
(eyr = c(ey[1:3], sum(ey[4:8]))) # reduced category expected cell counts
```

```r
all(eyr >= 5) # check that all expected cell counts are >= 5
```

```r
(pr = c(p[1:3], sum(p[4:8]))) # reduced category hypothesised probabilities
```

```r
kr = length(yr) # number of combined classes # number of combined classes
(t0 = sum((yr - eyr) ^ 2 / eyr)) # test statistic
```

```r
(pval = 1 - phcisq(t0, df = kr - 1 - 1)) # p-value
```

Computing p-value automatically using R:

```r
chisq = chisq.test(yr, p = pr)
chisq$statistic # the test statistic
pchisq(unname(chisq$statistic), df = 2, lower.tail = FALSE) # p-value
```
