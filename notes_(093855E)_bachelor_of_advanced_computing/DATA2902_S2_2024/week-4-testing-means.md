# Week 4 PREREC-1 Testing means

Some basic probability facts about samples from _normal populations_:

1. The sample mean from a normal sample is itself normally distributed
2. The sample variance from a normal sample has a _scaled_ $X^2$ distribution
3. The sample mean and sample variance from a normal sample are _statistically independent_
4. If $Z~N(0,1)$ is independent of a $X_d^2$ random variable, then the quantity $\displaystyle \frac{Z}{\sqrt{\chi^2_d/d}}~t_d$ is a $t$-distribution with $d$ degrees of freedom.

**Visualizing the mean:** We can use a boxplot to see the median, quartiles, etc, and this is useful for visualizing $t$ test problems.

### One sample $t$-test

Suppose we have a sample $X_1, X_2, ..., X_n$ of size $n$ drawn from a normal pop. with unknown variance $\sigma^2$. Let $x_1, x_2, ..., x_n$ be the observed values. We want to test the pop. mean $\mu$

<img width="475" alt="image" src="https://github.com/user-attachments/assets/13c5da4d-2834-4f2a-ab1c-8a0d9707e5bc">

**Example: Beer Contents**

<img width="243" alt="image" src="https://github.com/user-attachments/assets/1f693fe1-8690-4b17-9248-910335cbcba5">

Testing manually

```r
n = length(x)
t_0 = (mean(x) - 375) / (sd(x) / sqrt(n))
t_0

p_val = pt(t_0, n - 1)
p_val
```

Using `t.test()`

```r
t.test(x, mu = 375, alternative = "less")
```

### Two sample $t$-test

There's 2 ways you can have 2 samples:

- 2 independent samples
- 2 related samples e.g., measuring someone's blood, and then measuring their blood again after you give them a drug

<img width="361" alt="image" src="https://github.com/user-attachments/assets/09b5afd9-996d-4f96-af4f-3e4ba5496885">

```r
t.test(smokers, non_smokers, alternative = "two.sided", var.equal = TRUE)
```

NOTE: THIS ASSUMES EQUAL VARIANCE. If it does not seem reasonable to assume equal variance, then you can alternatively do the **Welch two-sample t-test**

### Welch two-sample $t$-test

<img width="425" alt="image" src="https://github.com/user-attachments/assets/faf1d7b4-3f42-4085-96ae-5511b76cf4a5">

But the Welch statistic is NOT a proper $t$-statistic since the denominator is not a scaled $\chi^2$ independent of the numerator. But the statistic stil has an approximately $t$-distribution where thedegrees of freedom isn't necessarily a whole number

We use `var.equal = FALSE` to denote a Welch 2-sample t-test (which is default)

```r
t.test(smokers, non_smokers, alternative = "two.sided", var.equal = FALSE)
```

### Paired samples $t$-test

This is sort of for "before" and "after" measurements e.g., samples of individuals before and after they smoked a cigarette to measure aggregation of blood platelets

```r
t.test(df$after, df$before, paired = TRUE)
```

or you can actually do a one-sample t-test on the differences (same thing!)

```r
t.test(df$difference)
```

<img width="433" alt="image" src="https://github.com/user-attachments/assets/11146ca2-9bbc-4976-93a3-326fe3c00789">
