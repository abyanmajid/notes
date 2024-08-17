# Week 3 DATA2902 Lab Solutions

## 3.1 Dishonest Dice

```r
n <- 4
x <- 0:4
observed_y <- c(1, 15, 42, 32, 10)
p <- 1/2

binomial_probs = dbinom(x, size = n, prob = p)
expected_y <- binomial_probs * sum(observed_y)

t_0 <- sum((observed_y - expected_y)^2 / expected_y)

df <- length(x) - 1

p_val <- pchisq(t_0, df, lower.tail = F)

paste("test statistic:", t_0)
paste("p-value:", round(p_val, 4))
```

## 3.2 Mammograms

```r
x <- matrix(c(10, 20, 90, 99980), ncol = 2)

rr <- (10 * (20 + 99980)) / (20 * (10 + 90)) 
rr

## using mosaic::relrisk
# 1/mosaic::relrisk(x)

# women with a positive mammogram are 500 times more likely to develop breast
# cancer than women with a negative mammogram


or <- (10 * 99980) / (90 * 20)
or


## using mosaic::oddsRatio
# 1/mosaic::oddsRatio(x)

# the odds of developing breast cancer is 555.4 higher given a positive 
# mammogram compaerd to a negative mammogram result.

se <- sqrt(1/10 + 1/90 + 1/20 + 1/99980)
se

ub <- exp(log(or) + 1.96 * se)
lb <- exp(log(or) - 1.96 * se)

ci <- c(lb, ub)
ci

1 >= ci[1] & 1 <= ci[2]

# 1 is not in CI, so there is statisticlly significant association.
```

## 3.3 Soccer goals

```r
goals <- c(
  1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 2, 2, 4, 0, 10,
  0, 1, 1, 2, 3, 0, 4, 1, 3, 6, 0, 1, 0, 10, 1,
  2, 1, 0, 1, 1, 2, 3, 3, 3, 1, 2, 0, 0, 0, 0,
  1, 1, 1, 1, 1, 2, 0, 1, 0, 2, 2, 0, 1, 2, 1,
  1, 0, 1, 1, 0, 2, 2, 1, 0, 5, 2, 1, 4, 1, 1,
  0, 0, 1, 3, 0, 1, 0, 1, 2, 2, 0, 2, 1, 1, 1,
  0, 1, 0, 1, 2, 1, 2, 0, 2, 1, 0, 1, 5, 2
)

lambda <- mean(goals)
expected_probs <- dpois(x, lambda)
expected_y <- expected_probs * n

# Identify categories with expected frequency < 5
low_freq_indices <- which(expected_y < 5)
smallest_high_freq_index <- which.min(expected_y[expected_y >= 5])

# Combine low-frequency categories into the smallest high-frequency category
combined_observed <- observed_y
combined_expected <- expected_y

combined_observed[smallest_high_freq_index] <- sum(observed_y[low_freq_indices]) + observed_y[smallest_high_freq_index]
combined_expected[smallest_high_freq_index] <- sum(expected_y[low_freq_indices]) + expected_y[smallest_high_freq_index]

# Remove low-frequency categories
combined_observed <- combined_observed[-low_freq_indices]
combined_expected <- combined_expected[-low_freq_indices]

# Calculate the chi-squared statistic
t_0 <- sum((combined_observed - combined_expected) ^ 2 / combined_expected)
t_0
```
