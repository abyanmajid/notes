# Bootstrapping

**Definition:** Bootstrapping is a non-parametric statistical resampling method which involves repeatedly taking random samples (with replacement) from an original dataset, and compute a stastistic (e.g., mean, median, etc) for each resample.

**Purpose:** The goal of bootstrapping is to create an empirical distribution of a statistic of interest (and this is called a bootstrap distribution), without assumping an underlying population distribution such as normality, and it even works with small datasets where CLT doesn't apply! 

**Specific use cases:**

- Estimating standard error e.g., for means, medians
- Constructing confidence intervals for statistics
- Assessing variability and bias correction of estimators

**How to do it:**

1. From a dataset of size $n$, take a random sample of size $n$ with replacement
2. Compute the statistic of interest e.g., mean
3. Repeat (1) and (2) many times e.g., 10,000 iterations
4. Tada, you now have an empirical/boostrapped distribution of the statistic of interest



