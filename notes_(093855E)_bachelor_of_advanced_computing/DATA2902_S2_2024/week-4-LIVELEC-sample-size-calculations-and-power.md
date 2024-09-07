# Week 4 - Sample Size Calculations and Power LIVELEC Data2902

### Errors in Hypothesis Testing (Type I and Type II)

<img width="396" alt="image" src="https://github.com/user-attachments/assets/8f0d72d2-6277-4c7c-896b-2fa4a36c7984">

Taking the example of innocence vs. guilty where $H_0$ states that the person is innocent:

- **Type I Error**e ($\alpha$): Rejecting $H_0$, but $H_0$ is actually correct. That is, we conclude the person is guilty, when in fact they are innocent.
- **Type II Error** ($\beta$): NOT rejecting $H_0$, but $H_0$ is actually incorrect. That is, we conclude the person is innocent, when in fact they are guilty.
- **Power:** $1-\beta=P(\text{reject }H_0|H_1\text{ true})$

The **power** of a test is the probability that the test rejects the null hypothesis, $H_0$, when a specific alternative hypothesis $H_1$ is true.

**Why allow false alarms at all?** Because if we make it really small, we would never reject anything, even when we should.

### Beer example: Power

Suppose the sample SD is INDICATIVE of the TRUE POPULATION SD

We want to plot power function of the test as a function of $\mu$

First, let us assume the "true" $\sigma$ is equal to the sample value.

```r
x <- c(374.8, 375.0, 375.3, 374.8, 374.4, 374.9)
sig <- sd(x)
sig
```

Given that we pick $H_0:\mu=375$

<img width="387" alt="image" src="https://github.com/user-attachments/assets/ce8db36e-0f3c-4e83-be37-2edc7ae31256">

The further the true mean $\mu$ is from the value $\mu_0$ picked for $H_0$, the more likely we are to reject.

**Discrepancy needed to achieve a certain power**

<img width="376" alt="image" src="https://github.com/user-attachments/assets/bc313ee1-d5e6-482d-b15c-2aff1b84e1e0">

### How to do Powers in R

```r
# install.packages("pwr")
library(pwr)
```

The key functions:

- `pwr.t.test()` t-tests (one sample, 2 sample, paired)

```r
pwr.t.test(n = NULL, d = NULL, sig.level = 0.05, power = NULL,
           type = c("two.sample", "one.sample", "paired"),
           alternative = c("two.sided", "less", "greater"))
```

- `pwr.t2n.test()` t-test (two samples with unequal $n$)

```r
pwr.t2n.test(n1 = NULL, n2 = NULL, d = NULL,
             sig.level = 0.05,
             power = NULL,
             alternative = c("two.sided , "less", great"))
```

### Cohen's $d$

Cohen suggests that $d$ values of 0.2, 0.5, qnd 0.8 represent small, and large effect sizes respectively.

$$d=\frac{|\mu_1-\mu_2|}{\sigma}$$



